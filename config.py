class Config:
    host = '127.0.0.1'
    user = 'root'
    password = '1234'
    port = 3306
    db = 'pythondemo'
    charset = 'utf8'


def setHost(host):
    Config.host = host


def getHost():
    return Config.host


def setUser(user):
    Config.user = user


def getUser():
    return Config.user


def setPassword(password):
    Config.password = password


def getPassword():
    return Config.password


def setPort(port):
    Config.port = port


def getPort():
    return Config.port


def setDb(db):
    Config.db = db


def getDb():
    return Config.db


def setCharset(charset):
    Config.charset = charset


def getCharset():
    return Config.charset
