from flask import Flask, render_template, request, redirect, url_for, jsonify
from Utils.SQLtool import SQLUtil
from api.tylt_baidu_aip import tylt_AipFace

app = Flask(__name__)


@app.route('/', methods=['GET'])
def home():
    return render_template('index.html')


@app.route('/index', methods=['GET'])
def index():
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
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
            if res['name'] == username and res['password'] == password:
                return redirect(url_for('index'))
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
        password = request.form['password']
        sql = "INSERT INTO user(name, password) VALUE ('%s','%s')" % (username, password)
        mysql.insertOne(sql)
        mysql.dispose()
        return render_template('login.html')


# 录入人脸信息
@app.route('/entry_face/', methods=['GET', 'POST'])
def entry_face():
    mysql = SQLUtil()
    Id = 1
    if request.method == 'POST':
        data = request.form.get('face-info')
        print("data_forward:", data)
        face_info = data.split('base64,')[1]
        aip = tylt_AipFace()
        face_detect_result = aip.face_detect(face_info)
        print(face_detect_result)
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
                sql = "update user set face_info='%s' where Id=%d" % (face_info, Id)
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
        print("data:", data)
        print(username)
        face_info = data.split('base64,')[1]
        aip = tylt_AipFace()
        try:
            sql = "select face_info from user where name='%s'" % username
            face_info_from_db = mysql.getOne(sql)  # 获取数据库中的人脸信息
            if not face_info_from_db['face_info']:
                return 'no_face_info'  # 数据库中没有人脸信息
            else:
                aip.face_constrast_img1 = face_info_from_db['face_info']
                aip.face_constrast_img2 = face_info
                contrast_result = aip.face_contrast()
                print(contrast_result)
                if contrast_result['error_code'] == 0 and contrast_result['result']['score'] >= 80:
                    return 'success'
        except Exception as e:
            print(e)
            return '<h1>服务器发生未知错误，请稍后重试</h1>'
    return render_template('sign_in_by_face.html')


# 注册用户名验证
@app.route('/resver/', methods=['GET'])
def username_check():
    mysql = SQLUtil()
    if request.method == "GET":
        username = request.args["username"]
        print("username:", username)
        sql_user = "select count(name) from user where name = '%s'" % username

        user_result = mysql.getOne(sql_user)
        user_result = user_result['count(username)']

        if user_result == 0:
            print(jsonify({"user_exits": False}))
            return jsonify({"user_exits": False})
        else:
            print(jsonify({"user_exits": True}))
            return jsonify({"user_exits": True})
    else:
        return render_template("resister.html")


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
