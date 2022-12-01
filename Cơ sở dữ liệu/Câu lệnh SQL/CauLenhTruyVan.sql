--1.	Viết tích Đề-các giữa 2 bảng Customers và Orders, nhận xét số hàng kết quả. Thêm điều kiện kết, nhận xét số hàng kết quả.

select	*
from	Orders, Customers

--2.	Lập danh sách các Customer ở thành phố London hoặc ở nước Pháp (France). Danh sách gồm: Customer ID, Company Name, Contact Name, Address, City

select	CustomerID, CompanyName, ContactName, Address, City
from	Customers
where	City = 'London' or Country = 'France'

--3.	Lập danh sách các Customer là Sales Manager của nước Mỹ (USA) hoặc là Owner của Mexico. Danh sách gồm như trên, thêm cột Contact Title 

select	CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from	Customers
where	(ContactTitle = 'Sales Manager' and Country = 'USA') or (ContactTitle = 'Owner' and Country = 'Mexico')

--4.	Lập danh sách các Customer là Manager của nước Mỹ (USA) hoặc: không phải là Owner của Mexico. Danh sách gồm các fields như trên 

select	CustomerID, CompanyName, ContactName, Address, City, ContactTitle
from	Customers
where	(ContactTitle = 'Sales Manager' and Country = 'USA') or (ContactTitle != 'Owner' and Country = 'Mexico')

--5.	Lập danh sách các Order có ngày đặt hàng trong 6 tháng đầu năm 1997. 
-- Danh sách gồm: Order ID, Order Date, Customer, Employee trong đó Customer là Company Name của khách hàng, Employee lấy Last Name

set dateformat dmy
select  OrderID, OrderDate, CompanyName as 'Customer', LastName as 'Employee'
from	Orders o, Customers c, Employees e
where	month(o.OrderDate) between 1 and 6 and year(o.OrderDate) = 1997
		and o.CustomerID = c.CustomerID
		and o.EmployeeID = e.EmployeeID

--6.	Lập danh sách các Order có ngày đặt hàng trong tháng 2 năm 1997. Danh sách gồm: Order ID, Order Date, CustomerID, EmployeeID.

set dateformat dmy
select	OrderID, OrderDate
from	Orders o, Customers c, Employees e
where	month(OrderDate) = 2 and year(OrderDate) = 7
		and o.CustomerID = c.CustomerID
		and o.EmployeeID = e.EmployeeID

--7.	Danh sách các Order có Ship Country là UK do nhân viên có mã là 2 phụ trách trong năm 1997. Danh sách gồm: Order ID, Order Date, Freight

set dateformat dmy
select OrderID, OrderDate, Freight
from	Orders
where	EmployeeID = 2
		and ShipCountry = 'UK'
		and year(OrderDate) = 1997

--8.	Người ta muốn biết danh sách các sản phẩm có tên bắt đầu là Ch. Anh chi hãy lập danh sách này, gồm các cột: Product ID, Product Name.

select	ProductID, ProductName
from	Products
where	ProductName like 'Ch%'

--9.	Lập danh sách các sản phẩm không còn tiếp tục cung cấp nữa (trường Discontinued) 
-- và có số lượng tồn kho (trường Unit In stock) lớn hơn không. Danh sách gồm: Product ID, Unit Price, Unit In Stock.

select	ProductID, UnitPrice, UnitsInStock
from	Products
where	Discontinued = 'True' and UnitsInStock > 0

--10.	Lập danh sách các khách hàng không thuộc nước Mỹ. Danh sách gồm: Company Name, Contact Name, Country, Phone, Fax 

select	CompanyName, ContactName, Country, Phone, Fax
from	Customers
where	Country != 'USA'

--11.	Lập danh sách các khách hàng không thuộc các nước Brazil, Italy, Spain, Venezuela và UK. 
-- Danh sách gồm: Company Name, Contact Name, Country, Phone, Fax 

select	CompanyName, ContactName, Country, Phone, Fax
from	Customers
where	Country not in ('Brazil', 'Italy', 'Spain', 'Venezuela', 'UK')

--12.	Lập danh sách các đơn đặt hàng có Ship country là USA và có Freight > 300 hoặc các đơn có Ship Country là Argentina và Freight <5. 
-- Danh sách gồm: Order ID, CustomerID, EmployeeID, Order date, Ship Country, Ship date, Freight 

select	OrderID, CustomerID, EmployeeID, OrderDate, ShipCountry, ShippedDate, Freight
from	Orders
where	(ShipCountry = 'USA' and Freight > 300) or (ShipCountry = 'Argentina' and Freight < 5)

--13.	Lập danh sách các đơn đặt hàng có Ship country là USA và có Freight > 300 hoặc các đơn có Ship Country là Argentina và Freight <5. 
-- Danh sách gồm: Order ID, Customer, Employee, Order date, Ship Country, Ship date, Freight 


--14.	Lập danh sách các đơn hàng trong tháng 4/97 gồm các thông tin sau: Order ID, Order Date, Customer, Employee, Freight, New-Freight 
-- trong đó New-Freight = 110% Freight. 

set dateformat dmy
select	OrderID, OrderDate, CustomerID, EmployeeID, Freight, 'New-Freight' = round(1.1 * Freight,2)
from	Orders
where	month(OrderDate) = 4 and year(OrderDate) = 1997

--15.	Lập danh sách trị giá tồn kho các Product không còn tiếp tục cung cấp nữa (trường Discontinued là Yes). 
-- Danh sách gồm: Product ID, Product Name, Supplier Name, UnitPrice, 	UintsInStock, Total, Supplier, Fax, 	
-- trong đó Total = UnitPrice*UnitsInStock 

select	ProductID, ProductName, s.CompanyName, UnitPrice, UnitsInStock, 'Total' = UnitPrice * UnitsInStock, Fax
from	Products p, Suppliers s
where	p.SupplierID = s.SupplierID

--16.	Lập danh sách nhân viên (Table Employee) có hire date từ năm 1993 trở về trước. 
-- Danh sách gồm: Name, Hire date, Title, BirthDate, Home Phone, trong đó trường Name ghép từ các trường: TitleOfCourstesy, 
-- chữ đầu trường LastName và trường FirstName 

select	'Name' = TitleOfCourtesy + left(LastName, 1) + ' ' + FirstName, HireDate, BirthDate, HomePhone
from	Employees
where	year(HireDate) <= 1993

--17.	Lập danh sách các Order có ngày đặt hàng trong tháng 4 hàng năm. Danh sách gồm: Order ID, Order Date, Customer, Employee 
-- trong đó Customer là Company Name của khách hàng, Employee lấy Last Name 

select	OrderID, OrderDate, 'Customer' = CompanyName, 'Employee' = LastName
from	Orders o, Customers c, Employees e
where	month(o.OrderDate) = 4 
		and o.CustomerID = c.CustomerID
		and e.EmployeeID = o.EmployeeID

--18.	Lập danh sách các Order có ngày đặt hàng các năm chẳn. Danh sách gồm: Order ID, Order Date, Customer, Employee 
-- trong đó Customer là Company Name của khách hàng, Employee lấy Last Name 

select	OrderID, OrderDate, 'Customer' = CompanyName, 'Employee' = LastName
from	Orders o, Customers c, Employees e
where	year(o.OrderDate) % 2 =0 
		and o.CustomerID = c.CustomerID
		and e.EmployeeID = o.EmployeeID

--19.	Lập danh sách các Order có ngày đặt hàng là 5, 13, 14, 23. Danh sách gồm: Order ID, Order Date, Customer, Employee 
-- trong đó Customer là Company Name của khách hàng, Employee lấy Last Name 

select	OrderID, OrderDate, 'Customer' = CompanyName, 'Employee' = LastName
from	Orders o, Customers c, Employees e
where	day(o.OrderDate) in (5, 13, 14, 23) 
		and o.CustomerID = c.CustomerID
		and e.EmployeeID = o.EmployeeID

--20.	Người ta muốn có danh sách chi tiết các hoá đơn (Order Details) trong năm 1997. 
-- Danh sách gồm các thông tin: Order ID, ProductName, Unit Price, Quantity, ThanhTien, Discount, TienGiamGia, TienPhaiTra 
-- trong đó: ThanhTien = UnitPrice * Quantity, TienGiamGia = ThanhTien * Discount, TienPhaiTra = ThanhTien – TienGiamGia 

select	o.OrderID, ProductName, d.UnitPrice, Quantity, 
		'ThanhTien' = d.UnitPrice * Quantity, 
		'TienGiamGia' = (d.UnitPrice * Quantity) * Discount, 
		'TienPhaiTra' = (d.UnitPrice * Quantity) - (d.UnitPrice * Quantity) * Discount
from	[Order Details] d, Orders o, Products p
where	year(o.OrderDate) = 1997
		and d.ProductID = p.ProductID
		and o.OrderID = d.OrderID

--21.	Tương tự như câu 20 nhưng chỉ lấy các record có Discount > 0 và có TienPhaiTra <50 

select	o.OrderID, ProductName, d.UnitPrice, Quantity, 
		'ThanhTien' = d.UnitPrice * Quantity, 
		'TienGiamGia' = (d.UnitPrice * Quantity) * Discount, 
		'TienPhaiTra' = (d.UnitPrice * Quantity) - (d.UnitPrice * Quantity) * Discount
from	[Order Details] d, Orders o, Products p
where	year(o.OrderDate) = 1997
		and d.ProductID = p.ProductID
		and o.OrderID = d.OrderID
		and Discount > 0
		and (d.UnitPrice * Quantity) - (d.UnitPrice * Quantity) * Discount < 50

--22.	Từ Table Product, đếm số sản phẩm, đơn giá cao nhất, thấp nhất và đơn giá trung bình cuả tất cả sản phẩm 

select	count(ProductID) as SLSP, 
		max(UnitPrice) as DonGiaCaoNhat,
		min(UnitPrice) as DonGiaThapNhat,
		avg(UnitPrice) as DonGiaTrungBinh
from	Products

--23.	Như câu 22 nhưng được nhóm theo loại sản phẩm (Category ID) 

select	count(ProductID) as SLSP, 
		max(UnitPrice) as DonGiaCaoNhat,
		min(UnitPrice) as DonGiaThapNhat,
		avg(UnitPrice) as DonGiaTrungBinh
from	Products 
group by CategoryID

--24.	Đếm số đơn đặt hàng cuả các Order có Ship Country là Belgium, Canada, UK 

select	count(OrderID), ShipCountry
from	Orders
where	ShipCountry in ('Belgium', 'Canada', 'UK')
group by ShipCountry

--25.	Lập danh sách các loại sản phẩm có đơn giá trung bình lớn hơn 30 

select	*
from	Products
where	CategoryID in ( select CategoryID
						from	Products
						group by CategoryID
						having avg(UnitPrice) > 30)

--26.	Tính đơn giá trung bình cuả các sản phẩm có đơn giá lớn hơn 30, nhóm theo loại sản phẩm

select	CategoryID, AVG(UnitPrice) as DGTB
from	Products
where	UnitPrice > 30
group by	CategoryID

--27.	Thiết kế query tính doanh số của từng loại sản phẩm (Category) trong năm 1996. 
-- Danh sách gồm 2 cột: Category Name, Sales; trong đó SalesTotal = UnitPrice * Quantity * (1 - Discount) 

set dateformat dmy
select	CategoryName, Sales = round(sum(d.UnitPrice * Quantity * (1 - d.Discount)),2)
from	Categories c, [Order Details] d, Products p, Orders o
where	o.OrderID = d.OrderID
		and p.ProductID = d.ProductID
		and c.CategoryID = p.CategoryID
		and year(OrderDate) = 1996
group by CategoryName

--28.	Thiết kế query tính tỉ lệ tiền cước mua hàng (Freight) của từng khách hàng trong năm 1997. 
-- Danh sách gồm các cột: Company Name (của Customer), Freight, SalesTotal = UnitPrice * Quantity*(1-Discount), Percent = Freight / SalesTotal 

select	CompanyName, sum(Freight) as SumFreight, 
		SalesTotal = sum(d.UnitPrice * Quantity * (1 - Discount)),
		'Percent' = round((sum(Freight)) / (sum(d.UnitPrice * Quantity * (1 - Discount))),2)
from	Orders o, Customers c, Products p, [Order Details] d
where	o.CustomerID = c.CustomerID
		and p.ProductID = d.ProductID
		and year(OrderDate) = 1997
group by CompanyName

-------BT Tham khảo thêm-------
--29.	Lập danh sách Customer có Company Name bắt đầu là 1 chữ nào đó được nhập từ bàn phím. 
-- Danh sách gồm: Customer ID, CompanyName, ContactName, Address, City, Country, Phone, Fax 

declare	@TenKH nvarchar(50)
set		@TenKH = 'h'

select	*
from	Customers
where	CompanyName like @TenKH +'%'

--30.	Lập danh sách các Order có Order Date trong 1 khoảng thời gian nào đó. Tham số nhập: “From date:” và “To:”. 
-- Danh sách gồm: Order ID, Customer, ShipCountry, OrderDate

declare	@NgayBD datetime, @NgayKT datetime

set		dateformat dmy
set		@NgayBD = '1/2/1995'
set		@NgayKT = '31/12/1997'

select	OrderID, CompanyName, ShipCountry, OrderDate
from	Orders o, Customers c
where	OrderDate between @NgayBD and @NgayKT
		and o.CustomerID = c.CustomerID

--31.	Người ta muốn có danh sách các Order của một quốc gia nào đó của khách hàng trong một năm mua hàng nào đó được nhập từ bàn phím. 
-- Anh chị hãy thực hiện Query này. Danh sách gồm các cột như trên. 

declare	@QuocGia nvarchar(40),
		@Nam int

set		@QuocGia = 'France'
set		@Nam = 1996

select CompanyName, OrderDate, ShipCountry
from	Orders o, Customers c
where	o.CustomerID = c.CustomerID
		and year(OrderDate) = @Nam
		and ShipCountry = @QuocGia

--32.	Tạo danh sách các Product thuộc một loại nào đó khi nhập Category ID từ bàn phím. Danh sách gồm: Product Name, Unit Price, Supplier 

declare	@CategoryID int
set		@CategoryID = 8

select	CategoryName, ProductName, UnitPrice, s.CompanyName as Supplier
from	Products p, Categories c, Suppliers s
where	p.CategoryID = c.CategoryID
		and p.SupplierID = s.SupplierID
		and p.CategoryID = @CategoryID
