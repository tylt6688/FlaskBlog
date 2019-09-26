from Utils.SQLtool import SQLUtil
import requests
from lxml import etree
import json
import time
import re


def parseOnePage(url):
    """

    :param url:
    :return:
    """
    header = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36"}
    ret = requests.get(url, headers=header)
    html = etree.HTML(ret.text)
    title = html.xpath('//div[*]/div[*]/div[*]/div[/*]/p[*]//text()')


    for i in range(len(title)):
        mysql = SQLUtil()
        sql = "INSERT INTO birthdayarticle(content) VALUES ('%s')" % (title[i])
        mysql.insertOne(sql)
        mysql.dispose()


time.sleep(1)
url = "https://www.d1xz.net/rili/jieri/art314617.aspx"
parseOnePage(url)