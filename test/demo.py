import csv

# 1. 创建文件对象
f = open('D:\\demo.csv','w',encoding='utf-8',newline='' "")

# 2. 基于文件对象构建 csv写入对象
csv_writer = csv.writer(f)

# 3. 构建列表头
csv_writer.writerow(["姓名","年龄","性别"])

# 4. 写入csv文件内容
# csv_writer.writerow(["l",'18','男'])
# csv_writer.writerow(["c",'20','男'])
# csv_writer.writerow(["w",'22','女'])

# 5. 关闭文件
f.close()
