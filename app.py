from flask import Flask
from flask import render_template,request,redirect,url_for, flash
import time
from flaskext.mysql import MySQL

app = Flask (__name__)
app.secret_key="sofka"

mysql = MySQL()
app.config['MYSQL_DATABASE_HOST']='localhost'
app.config['MYSQL_DATABASE_USER']='root'
app.config['MYSQL_DATABASE_PASSWORD']=''
app.config['MYSQL_DATABASE_DB']='nave'
mysql.init_app(app)


@app.route('/')
def index():
    sql = "SELECT * FROM `nave`; "
    conn = mysql.connect()
    cursor=conn.cursor()
    cursor.execute(sql)
    
    nave=cursor.fetchall()
    print(nave)
    
    conn.commit()   
    return render_template ('nave/index.html', nave=nave)

@app.route('/destroy/<int:id>')
def destroy(id):
    conn = mysql.connect()
    cursor=conn.cursor()
    
    cursor.execute("DELETE  FROM nave WHERE id=%s", (id))
    conn.commit()
    return redirect('/')

@app.route('/edit/<int:id>')
def edit(id):
    conn = mysql.connect()
    cursor=conn.cursor()
    cursor.execute("SELECT * FROM nave WHERE id=%s", (id))
    nave=cursor.fetchall()
    print(nave)
    return render_template('nave/edit.html',nave=nave)

@app.route('/update', methods=['POST'])
def update():
    
    _nombre=request.form['txtnombre'] 
    _tipo=request.form['txttipo']
    _pais=request.form['txtpais']
    _añoi=request.form['txtañoi']
    _añoif=request.form['txtañof']
    id=request.form['txtid']
    
    sql = " UPDATE `nave` SET `nombre`=%s , `tipo`=%s, `pais`=%s, `año_lanzado`=%s, `año_retirado`=%s WHERE id=%s; "
    
    datos=(_nombre,_tipo,_pais,_añoi,_añoif, id)
    
    conn = mysql.connect()
    cursor=conn.cursor()
    
    cursor.execute(sql,datos)
    conn.commit()   
    
    return redirect('/')

@app.route('/create')
def create():
    return render_template('nave/create.html')

@app.route('/store', methods=['POST'])
def storage():
    _nombre=request.form['txtnombre'] 
    _tipo=request.form['txttipo']
    _pais=request.form['txtpais']
    _añoi=request.form['txtañoi']
    _añoif=request.form['txtañof']
    
    if _nombre=='' or _tipo =='' or _pais =='' or _añoi =='' or _añoif  =='':
        flash('Recuerda llenar los datos de los campos')
        return redirect(url_for('create'))
    
    sql = " INSERT INTO `nave` (`id`, `nombre`, `tipo`, `pais`, `año_lanzado`, `año_retirado`) VALUES (NULL,%s, %s,%s,%s,%s); "
    
    datos=(_nombre,_tipo,_pais,_añoi,_añoif)
    
    conn = mysql.connect()
    cursor=conn.cursor()
    cursor.execute(sql,datos)
    conn.commit()   
    return redirect ('/')
    


if __name__ == '__main__' :
    app.run(debug=True)
