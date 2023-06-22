from flask import render_template, request, redirect, url_for


from app import app


from app.models.dojo import Dojo

@app.route('/')
def index():
    return redirect('/dojos')

@app.route('/dojos')
def dojos():
    dojos = Dojo.get_all()
    return render_template("index.html",all_dojos = dojos)


@app.route('/create/dojo',methods=['POST'])
def create_dojo():
    Dojo.save(request.form)
    return redirect(url_for ("dojos"))

@app.route('/dojo/<int:id>')
def show_dojo(id):
    data = {
        "id": id
    }
    return render_template('dojo.html', dojo=Dojo.get_one_with_ninjas(data))