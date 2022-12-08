--1 (1đ) Tạo ràng buộc, DiaDiem trong bảng CongTrinh có giá trị mặc định là 371 Nguyễn Kiệm.
alter table		CongTrinh
add constraint	DF_DiaDiem
default			(N'371 Nguyễn Kiệm') for DiaDiem

--2 (1đ) Tạo ràng buộc, NgayCapQD trong bảng CongTrinh phải bé hơn hoặc bằng ngày hiện tại.
alter table		CongTrinh
add constraint	check_CT_NgayCap
check			(NgayCapQD < getdate())

--3 (1đ) Tạo ràng buộc, tên phòng ban trong bảng PhongBan không được phép trùng.
alter table		PhongBan
add constraint	uq_PB_Ten
unique			(TenPB)

--Note:
--Tên ràng buộc đặt sao cũng được, nhưng nên đặt theo quy tắc cho dễ kiểm tra:
--+ Default: df_Thuộc tính ràng buộc
--+ Check: ck_Tên viết tắt của bảng_Thuộc tính ràng buộc hoặc check_Tên viết tắt của bảng_Thuộc tính ràng buộc
--+ Unique: uq_Tên viết tắt của bảng_Thuộc tính ràng buộc

--4 (1đ) Thay đổi địa điểm của các công trình được cấp quyết định trong năm 2016 thành ‘Tp HCM’
update	CongTrinh
set		DiaDiem = 'Tp HCM'
where	year(NgayCapQD) = 2016

--Note:
--Alter table: chỉnh sửa cấu trúc bảng (kiểu dữ liệu cột, thêm cột, xoá cột,...).
--Update: chỉnh sửa dữ liệu trong bảng.

--5 (1đ) Thêm mới 1 Nhân viên với thông tin của sinh viên.
insert into	NhanVien
values		('2154050235', N'Trần Nguyễn Hoàng Phúc', '08/07/2003', 'Nam', 'KT01')

--Note:
--Nhập ngày phải nhập trong dấu ''

--6 (1đ) Hãy cho biết số lượng nhân viên của mỗi phòng ban. Thông tin bao gồm: Tên phòng ban, Số lượng nhân viên. 
--Số lượng nhân viên được sắp xếp giảm dần.
select		TenPB, count(MaNV) as 'So luong nhan vien'
from		PhongBan p, NhanVien n
where		n.MaPB = p.MaPB
group by	p.TenPB
order by	count(MaNV) desc

--Note:
--select cột nào thì group by phải có cột đó, trừ những cột sử dụng hàm tính toán như count, avg

--7 (1đ) Lấy thông tin nhân viên có tổng số ngày công nhiều nhất trong năm 2016 và 2017.
select	*
from	NhanVien
where	MaNV in (select	top 1 MaNV 
				from	PhanCong
				where	year(NgayThamGia) in (2016, 2017)
				group by (MaNV)
				order by sum(SLNgayCong) desc)

--8 (1đ) Tạo câu query lấy danh sách các nhân viên chưa tham gia bất kỳ công trình nào trong năm 2017.
select	*
from	NhanVien
where	MaNV not in (select	MaNV
					from	PhanCong
					where	year(NgayThamGia) = 2017)

--9 (1đ) Lấy danh sách các nhân viên có số lượng ngày công trong năm 2016 dưới 10. Khi 
--chạy câu truy vấn này một bảng ThongKeNhanVien mới sẽ được tạo, chứa thông tin MaNV, HoTen, Tổng số ngày công.

--Tạo bảng ThongKeNhanVien
select	n.MaNV, n.HoTen, sum(SLNgayCong) as TongSoNgayCong 
into ThongKeNhanVien
from	NhanVien n, PhanCong p
where	n.MaNV = p.MaNV and year(p.NgayThamGia) = 2016
group by	n.MaNV, n.HoTen
having sum(SLNgayCong) < 10

--Xem bảng
select	* from	ThongKeNhanVien
--Xoá bảng sau khi chạy để không lỗi database
drop table	ThongKeNhanVien 

--10 (1đ) Viết câu truy vấn thông kê cho biết từng phòng ban có bao nhiêu nhân viên tham gia công trình, 
--và cụ thể trong từng công trình là bao nhiêu nhân viên. 
--Gồm có: các dòng là các tên phòng ban, các cột là tổng số lượng và số lượng nhân viên theo từng mã công trình.

--select	b.TenPB, c.MaCT, count(p.MaNV) as SoLuongNV 
--from	CongTrinh c, PhanCong p, NhanVien n, PhongBan b
--where	b.MaPB = n.MaPB
--		and c.MaCT = p.MaCT
--		and	p.MaNV = n.MaNV
		
--group by	b.MaPB, b.TenPB, p.MaNV, c.MaCT
--order by c.MaCT asc

select	TenPB, [CT1], [CT2], [CT3], [CT4],
		'Tong' = [CT1] + [CT2] + [CT3] + [CT4]
from	(select	b.TenPB, c.MaCT as Mct , sum(count(p.MaNV)) as TongSoNV
		from	CongTrinh c, PhanCong p, NhanVien n, PhongBan b
		where	b.MaPB = n.MaPB
				and c.MaCT = p.MaCT
				and	p.MaNV = n.MaNV
		group by b.TenPB, p.MaNV, c.MaCT) A

Pivot
(
	sum(TongSoNV) for Mct in ([CT1], [CT2], [CT3], [CT4])
) B
