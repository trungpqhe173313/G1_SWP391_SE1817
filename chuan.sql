CREATE DATABASE Barber;
GO

USE Barber;
GO
CREATE TABLE Services (
    servicesId int IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(255),
    image nvarchar(255),
    price int,
    description nvarchar(255),
    isActive bit
);

CREATE TABLE customer (
    customerId int IDENTITY(1,1) PRIMARY KEY,
    fullName nvarchar(255),
    phone nvarchar(255) UNIQUE
);

CREATE TABLE status (
    id int IDENTITY(1,1) PRIMARY KEY,
    status nvarchar(255)
);

CREATE TABLE account (
    phone nvarchar(255) PRIMARY KEY,
    pass nvarchar(255),
    roleId int,
    email nvarchar(255),
    gender bit,
    isActive bit,
    points int,
    avatar nvarchar(255),
	updateTime DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_account_customer FOREIGN KEY (phone) REFERENCES customer(phone) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE employee (
    employeeId int IDENTITY(1,1) PRIMARY KEY,
    fullName nvarchar(255),
    phone nvarchar(255) UNIQUE,
    statusEmployee int,
	createdAt DATETIME DEFAULT GETDATE(),
    updateTime DATETIME DEFAULT GETDATE(),
	CONSTRAINT FK_employee_account FOREIGN KEY (phone) REFERENCES account(phone) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE admin (
    adminId int IDENTITY(1,1) PRIMARY KEY,
    fullName nvarchar(255),
    phone nvarchar(255) UNIQUE,
	CONSTRAINT FK_admin_account FOREIGN KEY (phone) REFERENCES account(phone) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE role (
    id int IDENTITY(1,1) PRIMARY KEY,
    role nvarchar(255)
);



CREATE TABLE Orders (
    orderId int IDENTITY(1,1) PRIMARY KEY,
    orderCode nvarchar(50) UNIQUE,
    customerId int,
    employeeId int,
    statusID int,
    orderDate date,
    totalAmount int,
    updateTime datetime,
    CONSTRAINT FK_Orders_customer FOREIGN KEY (customerId) REFERENCES customer(customerId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_Orders_employee FOREIGN KEY (employeeId) REFERENCES employee(employeeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_Orders_status FOREIGN KEY (statusID) REFERENCES status(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Order_services (
    servicesId int,
    orderId int,
    PRIMARY KEY(servicesId, orderId),
    CONSTRAINT FK_Order_services_services FOREIGN KEY (servicesId) REFERENCES Services(servicesId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_Order_services_orders FOREIGN KEY (orderId) REFERENCES Orders(orderId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE shift (
    id int IDENTITY(1,1) PRIMARY KEY,
    startTime nvarchar(255)
);


CREATE TABLE feedback (
    id int IDENTITY(1,1) PRIMARY KEY,
    noidung nvarchar(255),
    customerId int,
    isActive bit,
    CONSTRAINT FK_feedback_customer FOREIGN KEY (customerId) REFERENCES customer(customerId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE store (
    id int IDENTITY(1,1) PRIMARY KEY,
    isActive bit
);

CREATE TABLE statusEmployee (
    id int IDENTITY(1,1) PRIMARY KEY,
    status nvarchar(255)
);

CREATE TABLE Order_shift (
    ShiftID int,
    OrderID int,
    PRIMARY KEY(ShiftID, OrderID),
    CONSTRAINT FK_Order_shift_shift FOREIGN KEY (ShiftID) REFERENCES shift(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_Order_shift_orders FOREIGN KEY (OrderID) REFERENCES Orders(orderId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE discount (
    id int IDENTITY(1,1) PRIMARY KEY,
    point int,
    discount float
);

CREATE TABLE Chat (
    id int IDENTITY(1,1) PRIMARY KEY,
    SenderID int,
    adminId int,
    MessageContent nvarchar(255),
    SendTime datetime DEFAULT GETDATE(),
    MessageStatus nvarchar(255),
	senderType nvarchar(50),
    CONSTRAINT FK_Chat_admin FOREIGN KEY (adminId) REFERENCES admin(adminId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_Chat_customer FOREIGN KEY (SenderID) REFERENCES customer(customerId) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Voucher (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name nvarchar(255),
    discount float,
    status int,
    startTime date,
    endTime date
);
CREATE TABLE LoyaltyPolicies (
    PolicyID INT IDENTITY(1,1) PRIMARY KEY,
    MinAmount INT NOT NULL, -- Số tiền tối thiểu để bắt đầu tính điểm
    PointsPerUnit INT NOT NULL -- Số điểm cho mỗi đơn vị tiền chi tiêu
);
CREATE TABLE BlogPosts (
    postId INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
	image NVARCHAR(255),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    isActive BIT DEFAULT 1,
);

ALTER TABLE account
ADD CONSTRAINT FK_account_role FOREIGN KEY (roleId) REFERENCES role(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE employee
ADD CONSTRAINT FK_employee_statusEmployee FOREIGN KEY (statusEmployee) REFERENCES statusEmployee(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

CREATE TRIGGER trg_UpdateVoucherStatus
ON Voucher
AFTER UPDATE, INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @currentDate date;
    SET @currentDate = CAST(GETDATE() AS date);

    UPDATE Voucher
    SET status = 0
    WHERE endTime < @currentDate
      AND status != 0;
END;

-- Inserting data into roles table
INSERT INTO role ([role]) VALUES
(N'admin'),
(N'employee'),
(N'customer');
GO

-- Inserting the three statuses into statusEmployee table
INSERT INTO statusEmployee ([status]) VALUES
(N'Đang Rảnh'),
(N'Đang Bận'),
(N'Nghỉ Làm');
GO

-- Inserting data into customer table
INSERT INTO customer (phone, fullName) VALUES
(N'0912345169', N'Phạm Văn Eanh'),
(N'0912345269', N'Phạm Văn Fanh'),
(N'0912345369', N'Phạm Văn Ganh'),
(N'0912345469', N'Phạm Văn Hanh'),
(N'0912345569', N'Phạm Văn Ianh'),
(N'0912345769', N'Phạm Văn Kanh'),
(N'0912345869', N'Phạm Văn Lanh'),
(N'0912345969', N'Phạm Văn Manh'),
(N'0912345669', N'Phạm Văn Anh'),
(N'0912345668', N'Nguyễn Văn B'),
(N'0912345667', N'Trương Văn C'),
(N'0912345666', N'Hoàng Văn D'),
(N'0912345611', N'Đỗ Tiến Thuật'),
(N'0912345679', N'Phạm Quốc Trung'),
(N'0912345678', N'Phạm Đạt Quý'),
(N'0912345677', N'Phạm Đức Thiện'),
(N'0912345676', N'Phạm Quang Đức Anh'),
(N'0912345675', N'Quách Thế Kiệt'),
(N'0912345674', N'Nguyễn Cảnh Dương'),
(N'0912345673', N'Đỗ Đức Vinh'),
(N'0912345672', N'Nguyễn Quang Bá Ước'),
(N'0912345671', N'Admin');
GO

-- Inserting data into account table
INSERT INTO account (phone, pass, roleId, email, gender, isActive, points, avatar, updateTime) VALUES
(N'0912345169', 'password10', 3, 'phamvane@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345269', 'password10', 3, 'phamvanf@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345369', 'password10', 3, 'phamvang@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345469', 'password10', 3, 'phamvanh@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345569', 'password10', 3, 'phamvani@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345769', 'password10', 3, 'phamvank@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345869', 'password10', 3, 'phamvanl@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345969', 'password10', 3, 'phamvanm@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345611', 'password14', 2, 'thuat@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345671', 'password1', 1, 'admin@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345679', 'password2', 2, 'trung@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345678', 'password3', 2, 'quypdhe173508@fpt.edu.vn', 1, 1, NULL, NULL, GETDATE()),
(N'0912345677', 'password4', 2, 'thien@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345676', 'password5', 2, 'anh@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345675', 'password6', 2, 'kiet@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345674', 'password7', 2, 'duong@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345673', 'password8', 2, 'vinh@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345672', 'password9', 2, 'uoc@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345669', 'password10', 3, 'phamvana@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345668', 'password11', 3, 'nguyenvanb@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345667', 'password12', 3, 'truongvanc@example.com', 1, 1, 100, NULL, GETDATE()),
(N'0912345666', 'password13', 3, 'hoangvand@example.com', 1, 1, 100, NULL, GETDATE());
GO

-- Inserting data into employee table
INSERT INTO employee (fullName, phone, statusEmployee, updateTime) VALUES
(N'Đỗ Tiến Thuật', N'0912345611', 2, GETDATE()),
(N'Phạm Quốc Trung', N'0912345679', 1, GETDATE()),
(N'Phạm Đạt Quý', N'0912345678', 1, GETDATE()),
(N'Phạm Đức Thiện', N'0912345677', 1, GETDATE()),
(N'Phạm Quang Đức Anh', N'0912345676', 1, GETDATE()),
(N'Quách Thế Kiệt', N'0912345675', 1, GETDATE()),
(N'Nguyễn Cảnh Dương', N'0912345674', 1, GETDATE()),
(N'Đỗ Đức Vinh', N'0912345673', 1, GETDATE()),
(N'Nguyễn Quang Bá Ước', N'0912345672', 1, GETDATE());
GO

-- Inserting data into admin table
INSERT INTO admin (fullName, phone) VALUES
(N'Admin', N'0912345671');
GO

-- Inserting data into status table
INSERT INTO status ([status]) VALUES
(N'Đã Đặt'),
(N'Hàng Đợi'),
(N'Bắt Đầu'),
(N'Thanh Toán'),
(N'Hủy Đơn');
GO

-- Inserting data into discount table
INSERT INTO discount (point, discount) VALUES
(100, 10000),
(200, 20000),
(300, 30000),
(400, 40000),
(500, 50000),
(600, 60000),
(700, 70000),
(800, 80000),
(900, 90000),
(1000, 100000);
GO

-- Inserting data into shift table
INSERT INTO shift ([startTime]) VALUES
(N'08:00'),
(N'08:30'),
(N'9:00'),
(N'9:30'),
(N'10:00'),
(N'10:30'),
(N'11:00'),
(N'11:30'),
(N'13:30'),
(N'14:00'),
(N'14:30'),
(N'15:00'),
(N'15:30'),
(N'16:00'),
(N'16:30'),
(N'17:00'),
(N'17:30'),
(N'18:00'),
(N'18:30'),
(N'19:00');
GO

-- Inserting data into Services table
INSERT INTO Services (name, image, price, description, isActive) VALUES
(N'Cắt Tóc', NULL, 70000, N'Cắt tóc tạo kiểu', 1),
(N'Nhuộm Tóc', NULL, 300000, N'Nhuộm tóc', 1),
(N'Uốn Tóc', NULL, 200000, N'Uốn tóc', 1),
(N'Gội Đầu', NULL, 30000, N'Gội đầu', 1),
(N'Massage', NULL, 50000, N'Massage', 1),
(N'Trị Mụn', NULL, 70000, N'Trị mụn', 1);
GO

-- Inserting data into Orders table
INSERT INTO Orders (orderCode, customerId, employeeId, statusID, orderDate, totalAmount) VALUES
(N'A123', 1, NULL, 1, '2023-06-30', 150000),
(N'B123', 2, NULL, 1, '2023-06-30', 180000),
(N'C123', 3, NULL, 1, '2023-06-30', 250000),
(N'D123', 4, NULL, 1, '2023-06-30', 120000),
(N'E123', 5, NULL, 1, '2023-06-30', 170000),
(N'F123', 6, NULL, 1, '2023-06-30', 130000),
(N'G123', 7, NULL, 1, '2023-06-30', 140000),
(N'H123', 8, NULL, 1, '2023-06-30', 160000),
(N'I123', 9, NULL, 1, '2023-06-30', 190000),
(N'K123', 10, NULL, 1, '2023-06-30', 210000);
GO

-- Inserting data into Order_services table
INSERT INTO Order_services (servicesId, orderId) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 3),
(1, 4),
(3, 4),
(3, 6),
(1, 6),
(1, 7),
(2, 8),
(3, 8),
(1, 8),
(6, 9),
(1, 9),
(4, 10),
(1, 10),
(5, 5),
(3, 5);
GO

-- Inserting data into Chat table
INSERT INTO Chat (SenderID, adminId, MessageContent, SendTime, MessageStatus, senderType) VALUES
(1, 1, N'Hello admin', GETDATE(), N'sent', N'Customer'),
(1, 1, N'Hello', GETDATE(), N'sent', N'Admin'),
(2, 1, N'admin ơi', GETDATE(), N'sent', N'Customer'),
(2, 1, N'chào bạn', GETDATE(), N'sent', N'Admin'),
(3, 1, N'chào admin', GETDATE(), N'sent', N'Customer'),
(3, 1, N'admin xin chào', GETDATE(), N'sent', N'Admin');
GO

-- Inserting data into Voucher table
INSERT INTO Voucher (Name, discount, status, startTime, endTime) VALUES
(N'voucher 1', 10000, 1, '2023-06-30', '2023-06-30'),
(N'voucher 2', 20000, 1, '2023-06-30', '2023-06-30'),
(N'voucher 3', 30000, 1, '2023-06-30', '2023-06-30'),
(N'voucher 4', 40000, 1, '2023-06-30', '2023-06-30'),
(N'voucher 5', 50000, 1, '2023-06-30', '2023-06-30');
GO

-- Inserting data into the feedback table
INSERT INTO feedback (noidung, customerId, isActive) VALUES
(N'Nhân viên thái độ tốt.', 1, 1),
(N'Nhân viên rất nhiệt tình.', 2, 1),
(N'Nhân viên làm việc hiệu quả.', 3, 1),
(N'Nhân viên làm việc nhanh nhẹn.', 4, 1),
(N'Nhân viên thân thiện.', 5, 1),
(N'Nhân viên chuyên nghiệp.', 6, 1),
(N'Nhân viên thái độ tốt.', 7, 1),
(N'Nhân viên thái độ tốt.', 8, 1);
GO

INSERT INTO Order_shift (ShiftID, OrderID)
VALUES 
    (1, 1),
    (2, 2),
    (2, 3),
	(3, 4),
	(4, 5),
	(5, 6),
	(5, 7),
	(6, 8),
	(6, 9),
	(7, 10);
GO

INSERT INTO LoyaltyPolicies (MinAmount, PointsPerUnit)
VALUES 
    (100000, 5);
GO

-- Inserting data into store table
INSERT INTO store ([isActive]) VALUES
(1),
(0);
GO

-- Chèn dữ liệu mẫu vào bảng BlogPosts
INSERT INTO BlogPosts (title, content, image, createdAt, updatedAt, isActive)
VALUES 
(N'5 Kiểu tóc nam hot nhất mùa hè 2024', 
N'Năm 2024 mang đến nhiều kiểu tóc nam đầy phong cách và mới mẻ. Hãy cùng khám phá 5 kiểu tóc nam hot nhất mùa hè này, từ undercut cổ điển đến các kiểu tóc hiện đại như quiff và pompadour.', 
N'/images/blog/toc-nam-2024.jpg', GETDATE(), GETDATE(), 1),

(N'Làm sao để chăm sóc tóc sau khi uốn', 
N'Uốn tóc có thể làm tóc trở nên khô và dễ gãy. Để giữ cho tóc luôn mềm mượt và khỏe mạnh sau khi uốn, bạn cần biết cách chăm sóc đúng cách. Bài viết này sẽ chia sẻ một số bí quyết chăm sóc tóc hiệu quả sau khi uốn.', 
N'/images/blog/cham-soc-toc-uon.jpg', GETDATE(), GETDATE(), 1),

(N'Các sản phẩm dưỡng tóc tốt nhất cho tóc nhuộm', 
N'Tóc nhuộm cần được chăm sóc đặc biệt để giữ màu lâu và tóc luôn khỏe mạnh. Dưới đây là danh sách các sản phẩm dưỡng tóc tốt nhất mà bạn nên thử cho tóc nhuộm của mình.', 
N'/images/blog/san-pham-duong-toc-nhuom.jpg', GETDATE(), GETDATE(), 1),

(N'Mẹo vặt để cắt tóc tại nhà', 
N'Không phải lúc nào bạn cũng có thể đến tiệm cắt tóc. Trong những trường hợp đó, biết cách tự cắt tóc tại nhà sẽ rất hữu ích. Bài viết này sẽ hướng dẫn bạn một số mẹo để cắt tóc tại nhà dễ dàng và đẹp.', 
N'/images/blog/meo-cat-toc-tai-nha.jpg', GETDATE(), GETDATE(), 1),

(N'Xu hướng màu tóc nổi bật cho năm 2024', 
N'Bạn đang tìm kiếm một sự thay đổi cho màu tóc của mình? Hãy cùng khám phá những xu hướng màu tóc nổi bật cho năm 2024. Từ những màu sắc truyền thống đến những tông màu nổi bật, chắc chắn sẽ có lựa chọn phù hợp cho bạn.', 
N'/images/blog/xu-huong-mau-toc-2024.jpg', GETDATE(), GETDATE(), 1);
GO