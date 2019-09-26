import math
import os
import re
import requests
import traceback

from flask import Flask, render_template, request, redirect, url_for, jsonify, session, make_response

from Utils.Pagetool import get_page
from Utils.SQLtool import SQLUtil
from api.tylt_baidu_aip import tylt_AipFace

app = Flask(__name__)
app.config["SECRET_KEY"] = '7f23059270db4a5686a9fd87662cb510'

"""
定义全局数据
"""


@app.context_processor
def result():
    mysql = SQLUtil()
    sql = "SELECT title,content FROM article"
    result = mysql.getMany(sql, 15)
    data = dict(
        result=result,
    )
    return data


@app.route('/', methods=['GET'])
def home():
    # user = sessions['username']
    if request.cookies.get('userID') is not None or 'un' in session:
        hide = 'none'
        show = 'block'
        username = request.cookies.get('userID') or session["un"]
        print(username)
        return render_template('index.html', user=username, hide=hide, show=show)
    else:
        hide = 'block'
        show = 'none'
        return render_template('index.html', hide=hide, show=show)


@app.route('/login/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        mysql = SQLUtil()

        sql = "SELECT * FROM user WHERE name='%s'" % username
        res = mysql.getAll(sql)
        mysql.dispose()
        if res == False:
            message = "您还没在本站进行注册！"
            return render_template('login.html', message=message)
        else:
            from werkzeug.security import generate_password_hash, check_password_hash
            if res[0]['name'] == username and check_password_hash(res[0]['password'], password):
                user = res[0]['name']
                while user is not None:
                    resp = make_response(redirect(url_for('home')))
                    resp.set_cookie('userID', user)
                    return resp

            else:
                message = "您输入的密码错误！"
                return render_template('login.html', message=message)
    else:
        return render_template('login.html')


@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('register.html')
    else:
        mysql = SQLUtil()
        username = request.form['username']

        from werkzeug.security import generate_password_hash
        password = generate_password_hash(request.form['password'])
        sql = "INSERT INTO user(name, password) VALUE ('%s','%s')" % (username, password)
        mysql.insertOne(sql)
        mysql.dispose()
        return render_template('login.html')


@app.route('/article', methods=['GET'])
def article():
    p = request.args.get('p','')

    show_shouye_status = 0
    if p == '':
        p = 1
    else:
        p = int(p)
        if p > 1:
            show_shouye_status = 1

    mysql = SQLUtil()
    sql0 = 'SELECT * FROM article LIMIT ' + str(p*10) + ',10'
    res = mysql.getAll(sql0)
    print(res)

    sql = "select count(id) as total from article"
    count = mysql.getOne(sql)['total']  # 总记录
    total = int(math.ceil(count / 10.0))  # 总页数

    dic = get_page(total, p)
    datas = {
        'p': int(p),
        'total': total,
        'show_shouye_status': show_shouye_status,
        'dic_list': dic
    }
    print(datas)
    mysql.dispose()
    return render_template('article.html', datas=datas,res=res)


@app.route('/editor', methods=['GET'])
def editor():
    return render_template('editor.html')


@app.route('/cancellation', methods=['GET'])
def cancellation():
    session.pop('un', None)
    response = make_response(redirect('/'))
    response.delete_cookie('userID')
    return response


# 录入人脸信息
@app.route('/entry_face/', methods=['GET', 'POST'])
def entry_face():
    mysql = SQLUtil()
    if request.method == 'POST':
        data = request.form.get('face-info')
        face_info = data.split('base64,')[1]
        aip = tylt_AipFace()
        face_detect_result = aip.face_detect(face_info)
        if face_detect_result['error_code'] != 0:
            return 'failed'
        face_num = face_detect_result['result']['face_num']
        if face_num == 0:
            return 'no_face'
        elif face_num != 1:
            return 'not_only_one_face'
        elif face_detect_result['result']['face_list'][0]['face_type']['probability'] < 0.9:
            return 'not_clear'
        else:
            try:
                sql = "UPDATE user SET face_info = '%s' where name= '%s' " % (face_info, 'tylt')
                mysql.update(sql)
                mysql.dispose()
                return 'success'
            except Exception as e:
                print(e)
                return '<h1>录入人脸时发生未知错误，请返回重试</h1>'
    return render_template('register_by_face.html')


# 人脸登录
@app.route('/sign_in_by_face/', methods=['GET', 'POST'])
def sign_by_face():
    mysql = SQLUtil()
    if request.method == 'POST':
        data = request.form.get('face-info')
        username = request.form.get('username')
        face_info = data.split('base64,')[1]
        aip = tylt_AipFace()
        try:
            sql = "SELECT face_info FROM user WHERE name='%s'" % username
            face_info_from_db = mysql.getOne(sql)  # 获取数据库中的人脸信息
            mysql.dispose()
            if not face_info_from_db['face_info']:
                return 'no_face_info'  # 数据库中没有人脸信息
            else:
                aip.face_constrast_img1 = face_info_from_db['face_info']
                aip.face_constrast_img2 = face_info
                contrast_result = aip.face_contrast()
                if contrast_result['error_code'] == 0 and contrast_result['result']['score'] >= 80:
                    session['un'] = username
                    return 'success'

        except Exception as e:
            print(e)
            return '<h1>服务器发生未知错误，请稍后重试</h1>'
    return render_template('sign_in_by_face.html')


# 注册用户名验证
@app.route('/resver/', methods=['GET'])
def username_check():
    if request.method == "GET":
        username = request.args["username"]
        mysql = SQLUtil()
        sql_user = "SELECT COUNT(name) FROM user WHERE name = '%s'" % username
        user_result = mysql.getOne(sql_user)

        if user_result['COUNT(name)'] == 0:
            print(jsonify({"user_exits": False}))
            return jsonify({"user_exits": False})
        else:
            print(jsonify({"user_exits": True}))
            return jsonify({"user_exits": True})

    else:
        return render_template("register_by_face.html")

@app.route('/persioncenter',methods=['GET'])
def persioncenter():
    return render_template('personal_center.html')

@app.route('/happybirthday', methods=['GET'])
def HappyBirthday():
    mysql = SQLUtil()
    sql = "SELECT content FROM birthdayarticle"
    result = mysql.getMany(sql, 20)
    print(result)
    return render_template("chinabirthday.html", result=result)


@app.route('/getimg',methods=['GET'])
def getimg():
    return render_template('repelitimg.html')


@app.route('/downloadphoto', methods=['POST'])
def dowmloadPic(html, startNum):
    keyword = request.form['search']
    kv = {
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36'}
    lastNum = 0

    pageId = 0
    # 爬取的页数
    for i in range(1):
        url = 'http://image.baidu.com/search/flip?tn=baiduimage&ie=utf-8&word=' + keyword + "&pn=" + str(
            pageId) + "&gsm=?&ct=&ic=0&lm=-1&width=0&height=0"
        pageId += 10
        result = requests.get(url, headers=kv)
        lastNum = dowmloadPic(result.text, keyword, lastNum)
    pic_url = re.findall('"objURL":"(.*?)",', html, re.S)
    i = startNum

    root = 'static/reptileimg/'
    print('找到关键词:' + keyword + '的图片，现在开始下载图片...')

    for each in pic_url:
        print('正在下载第' + str(i + 1) + '张图片，图片地址:' + str(each))
        path = root + '{0}.{1}'.format(str(i + 1), 'jpg')
        mysql = SQLUtil()
        sql = "INSERT INTO img(imgurl) VALUES ('%s')" % (path)
        mysql.insertOne(sql)
        try:
            if not os.path.exists(root):
                os.mkdir(root)
            if not os.path.exists(path):
                pic = requests.get(each, headers=kv, timeout=10)
                with open(path, 'wb') as f:
                    f.write(pic.content)
                    f.close()

        except:
            traceback.print_exc()
            print('【错误】当前图片无法下载')
            continue
        i += 1
    return i,render_template('repelitimg.html',path=path)







@app.route("/test")
def ip():
    ip = request.remote_addr
    return render_template("test.html", ip=ip)





if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
