from datetime import datetime
from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Date, Float, Enum, Time
from Flight import db
from sqlalchemy.orm import relationship
from flask_login import UserMixin
from enum import Enum as UserEnum


class SanBay(db.Model):
    __tablename__ = "sanbay"
    ma_sb = Column(Integer, primary_key=True, autoincrement=True)
    ten = Column(String(255), nullable=False)
    quoc_gia = Column(String(255), nullable=False)
    trang_thai = Column(String(100), nullable=False)

    def __str__(self):
        return self.ten


class Maybay(db.Model):
    __tablename__ = 'maybay'
    so_hieu = Column(String(10), primary_key=True, nullable=False)
    hang_bay = Column(String(100), nullable=False)
    so_ghe_hang_1 = Column(Integer, nullable=False)
    so_ghe_hang_2 = Column(Integer, nullable=False)
    tong_ghe = Column(Integer, nullable=False)

    chuyenBay = relationship('ChuyenBay', backref='sohieu', lazy=True)
    ghe = relationship('Ghe', backref='Số Hiệu Máy Bay', lazy=True)

    def __str__(self):
        return self.so_hieu


class Ghe(db.Model):
    __tablename__ = 'ghe'
    ma_ghe = Column(Integer, primary_key=True, autoincrement=True )
    ten = Column(String(55), nullable=False)
    trang_thai = Column(Boolean, default=False)
    hang_ghe = Column(Integer, nullable=False)

    may_bay = Column(String(10), ForeignKey(Maybay.so_hieu), nullable=False)


class ChuyenBay(db.Model):
    __tablename__ = 'chuyenbay'
    ma_cb = Column(Integer, primary_key=True, autoincrement=True)
    ngay_khoi_hanh = Column(Date, nullable=False)
    gio_khoi_hanh = Column(Time, nullable=False)
    thoi_gian_bay = Column(Time, nullable=False)

    ma_noi_di = Column(Integer, ForeignKey(SanBay.ma_sb), nullable=False)
    ma_noi_den = Column(Integer, ForeignKey(SanBay.ma_sb), nullable=False)
    so_hieu_mb = Column(String(10), ForeignKey(Maybay.so_hieu), nullable=False)
    san_bay_trung_gian = Column(Integer, ForeignKey(SanBay.ma_sb), nullable=True)
    thoi_gian_dung = Column(Time, nullable=True)

    noi_di = relationship('SanBay', foreign_keys=[ma_noi_di])
    noi_den = relationship('SanBay', foreign_keys=[ma_noi_den])
    trung_gian = relationship('SanBay', foreign_keys=[san_bay_trung_gian])
    ve = relationship('VeMayBay', backref='MaChuyenBay', lazy=True)


class UserRole(UserEnum):
    ADMIN = 1
    EMP = 2


class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True, autoincrement=True)
    ten = Column(String(255), nullable=False)
    ten_tk = Column(String(255), nullable=False)
    mat_khau = Column(String(255), nullable=False)
    active = Column(Boolean, default=True)
    user_role = Column(Enum(UserRole), default=UserRole.EMP)

    nhan_vien = relationship('NhanVien', backref='maUser', lazy=True, uselist=False)

    def __str__(self):
        return self.ten

class KhachHang(db.Model):
    __tablename__ = 'khachhang'
    ma_kh = Column(Integer, primary_key=True, autoincrement=True)
    ten_kh = Column(String(255), nullable=False)
    email = Column(String(100), nullable=False)
    sdt = Column(String(10), nullable=False)
    cmnd = Column(String(12), nullable=False)
    active = Column(Boolean, default=True)

    phieuDatCho = relationship('PhieuDatCho', backref='MaKhachHang', lazy=True)

    def __str__(self):
        return self.ten_kh

class NhanVien(db.Model):
    __tablename__ = 'nhanvien'
    ma_nv = Column(Integer, primary_key=True, autoincrement=True)
    ten = Column(String(255), nullable=False)
    sdt = Column(String(10), nullable=False)
    dia_chi = Column(String(255), nullable=False)
    ngay_dk = Column(Date, default=datetime.now())
    active = Column(Boolean, default=True)

    ma_user = Column(Integer, ForeignKey(User.id), nullable=False)
    ve = relationship('VeMayBay', backref='nhanVien', lazy=True)


class VeMayBay(db.Model):
    __tablename__ = "vemaybay"
    ma_ve = Column(Integer, primary_key=True, autoincrement=True, nullable=False)
    hang_ve = Column(String(10), nullable=False)
    gia_ve = Column(Float(10), nullable=True)
    ngay_xuat_ve = Column(Date, default=datetime.now())

    ma_nv = Column(Integer, ForeignKey(NhanVien.ma_nv), nullable=False)
    ma_kh = Column(Integer, ForeignKey(KhachHang.ma_kh), nullable=False)
    ma_cb = Column(Integer, ForeignKey(ChuyenBay.ma_cb), nullable=False)

    phieu_dat_cho = relationship('PhieuDatCho', backref='MaVe', uselist=False)


class PhieuDatCho(db.Model):
    __tablename__ = 'phieudatcho'
    ma_phieu = Column(Integer, primary_key=True, autoincrement=True, nullable=False)
    ma_ve = Column(Integer, ForeignKey(VeMayBay.ma_ve), nullable=False)
    ma_kh = Column(Integer, ForeignKey(KhachHang.ma_kh), nullable=True)
    ngay_dat_phieu = Column(Date, default=datetime.now())

if __name__ == '__main__':
    db.create_all()
