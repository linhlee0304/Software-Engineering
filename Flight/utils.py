import hashlib
from Flight.models import *


def add_user(name, username, password):
    password = hashlib.md5(password.encode('utf-8')).hexdigest()
    kh = User(ten=name, ten_tk=username, mat_khau=password)
    try:
        db.session.add(kh)
        db.session.commit()

        return True
    except Exception as ex:
        print(ex)
        return False

# def type_user()

# def read_Chuyenbay(noiDi=None, noiDen=None, ngayKhoiHanh=None, ngayVe=None):
#     for d in ChuyenBay:
#         d.
#     if noiDi:
#         f = [x for x in ChuyenBay if ChuyenBay["noi_di"].find(noiDi)]
#         return f

