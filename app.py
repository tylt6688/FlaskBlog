import math
import os
import re
import traceback
import requests

from flask import Flask, render_template, request, redirect, url_for, jsonify, session, make_response

from Utils.Pagetool import get_page
from Utils.SQLtool import SQLUtil
# from api.tylt_baidu_aip import tylt_AipFace

app = Flask(__name__)
app.config["SECRET_KEY"] = '7f23059270db4a5686a9fd87662cb510'

"""

"""


# 定义全局拦截器
# @app.before_request
# def myredirect():
#     if not request.path == '/login':
#         if request.cookies.get('userID') is not None or 'un' in session:
#             pass
#         else:
#             return render_template('index.html')


# 定义全局数据
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


@app.route('/search', methods=['POST'])
def search():
    keyword = request.form['keyword']
    mysql = SQLUtil()
    sql = "SELECT * FROM article WHERE title LIKE '%%%%%s%%%%'" % keyword
    res = mysql.getAll(sql)
    mysql.dispose()
    username = request.cookies.get('userID') or session["un"]
    return render_template('searchinfo.html', res=res, username=username)


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
            # cookie设置在这里！！！！
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
        username = request.form['username']
        passwordc = request.form['passwordc']

        mysql = SQLUtil()
        from werkzeug.security import generate_password_hash, check_password_hash
        password = generate_password_hash(request.form['password'])
        print(passwordc, password)

        if check_password_hash(password, passwordc):
            sql = "INSERT INTO user(name, password) VALUE ('%s','%s')" % (username, password)
            mysql.insertOne(sql)
            mysql.dispose()
            return render_template('login.html')
        else:
            message = "您输入的两次密码不相同，请重新输入"
            return render_template('register.html', message=message)


@app.route('/deleteuser')
def deleteuser():
    username = request.cookies.get('userID') or session["un"]
    sql = "DELETE FROM user WHERE name = '%s'" % username
    mysql = SQLUtil()
    mysql.delete(sql)
    mysql.dispose()
    session.pop('un', None)
    response = make_response(redirect('/'))
    response.delete_cookie('userID')
    return response


@app.route('/article', methods=['GET'])
def article():
    p = request.args.get('p', '')

    show_shouye_status = 0
    if p == '':
        p = 1
    else:
        p = int(p)
        if p > 1:
            show_shouye_status = 1

    mysql = SQLUtil()
    sql0 = 'SELECT * FROM article LIMIT ' + str(p * 10) + ',10'
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
    username = request.cookies.get('userID') or session["un"]
    mysql.dispose()
    return render_template('article.html', user=username, datas=datas, res=res)


@app.route('/editor', methods=['GET'])
def editor():
    return render_template('editor.html')


@app.route('/sendArticle', methods=['POST'])
def sendArticle():
    title = request.form['title']
    content = request.form['content']
    mysql = SQLUtil()
    sql = "INSERT INTO article(title, content) VALUE ('%s','%s')" % (title, content)
    mysql.insertOne(sql)
    mysql.dispose()
    return render_template('index.html')


@app.route('/cancellation', methods=['GET'])
def cancellation():
    session.pop('un', None)
    response = make_response(redirect('/'))
    response.delete_cookie('userID')
    return response


# 录入人脸信息
@app.route('/entry_face/', methods=['GET', 'POST'])
def entry_face():
    # 获取登录人的cookie
    username = request.cookies.get('userID')
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
                sql = "UPDATE user SET face_info = '%s' where name= '%s' " % (face_info, username)
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


# 人脸登录时的注册用户名验证
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


@app.route('/persioncenter', methods=['GET'])
def persioncenter():
    return render_template('personal_center.html')


@app.route('/updatepassword', methods=['POST'])
def updatepassword():
    username = request.cookies.get('userID') or session["un"]
    password = request.form['password']
    passwordc = request.form['passwordc']
    if password == passwordc:
        from werkzeug.security import generate_password_hash
        password = generate_password_hash(password)
        mysql = SQLUtil()
        sql = "UPDATE user SET password = '%s' WHERE name = '%s'" % (password, username)
        mysql.update(sql)
        mysql.dispose()
        message = "修改密码成功！"
        return render_template('personal_center.html', message=message)
    else:
        message = "您两次输入的密码有误！"
        return render_template('personal_center.html', message=message)


@app.route('/happybirthday', methods=['GET'])
def HappyBirthday():
    mysql = SQLUtil()
    sql = "SELECT content FROM birthdayarticle"
    result = mysql.getMany(sql, 20)
    print(result)
    return render_template("chinabirthday.html", result=result)


@app.route("/searchImg", methods=['POST'])
def pre():
    kv = {'user-agent': 'Mozilla/5.0'}
    lastNum = 0
    words = []
    word = request.form['keyword']
    words.append(word)
    for word in words:
        if word.strip() == "exit":
            break
        pageId = 0
        # 此处的参数为需爬取的页数
        for i in range(1):
            url = 'http://image.baidu.com/search/flip?tn=baiduimage&ie=utf-8&word=' + word + "&pn=" + str(
                pageId) + "&gsm=?&ct=&ic=0&lm=-1&width=0&height=0"
            pageId += 1
            result = requests.get(url, headers=kv)
            lastNum = dowmloadPic(result.text, word, lastNum)


@app.route('/repelitimg', methods=['GET'])
def repeliting():
    mysql = SQLUtil()
    sql = "select imgurl from img"
    rs = mysql.getAll(sql)
    mysql.dispose()
    data = []
    for v in range(len(rs)):
        data.append(rs[v]['imgurl'])
    if len(data) != 0:
        return render_template('repelitimg.html', data=data)
    return render_template('repelitimg.html')


def dowmloadPic(html, keyword, startNum):
    kv = {'user-agent': 'Mozilla/5.0'}
    pic_url = re.findall('"objURL":"(.*?)",', html, re.S)
    i = startNum
    root = 'static/reptileimg/'
    print('找到关键词:' + keyword + '的图片，现在开始下载图片...')
    for each in pic_url:
        print('正在下载第' + str(i + 1) + '张图片，图片地址:' + str(each))
        path = root + '{0}.{1}'.format(str(i + 1), 'jpg')
        insertsql(path)
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
    return i


def insertsql(path):
    mysql = SQLUtil()
    sql = "INSERT INTO img(imgurl) VALUES ('%s')" % str(path)
    print(sql)
    mysql.insertOne(sql)
    mysql.dispose()




# 逆向追踪ip进行后台显示
@app.route("/ipview")
def ip():
    ip = request.remote_addr
    return render_template("personal_center.html", ip=ip)


@app.route('/yulu', methods=['GET'])
def yulu():
    mysql = SQLUtil()
    sql = "SELECT content FROM yulu"
    result = mysql.getMany(sql, 10)
    return render_template("yulu.html", res=result)


@app.route('/xinqing', methods=['GET'])
def xinqing():
    mysql = SQLUtil()
    sql = "SELECT content FROM xinqing"
    result = mysql.getMany(sql, 10)
    return render_template("xinqing.html", res=result)


@app.route('/xiaozhishi', methods=['GET'])
def xiaozhishi():
    mysql = SQLUtil()
    sql = "SELECT content FROM xiaozhishi"
    result = mysql.getMany(sql, 10)
    return render_template("xiaozhishi.html", res=result)


@app.route('/duanzi', methods=['GET'])
def duanzi():
    mysql = SQLUtil()
    sql = "SELECT content FROM duanzi"
    result = mysql.getMany(sql, 10)
    return render_template("duanzi.html", res=result)


@app.route('/joke', methods=['GET'])
def joke():
    mysql = SQLUtil()
    sql = "SELECT content FROM joke"
    result = mysql.getMany(sql, 10)
    return render_template("joke.html", res=result)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
