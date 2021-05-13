from flask import render_template, redirect, request
from Flight import app, login, utils
from flask_login import login_user
from Flight.utils import *
from Flight import adminn



@app.route("/")
def index():
    return render_template("index.html")

# @app.route('/flights', methods=['post', 'get'])
# def flight_list():
#     err_msg = ''
#     if request.method == 'POST':
#         noiDi = request.form.get('from')
#         noiDen = request.form.get('to')
#         ngayKhoiHanh = request.form.get('departure')
#         ngayVe = request.form.get('return')
#         if ngayKhoiHanh == ngayVe:
#             err_msg = 'Nơi đi trung nơi đến!!!'
#         d = utils.read_Chuyenbay(noiDi=noiDi, noiDen=noiDen, ngayKhoiHanh=ngayKhoiHanh)
#
#         return render_template('flights.html',)


        # departure_airport = aliased(SanBay)
        # arrival_airport = aliased(SanBay)
        # flights = DsChuyenBay.query.join(departure_airport, DsChuyenBay.noiDi == departure_airport.name)\
        #     .join(arrival_airport, DsChuyenBay.noiDen.name == arrival_airport.name)\
        #     .filter()


@app.route("/register", methods=['post', 'get'])
def register():
    err_msg = ''
    if request.method == 'POST':
        name = request.form.get("name")
        # email = request.form.get("email")
        # sdt = request.form.get("sdt")
        username = request.form.get("username")
        password = request.form.get("password", "").strip()
        confirm = request.form.get("confirm-password", "'").strip()
        if password == confirm:
            # avatar = request.files["avatar"]
            # avatar_path = 'images/upload/%s' % avatar.filename
            if utils.add_user(name=name, username=username,
                              password=password):
                return redirect('/')
            else:
                err_msg = 'Thêm user có lỗi'
        else:
            err_msg = 'Mật khẩu không khớp!!!'
    return render_template('register.html', err_msg=err_msg)

@app.route("/login_admin", methods=["post", "get"])
def login_admin():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        # password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.ten_tk == username.strip(), User.mat_khau == password.strip()).first()
        if user and User.active:
            login_user(user=user)

    return redirect("/admin")

@login.user_loader
def get_user(user_id):
    return User.query.get(user_id)

if __name__ == "__main__":
    app.run(debug=True)

