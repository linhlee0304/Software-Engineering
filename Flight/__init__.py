from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager
app = Flask(__name__)
app.secret_key = '\x1er\xc4\xe0a"\x98&\xaa\xc55Mi\x03'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123456@localhost/flight?charset=utf8mb4'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db = SQLAlchemy(app=app)

admin = Admin(app=app, name="QUẢN LÍ BÁN VÉ MÁY BAY", template_mode="bootstrap4")

login = LoginManager(app=app)
