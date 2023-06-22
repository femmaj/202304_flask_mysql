from flask import render_template, request, redirect, url_for

from app import app

from app.models.dojo import Dojo

from app.models.ninja import Ninja


@app.route('/ninjas')
def ninjas():
    return render_template('ninja.html',dojos=Dojo.get_all())


@app.route('/create/ninja',methods=['POST'])
def create_ninja():
    Ninja.save(request.form)
    return redirect(url_for("index"))