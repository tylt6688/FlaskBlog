from Utils.SQLtool import SQLUtil

list = 'hahahhjjjjjj'
mysql = SQLUtil()
sql = "INSERT INTO img (imgurl) VALUE ('%s')"%list
print(sql,mysql.insertOne(sql))
mysql.insertOne(sql)