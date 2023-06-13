from flask import Flask, render_template, redirect, request
from user import User
app = Flask(__name__)

@app.route('/')
def index():
    return redirect('/users')

@app.route('/users')
def users():
    users = User.get_all()
    return render_template("users.html",users = users)

@app.route('/user/new')
def new():
    return render_template("create.html")

@app.route('/user/create',methods=['POST'])
def create():
    User.create(request.form)
    return redirect('/users')


if __name__ == "__main__":
    app.run(debug=True)