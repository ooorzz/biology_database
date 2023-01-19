from pymysql import connect
from pymysql.cursors import DictCursor
from settings import MYSQL_HOST,MYSQL_PORT,MYSQL_USER,MYSQL_DATABASE,MYSQL_PASSWORD

class Biology(object):
    def __init__(self):
        # 连接数据库
        self.conn =connect(host=MYSQL_HOST,
                       port=MYSQL_PORT,
                       user=MYSQL_USER,
                       password=MYSQL_PASSWORD,
                       database=MYSQL_DATABASE,
                       charset='utf8',
                       autocommit=True)
        self.cursor=self.conn.cursor(DictCursor) # 建立游标对象

    def __del__(self):
        self.cursor.close()
        self.conn.close()

    def get_all_problems(self):
        sql='SELECT * FROM problem'
        self.cursor.execute(sql)    # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_all_algorithm_CNname(self):
        sql = 'SELECT aid,anameCN FROM algorithm'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_all_algorithm(self):
        sql = 'SELECT * FROM algorithm'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_all_algorithm_type(self):
        sql = 'SELECT DISTINCT atype FROM algorithm'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_one_algorithm(self,aid):
        sql = 'SELECT * FROM algorithm WHERE aid='+str(aid)
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchone()  # 从游标返回全部结果，保存为二维元组
        return result

    def get_all_paper_name(self):
        sql = 'SELECT pid,pname FROM paper'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_all_paper(self):
        sql = 'SELECT * FROM paper'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_one_paper(self,pid):
        sql = 'SELECT * FROM paper WHERE pid='+str(pid)
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchone()  # 从游标返回全部结果，保存为二维元组
        return result

    def get_all_lab_name(self):
        sql = 'SELECT lid,lname FROM lab'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_all_lab(self):
        sql = 'SELECT * FROM lab'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        # 由dict的元组转为dict的list
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_one_lab(self,lid):
        sql = 'SELECT * FROM lab WHERE lid='+str(lid)
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchone()  # 从游标返回全部结果，保存为二维元组
        return result

    def get_al_from_pro(self,id):
        sql = 'SELECT aid AS id,anameEN as name FROM algorithm WHERE id='+str(id)
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        data=[]
        for item in result:
            data.append(item)
        return data

    def get_paper_from_lab(self,id):
       sql = 'SELECT pname AS name,pid AS id FROM paper WHERE' \
             ' pid in (SELECT pid FROM publish WHERE lid='+str(id)+')'
       self.cursor.execute(sql)  # 执行SQL查询
       result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
       return result

    def get_query(self,val,op,name,id_name):
        sql = 'SELECT '+str(name)+' AS name,'+str(id_name)+' AS id FROM '+str(op)+\
              ' where '+str(name)+' LIKE \'%'+str(val)+'%\''
        # select pname as name,pid as id from paper where pname like '%seq%'
        self.cursor.execute(sql)  # 执行SQL查询
        result = self.cursor.fetchall()  # 从游标返回全部结果，保存为二维元组
        return result