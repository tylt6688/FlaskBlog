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
    title = html.xpath('//h3[@class="header"]/a//text()')
    content = html.xpath('//div[@class="description"]/p//text()')

    for i in range(len(title)):
        mysql = SQLUtil()
        sql = "INSERT INTO article(title, content) VALUES ('%s','%s')" % (title[i], content[i])
        mysql.insertOne(sql)
        mysql.dispose()


time.sleep(1)
url = "https://www.oschina.net/news"
parseOnePage(url)
