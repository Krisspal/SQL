select *
from Products

select *
from Suppliers

--1.	Viết tích Đề-các giữa 2 bảng Customers và Orders, nhận xét số hàng kết quả. Thêm điều kiện kết, nhận xét số hàng kết quả. 
select *
from Customers

select *
from Orders

select *
from Customers c, Orders o
where c.CustomerID = o.CustomerID

--2.	Lập danh sách các Customer ở thành phố London hoặc ở nước Pháp (France). Danh sách gồm: Customer ID, Company Name, Contact Name, Address, City

select CustomerID, CompanyName, ContactName, Address, City
from Customers
where City = 'London' or Country = 'France'

--3.	Lập danh sách các Customer là Sales Manager của nước Mỹ (USA) hoặc là Owner của Mexico. Danh sách gồm như trên, thêm cột Contact Title

select CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from Customers
where (ContactTitle = 'Sales Manager' and Country = 'USA') or (ContactTitle = 'Owner' and Country = 'Mexico')

--4.	Lập danh sách các Customer là Manager của nước Mỹ (USA) hoặc: không phải là Owner của Mexico. Danh sách gồm các fields như trên 

select CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from Customers
where (ContactTitle = 'Manager' and Country = 'USA') or (ContactTitle != 'Owner' and Country = 'Mexico')

--5.	Lập danh sách các Order có ngày đặt hàng trong 6 tháng đầu năm 1997. Danh sách gồm: Order ID, Order Date.

set dateformat dmy
select OrderID, OrderDate
from Orders
where OrderDate between '1/1/1997' and '30/6/1997' 

--6.	Lập danh sách các Order có ngày đặt hàng trong tháng 2 năm 1997. Danh sách gồm: Order ID, Order Date, CustomerID, EmployeeID.

set dateformat dmy
select OrderID, OrderDate, CustomerID, EmployeeID
from Orders
where OrderDate between '1/2/1997' and '28/2/1997' 

--7.	Danh sách các Order có Ship Country là UK do nhân viên có mã là 2 phụ trách trong năm 1997. Danh sách gồm:   Order ID, Order Date, Freight 

set dateformat dmy
select OrderID, OrderDate, Freight 
from Orders
where ShipCountry = 'UK' and EmployeeID = '2' and OrderDate between '1/1/1997' and '31/12/1997'

--8.	Người ta muốn biết danh sách các sản phẩm có tên bắt đầu là Ch. Anh chi hãy lập danh sách này, gồm các cột: Product ID, Product Name.

select ProductID, ProductName
from Products
where ProductName like 'Ch%'

--9.	Lập danh sách các sản phẩm không còn tiếp tục cung cấp nữa (trường Discontinued) và có số lượng tồn kho (trường Unit In stock) lớn hơn không. Danh sách gồm: Product ID, Unit Price, Unit In Stock.

select ProductID, UnitPrice, UnitsInStock
from Products
where Discontinued = '1' and UnitsInStock > 0

--10.	Lập danh sách các khách hàng không thuộc nước Mỹ. Danh sách gồm: Company Name, Contact Name, Country, Phone, Fax

select CompanyName, ContactName, Country, Phone, Fax
from Customers
where Country != 'USA'

--12.	Lập danh sách các đơn đặt hàng có Ship country là USA và có Freight > 300 hoặc các đơn có Ship Country là Argentina và Freight <5. Danh sách gồm: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight 

select OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry, ShippedDate, Freight
from Orders
where (ShipCountry = 'USA' and Freight > 300) or (ShipCountry = ' Argentina' and Freight < 5)

--13.	Lập danh sách các đơn đặt hàng có Ship country là USA và có Freight > 300 hoặc các đơn có Ship Country là Argentina và Freight <5. Danh sách gồm: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight 
--14.	Lập danh sách các đơn hàng trong tháng 4/97 gồm các thông tin sau: Order ID, Order Date, Customer, Employee, Freight, New-Freight trong đó New-Freight =110% Freight. 

set dateformat dmy
select OrderID, OrderDate, CustomerID, EmployeeID, Freight, 'New-Freight' = round(1.1*Freight,2)
from Orders 
where OrderDate between '1/4/1997' and '30/4/1997'

--15.	Lập danh sách trị giá tồn kho các Product không còn tiếp tục cung cấp nữa (trường Discontinued là Yes). Danh sách gồm: Product ID, Product Name, Supplier Name, UnitPrice, 	UintsInStock, Total, Supplier Fax, trong đó Total = UnitPrice*UnitsInStock 

select ProductID, ProductName, CompanyName, UnitPrice, UnitsInStock, Fax, 'Total' = round(UnitPrice*UnitsInStock,2)
from Products P, Suppliers S
where Discontinued = '1' and P.SupplierID = S.SupplierID

--16.	Lập danh sách nhân viên (Table Employee) có hire date từ năm 1993 trở về trước. Danh sách gồm: Name, Hire date, Title, BirthDate, Home Phone, trong đó trường Name ghép từ các trường: TitleOfCourstesy, chữ đầu trường LastName và trường FirstName 

select	'Name' = TitleOfCourtesy + left(LastName, 1) + FirstName, HireDate, Title, BirthDate, HomePhone
from	Employees
where	Year(HireDate) <= 1993

--17.	Lập danh sách các Order có ngày đặt hàng trong tháng 4 hàng năm. Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer là Company Name của khách hàng, Employee lấy Last Name 

select OrderID, OrderDate, CompanyName, LastName
from Orders O, Customers C, Employees E
where O.CustomerID = C.CustomerID and O.EmployeeID = E.EmployeeID and month(OrderDate) = 4

--18.	Lập danh sách các Order có ngày đặt hàng các năm chẳn. Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer là Company Name của khách hàng, Employee lấy Last Name 

select OrderID, OrderDate, CompanyName, LastName
from Orders o, Customers c, Employees e
where o.CustomerID = c.CustomerID and YEAR(OrderDate) % 2= 0 and e.EmployeeID = o.EmployeeID

--19.	Lập danh sách các Order có ngày đặt hàng là 5, 13, 14, 23. Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer là Company Name của khách hàng, Employee lấy Last Name 

select	OrderID, OrderDate, 'Customer' = CompanyName, 'Employee' = LastName
from	Orders o, Customers c, Employees e
where	Day(OrderDate) in (5, 13, 14, 23) and o.CustomerID = c.CustomerID and o.EmployeeID = e.EmployeeID

--20.	Người ta muốn có danh sách chi tiết các hoá đơn (Order Details) trong năm 1997. Danh sách gồm các thông tin: Order ID, ProductName, Unit Price, Quantity, ThanhTien, Discount, TienGiamGia, TienPhaiTra trong đó: ThanhTien = UnitPrice*Quantity, TienGiamGia = ThanhTien *Discount, TienPhaiTra = ThanhTien – TienGiamGia 

select	o.OrderID, ProductName, d.UnitPrice, Quantity, DIscount,
		'ThanhTien' = d.UnitPrice * Quantity,
		'TienGiamGia' = d.UnitPrice * Quantity * Discount,
		'TienPhaiTra' = d.UnitPrice * Quantity - d.UnitPrice * Quantity * Discount
from	Orders o, Products p, [Order Details] d
where	Year(OrderDate) = 1997 and o.OrderID = d.OrderID and p.ProductID = d.ProductID

--21.	Tương tự như câu 20 nhưng chỉ lấy các record có Discount >0 và có TienPhaiTra <50 

select	o.OrderID, ProductName, d.UnitPrice, Quantity, DIscount,
		'ThanhTien' = d.UnitPrice * Quantity,
		'TienGiamGia' = d.UnitPrice * Quantity * Discount,
		'TienPhaiTra' = d.UnitPrice * Quantity - d.UnitPrice * Quantity * Discount
from	Orders o, Products p, [Order Details] d
where	Year(OrderDate) = 1997 
		and o.OrderID = d.OrderID 
		and p.ProductID = d.ProductID and Discount > 0 
		and (d.UnitPrice * Quantity - d.UnitPrice * Quantity * Discount) < 50

--22.	Từ Table Product, đếm số sản phẩm, đơn giá cao nhất, thấp nhất và đơn giá trung bình cuả tất cả sản phẩm 

select count(ProductID) as sl,
		max(UnitPrice) as MaxDG,
		min(UnitPrice) as MinDG,
		avg(UnitPrice) as DVGDG
from Products

--23.	Như câu 22 nhưng được nhóm theo loại sản phẩm (Category ID) 

select count(ProductID) as sl,
		max(UnitPrice) as MaxDG,
		min(UnitPrice) as MinDG,
		avg(UnitPrice) as DVGDG
from Products
group by CategoryID

--24.	Đếm số đơn đặt hàng cuả các Order có Ship Country là Belgium, Canada, UK 

select count(OrderID), ShipCountry 
from Orders
where ShipCountry in ('Belgium', 'Canada', 'UK')
group by ShipCountry

--25.	Lập danh sách các loại sản phẩm có đơn giá trung bình lớn hơn 30 

select	*
from	Categories
where	CategoryID in (	select	CategoryID
						from	Products
						group by CategoryID
						having avg(UnitPrice) > 30)

--26.	Tính đơn giá trung bình cuả các sản phẩm có đơn giá lớn hơn 30, nhóm theo loại sản phẩm 

select	CategoryID, avg(UnitPrice) as DGTB
from	Products
where UnitPrice > 30
group by CategoryID

--27.	Thiết kế query tính doanh số của từng loại sản phẩm (Category) trong năm 1996. Danh sách gồm 2 cột: Category Name, Sales; trong đó SalesTotal = UnitPrice*Quantity*(1-Discount) 

select	CategoryName, SalesTotal = Round(Sum(d.UnitPrice * Quantity * (1 - d.Discount)),2)
from	Categories c, Products p, Orders o, [Order Details] d
where	p.CategoryID = c.CategoryID 
		and o.OrderID = d.OrderID 
		and p.ProductID = d.ProductID
		and year(OrderDate) = 1996
group by CategoryName

--28.	Thiết kế query tính tỉ lệ tiền cước mua hàng (Freight) của từng khách hàng trong năm 1997. Danh sách gồm các cột: Company Name (của Customer), Freight, SalesTotal = UnitPrice * Quantity*(1-Discount), Percent= Freight/SalesTotal 

select CompanyName, sum(Freight) as SumFreight, 
		SalesTotal = Round( Sum(d.UnitPrice * Quantity * (1 - Discount)), 2),
		'Percent' = round(sum(Freight) / (sum(d.UnitPrice * Quantity * (1- Discount)) ), 1)
from	Customers c, Orders o, [Order Details] d 
where c.CustomerID = o.CustomerID and o.OrderID = d.OrderID and year(OrderDate) = 1997
group by CompanyName
-------BT Tham khảo thêm-------
--29.	Lập danh sách Customer có Company Name bắt đầu là 1 chữ nào đó được nhập từ bàn phím. Danh sách gồm: Customer ID, CompanyName, ContactName, Address, City, Country, Phone, Fax 

declare @TenCT nvarchar(40)
set @TenCT = 'ch'

select	* 
from	Customers
where	CompanyName like + @TenCT + '%' 

--30.	Lập danh sách các Order có Order Date trong 1 khoảng thời gian nào đó. 
--Tham số nhập: “From date:” và “To:”. Danh sách gồm: Order ID, Customer, ShipCountry, OrderDate 

declare	@NgayBD datetime, @NgayKT datetime
set dateformat dmy
set	@NgayBD = '1/1/1996'
set	@NgayKT = '31/12/1996'
select	OrderID, CustomerID, ShipCountry
from	Orders
where	OrderDate between @NgayBD and @NgayKT

--31.	Người ta muốn có danh sách các Order của một quốc gia nào đó của khách hàng trong một năm mua hàng nào đó được nhập từ bàn phím. Anh chị hãy thực hiện Query này. Danh sách gồm các cột như trên. 
--32.	Tạo danh sách các Product thuộc một loại nào đó khi nhập Category ID từ bàn phím. Danh sách gồm: Product Name, Unit Price, Supplier 


-- MAKE TABLE QUERY

--1.	Tạo một query đặt tên là TimKhachHangMy (tìm khách hàng Mỹ). Khi chạy, query này sẽ tạo ra một table mới có tên CacKhachHangMy, 
-- lấy tất cả các field của bảng Customers. 

select * into CacKhachHangMy
from Customers
where Country = 'USA'

select *
from CacKhachHangMy
drop table CacKhachHangMy

--2.	Tạo một query đặt tên là Tim5NhanVienGioi (tìm 5 nhân viên giỏi). 
-- Khi chạy, query này sẽ tạo ra một table mới có tên 5NhanVienGioi. 
-- Bảng này liệt kê danh sách 5 nhân viên phụ trách nhiều đơn đặt hàng nhất. 
-- Các thông tin gồm: mã nhân viên, họ và tên nhân viên (1 cột), tổng số lượng các đơn đặt hàng đã phụ trách. 
-- Danh sách sắp xếp giảm dần theo cột tổng số lượng các đơn đặt hàng đã phụ trách. 

select top 5 e.EmployeeID, 'HoVaTen' = LastName + ' ' + FirstName, 
			count(OrderID) as SLDH
			into NamNhanVienGioi
from Employees e, Orders o
where e.EmployeeID = o.EmployeeID
group by e.EmployeeID, LastName + ' ' + FirstName
order by count(OrderID) desc

select * 
from NamNhanVienGioi
drop table NamNhanVienGioi

--3.	Tạo một query đặt tên là Tim10KhachHang (tìm 10 khách hàng). Khi chạy, query này sẽ tạo ra một table mới có tên 10KhachHang. 
-- Bảng này liệt kê danh sách 10 khách hàng có nhiều đơn đặt hàng nhất. 
-- Các thông tin gồm: mã khách hàng, tên công ty, địa chỉ đầy đủ (1 cột gồm địa chỉ, thành phố và quốc gia), 
-- và tổng số lượng các đơn đặt hàng đã đặt. Danh sách sắp xếp giảm dần theo cột tổng số lượng các đơn đặt hàng đã đặt. 

select	c.CustomerID, CompanyName, 'Address' = Address + ', ' + City + ', ' + Country
from	Customers c, Orders o
where	o.CustomerID = c.CustomerID
group by	c.CustomerID, CompanyName


--4.	Tạo một query đặt tên là TimTop5QGMuaHang (tìm top 5 quốc gia mua hàng). 
-- Khi chạy, query này sẽ tạo ra một table mới có tên Top5QGMuaHang. 
-- Bảng này liệt kê danh sách top 5 quốc gia có khách hàng mua nhiều sản phẩm nhất. Gợi ý:  (Count(ProductID).


--5.	Tạo một query đặt tên là Tim5QGItMuaHang (tìm 5 quốc gia ít mua hàng). 
-- Khi chạy, query này sẽ tạo ra một table mới có tên NamQGItMuaHang. 
-- Bảng này liệt kê danh sách 5 quốc gia có khách hàng mua ít sản phẩm nhất. Gợi ý: (Count(ProductID).

-- UPDATE QUERY
--1.	Hãy tạo một query đặt tên là SuaTenQuocGia1 (sửa tên quốc gia) 
-- để khi chạy query này sẽ sửa lại tên quốc gia trong bảng CUSTOMERS: “USA” sửa thành “Mỹ”. 
--Tên các quốc gia khác vẫn giữ nguyên. 

select * into KH 
from Customers
update KH
set Country = N'Mỹ'
where Country = 'USA'

select * 
from KH

--2.	Hãy tạo một query đặt tên là SuaTenQuocGia2 (sửa tên quốc gia) để khi chạy query này sẽ sửa lại tên quốc gia 
-- trong bảng CUSTOMERS: “Germany” sửa thành “Đức” và “France” sửa thành “Pháp”. Tên các quốc gia khác vẫn giữ nguyên. 

update KH
set Country = (case Country 
					when 'Germany' then N'Đức'
					else N'Pháp'
					end)

where Country in ('Germany', 'France')

select * 
from KH

drop table KH

--3.	Hãy tạo một query đặt tên là SuaTenQuocGia3 (sửa tên quốc gia) để khi chạy query này sẽ sửa lại tên quốc gia trong 2 bảng CUSTOMERS và SUPPLIERS: “Germany” sửa thành “Đức” và “France” sửa thành “Pháp”. Tên các quốc gia khác vẫn giữ nguyên. 


--4.	Hãy tạo một query đặt tên là SuaTenLoaiSP (sửa tên loại sản phẩm) để khi chạy query này sẽ sửa tên loại sản phẩm trong
-- bảng LOAISANPHAM: “Beverages” sửa thành “nước giải khát” và “Condiments” sửa thành “gia vị”. Tên các loại sản phẩm khác vẫn giữ nguyên.

select * into Category2
from Categories

update	Category2
set		CategoryName = (case CategoryName 
						when 'Beverages' then N'nước giải khát'
						else N'gia vị'
						end)
where CategoryName in ('Beverages', 'Condiments')

select * from Category2
drop table Category2

--5.	Hãy tạo một query đặt tên là SuaTenLoaiSP (sửa tên loại sản phẩm) để khi chạy query này sẽ sửa tên loại sản phẩm trong bảng LOAISANPHAM: “Confections” sửa thành “bánh kẹo” và “Seafood” sửa thành “hải sản”. Tên các loại sản phẩm khác vẫn giữ nguyên. 
--Hãy tạo một query đặt tên là SuaPostalCode (sửa mã bưu điện) để khi chạy query này sẽ sửa mã bưu điện của các khách hàng Germany: sửa 2 số đầu thành 18. Mã bưu điện của các khách hàng quốc gia khác giữ nguyên. 
--6.	Hãy tạo một query đặt tên là SuaPostalCode (sửa mã bưu điện) để khi chạy query này sẽ sửa mã bưu điện của các khách hàng Germany: sửa 2 số đầu thành 18. Mã bưu điện của các khách hàng quốc gia khác giữ nguyên. 

select * into Customers2
from Customers

select		PostalCode, '18' + RIGHT(PostalCode, len(PostalCode) - 2)
from Customers2
where Country = 'Germany'

update	Customers2
set		PostalCode = '18' + RIGHT(PostalCode, len(PostalCode) - 2)
where Country = 'Germany'

drop table Customers2

-- APPEND QUERRY
--1.	Tạo một Append Query đặt tên là Them1LoaiSPa. Khi chạy query mới này thì ta thêm một record vào table Categories. Thông tin thêm vào là: 
--	   	CategoryName: Văn phòng phẩm 
--	   	Description: Sách, vở, giấy, bút, mực 
--		Mở bảng Categories để xem các thay đổi sau khi ta chạy query. 

insert into Categories(CategoryName, Description)
values (N'Van_Phong_Pham', N'Sách, vở, giấy, bút, mực')

select *
from Categories

--2.	Hãy tạo một query đặt tên là Them1LoaiSPb (thêm loại sản phẩm). Khi chạy, query này sẽ yêu cầu người dùng nhập thông tin về 
-- tên loại sản phẩm (CategoryName) và miêu tả sản phẩm (Description), sau đó sẽ thêm một record vào table Categories với các thông tin vừa nhập. 

--3.	Hãy tạo một query đặt tên là ThemMotKhachHang (thêm một khách hàng). Khi chạy, query này sẽ thêm một record vào table Customers với các thông tin cá nhân của các anh chị. 
--4.	Hãy tạo một query đặt tên là ThemMotNhanVien (thêm một nhân viên). Khi chạy, query này sẽ thêm một record vào table Employees với các thông tin cá nhân của các anh chị. 
--5.	Hãy tạo một query đặt tên là ThemMotDonHang (thêm một đơn hàng). Khi chạy, query này sẽ thêm một record vào table Employees với các thông tin do người dùng nhập khi chạy query. 
--6.	Hãy tạo một query đặt tên là LayDLKhachHangMy (lấy dữ liệu khách hàng Mỹ). Khi chạy, query này sẽ thêm một số record là khách hàng Mỹ từ bảng Custmers vào bảng KhachHang. 

--7.	Hãy tạo một query đặt tên là LayDLKhachHangQuy (lấy dữ liệu khách hàng quý). Khi chạy, query này sẽ thêm khoảng 10 record là khách hàng có nhiều đơn hàng nhất từ bảng Custmers vào bảng KhachHang. 

select * into KhachHang
from Customers
where CustomerID in (select top 10 CustomerID
					from Orders
					group by CustomerID
					order by count(OrderID) desc)

select * from KhachHang

--	DELETE QUERRY
--1.	Hãy tạo một query đặt tên là Xoa1LoaiSP để xóa 1 record sinh ra do chạy câu 1 append query. 
--2.	Hãy tạo một query đặt tên là XoaCacKHMy để xóa các record sinh ra do chạy câu 6 append query. 
--3.	Hãy tạo một query đặt tên là XoaCacKHQuy để xóa các record sinh ra do chạy câu 7 append query. 
--4.	Hãy tạo một query đặt tên là XoaCacKHKhongMuaHang để xóa các record lưu các khách hàng chưa mua đơn hàng nào. 

select * into XoaKhachHangKhongMuaDonNao from Customers
delete from XoaKhachHangKhongMuaDonNao
where CustomerID not in (select distinct CustomerID
						from Orders)

select * from XoaKhachHangKhongMuaDonNao
drop table XoaKhachHangKhongMuaDonNao

--5.  Hãy tạo một query đặt tên là XoaCacLoaiHangKhongCoSP để xóa các record lưu các loại hàng chưa có sản phẩm nào. 


--	CROSS-TAB QUERY 
--1.	Hãy tạo một query đặt tên là ThongKeSPTheoNam (thống kê sản phẩm theo năm). 
-- Khi chạy, query sẽ hỏi năm bắt đầu thống kê, năm kết thúc thống kê sau đó lập một danh sách trong đó: 
-- Các hàng là tên các sản phẩm, các cột là lần lượt các năm liên tiếp trong khoảng các năm vừa nhập, giá trị trong các ô là số lượng sản phẩm đã bán được. 

select ProductID, [1996], [1997], [1998]
from	(select ProductID, year(OrderDate) as Nam, sum(Quantity) as SoLuong
		from	Orders o, [Order Details] d
		where	o.OrderID = d.OrderID and year(OrderDate) between 1996 and 1998
		group by	ProductID, year(OrderDate)) A

Pivot
(
	sum(SoLuong) for Nam in ([1996], [1997], [1998])
) B

--2.	Hãy tạo một query đặt tên là ThongKeSPTheoThang (thống kê sản phẩm theo tháng). 
-- Khi chạy, query sẽ hỏi tháng bắt đầu thống kê, tháng kết thúc thống kê sau đó lập một danh sách trong đó: 
-- Các hàng là tên các sản phẩm, các cột là lần lượt các tháng liên tiếp trong khoảng các tháng vừa nhập của năm 1997, 
-- giá trị trong các ô là số lượng sản phẩm đã bán được. 

select ProductID, isNull([1], 0) [1], isNull([2], 0) [2], isNull([3], 0) [3], isNull([4], 0) [4]
from	(select ProductID, month(OrderDate) as Thang, sum(Quantity) as SoLuong
		from	Orders o, [Order Details] d
		where	o.OrderID = d.OrderID and month(OrderDate) < 5 and year(OrderDate) = 1997
		group by	ProductID, month(OrderDate)) A

Pivot
(
	sum(SoLuong) for Thang in ([1], [2], [3], [4])
) B

--3.	Hãy tạo một query đặt tên là ThongKeSLMuaSPTheoQG (thống kê số lượng mua sản phẩm theo quốc gia khách hàng). Khi chạy, query sẽ tạo danh sách có cột đầu tiên là các quốc gia của khách hàng, các cột còn lại là tên các loại sản phẩm, trong các ô còn lại là số lượng sản phẩm mỗi quốc gia mua mỗi loại hàng.
-- 7.	Tạo query crostab thống kê doanh số theo từng quý của của từng sản phẩm của 1 nhóm hàng nào đó trong một năm nào đó. 
-- Kết quả có dạng (thí dụ nhập loại hàng có mã (Category ID) là 1, năm 1995): 

select ProductID, isNull([1], 0) [1], isNull([2], 0) [2], isNull([3], 0) [3], isNull([4], 0) [4],
		'Tong cong' = isNull([1], 0) + isNull([2], 0) + isNull([3], 0) + isNull([4], 0)
from	(select ProductID, datepart(q, OrderDate) as Quy, sum(Quantity) as SoLuong
		from	Orders o, [Order Details] d
		where	o.OrderID = d.OrderID and year(OrderDate) = 1997
		group by	ProductID, datepart(q, OrderDate)) A

Pivot
(
	sum(SoLuong) for Quy in ([1], [2], [3], [4])
) B
