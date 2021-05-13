from Flight import admin
from flask_admin.contrib.sqla import ModelView
from flask_login import current_user, logout_user
from Flight.models import ChuyenBay, KhachHang, SanBay, Ghe, Maybay, db, NhanVien, User, VeMayBay
from flask_admin import BaseView, expose
from flask import redirect


# class Authenticated(ModelView):
#     def is_accessible(self):
#         return current_user.is_authenticated


class AdminModelView(ModelView):
    column_display_pk = True
    can_export = True
    can_edit = True
    can_delete = True

    def is_accessible(self):
        return current_user.is_authenticated

class VeView(AdminModelView):
    column_labels = dict(ma_ve='Mã vé', hang_ve='Hạng vé', gia_ve='Giá vé', ma_nv='Mã nhân viên', ma_kh='Mã khách hàng',
                         ma_cb='Mã chuyến bay')

    # def is_accessible(self):
    #     return current_user.is_authenticated

class ChuyenBayView(AdminModelView):
    can_view_details = False
    column_searchable_list = False
    form_columns = ('noi_di', 'noi_den', 'trung_gian', 'ngay_khoi_hanh', 'gio_khoi_hanh', 'thoi_gian_bay', 'thoi_gian_dung',
                    'sohieu')
    column_labels = dict(ma_cb='Mã chuyến bay', ngay_khoi_hanh='Ngày khởi hành', gio_khoi_hanh='Giờ khởi hành',
                         thoi_gian_bay='Thời gian bay', noi_di='Nơi đi', noi_den='Nơi đến',
                         sohieu='Số hiệu máy bay', trung_gian='Sân bay trung gian',
                         thoi_gian_dung='Thời gian dừng')

    # def is_accessible(self):
    #     return current_user.is_authenticated


class SanBayView(AdminModelView):
    can_view_details = False
    column_searchable_list = False
    column_labels = dict(ma_sb='Mã sân bay', ten='Tên', quoc_gia='Quốc gia', trang_thai='Trạng thái')

    # def is_accessible(self):
    #     return current_user.is_authenticated


class MayBayView(AdminModelView):
    can_view_details = False
    column_searchable_list = False
    column_labels = dict(so_hieu='Số hiệu', hang_bay='Hãng bay', so_ghe_hang_1='Số ghê hạng 1',
                         so_ghe_hang_2='Số ghế hạng 2', tong_ghe='Tổng ghế')

    # def is_accessible(self):
    #     return current_user.is_authenticated


class DsGheView(AdminModelView):
    can_view_details = False
    column_searchable_list = False
    column_labels = dict(ma_ghe='Mã ghế', ten="Tên", trang_thai='Trạng thái', hang_ghe='Hạng ghế')

    # def is_accessible(self):
    #     return current_user.is_authenticated


class KhachHangView(AdminModelView):
    can_delete = False
    can_edit = False
    can_create = False
    can_view_details = True
    column_searchable_list = False
    column_labels = dict(ma_kh='Mã khách hàng', ten_kh='Tên', email='Email', sdt='Số điện thoại', cmnd='CMND',
                         active='Active')

    # def is_accessible(self):
    #     return current_user.is_authenticated


class NhanVienView(AdminModelView):
    form_columns = ('ten', 'sdt', 'dia_chi', 'ngay_dk')
    column_labels = dict(ma_nv='Mã nhân viên', ten='Tên nhân viên', sdt='Số điện thoại', dia_chi='Địa chỉ',
                         ngay_dk='Ngày đăng kí', active='Active', maUser='Mã user')

class LogOutView(BaseView):
    @expose("/")
    def __index__(self):
        logout_user()
        return redirect('/admin')

    def is_accessible(self):
        return current_user.is_authenticated

admin.add_view(ChuyenBayView(ChuyenBay, db.session, name='Chuyến bay', category='Thông tin chuyến bay'))
admin.add_view(MayBayView(Maybay, db.session, name='Máy bay', category='Thông tin chuyến bay'))
admin.add_view(DsGheView(Ghe, db.session, name='Danh sách ghế', category='Thông tin chuyến bay'))
admin.add_view(SanBayView(SanBay, db.session, name='Sân Bay', category='Thông tin chuyến bay'))
admin.add_view(KhachHangView(KhachHang, db.session, name='Khách hàng', category='Quản lí người dùng'))
admin.add_view(NhanVienView(NhanVien, db.session, name='Nhân viên', category='Quản lí người dùng'))
admin.add_view(VeView(VeMayBay, db.session, name="Danh sách vé"))
admin.add_view(LogOutView(name="Đăng xuất"))
