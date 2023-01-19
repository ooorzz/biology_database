from flask import Flask, render_template, request
from db import Biology

app=Flask(__name__,template_folder='templates',static_url_path='/', static_folder='static')

@app.route('/')
def index():
    return render_template('Home.html')

@app.route('/problem')
def problem():
    bio=Biology()
    problemList=bio.get_all_problems()
    return render_template('Problem.html',problemList=problemList)

# 地址参数形如：http://127.0.0.1:5000/algorithms
# 展示所有algorithm
@app.route('/algorithms')
def all_algorithm():
    bio = Biology()
    algList=bio.get_all_algorithm()
    problemList = bio.get_all_problems()
    algType=bio.get_all_algorithm_type()
    return render_template('Algorithm.html', algList=algList, algType=algType, problemList=problemList)

# 地址参数形如：http://127.0.0.1:5000/algorithm?aid=1
# 仅展示查询的algorithm
@app.route('/algorithm')
def select_algorithm():
    aid= request.args.get('aid')
    print(aid)
    bio = Biology()
    selectAlg = bio.get_one_algorithm(aid)
    return render_template('Algorithm_single.html', selectAlg=selectAlg)

# 地址参数形如：http://127.0.0.1:5000/papers
# 展示所有paper
@app.route('/papers')
def all_paper():
    bio=Biology()
    problemList=bio.get_all_problems()
    paperList = bio.get_all_paper()
    return render_template('Paper.html',problemList=problemList,paperList=paperList)

# 地址参数形如：http://127.0.0.1:5000/paper?pid=1
# 仅展示查询的paper
@app.route('/paper')
def select_paper():
    pid = request.args.get('pid')
    print(pid)
    bio=Biology()
    selectPaper = bio.get_one_paper(pid)
    return render_template('Paper_single.html',selectPaper=selectPaper)

# 地址参数形如：http://127.0.0.1:5000/labs
# 展示所有lab
@app.route('/labs')
def all_lab():
    bio = Biology()
    labList=bio.get_all_lab()
    return render_template('Lab.html',labList=labList)

# 地址参数形如：http://127.0.0.1:5000/lab?lid=1
# 仅展示查询的lab
@app.route('/lab')
def select_lab():
    lid= request.args.get('lid')
    print(lid)
    bio = Biology()
    selectLab = bio.get_one_lab(lid)
    return render_template('Lab_single.html',selectLab=selectLab)

@app.route('/query',methods=['POST', 'GET'])
def get_query():
    if request.method == 'POST':
         op = request.form["op"]
         val = request.form["val"]
    elif request.method == 'GET':
         op = request.args.get("op")
         val = request.args.get("val")

    if op == "algorithm":
        name = "anameEN"
        id_name="aid"
    elif op == "paper":
        name = "pname"
        id_name = "pid"
    elif op == "lab":
        name = "lname"
        id_name = "lid"
    else:
        name = "problem_name"
        id_name = "id"
    bio = Biology()
    results = bio.get_query(val,op,name,id_name)
    return render_template('Query_back.html',finds=results,op=op,id_name=id_name)

@app.route('/protoal')
def protoal():
    id = request.args.get('id')
    bio = Biology()
    results = bio.get_al_from_pro(id)
    return render_template('Query_back.html',finds=results,op="algorithm",id_name="aid")

@app.route('/labtopap')
def labtopap():
    id = request.args.get('id')
    bio = Biology()
    results = bio.get_paper_from_lab(id)
    return render_template('Query_back.html',finds=results,op="paper",id_name="pid")

if __name__=="__main__":
    app.run(debug=True)