use master
go
CREATE DATABASE Barber;
GO
--DROP DATABASE Barber
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
    isActive bit,
	startDate DATE DEFAULT GETDATE(),
    endDate DATE DEFAULT GETDATE()
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
    MinAmount INT NOT NULL,
    PointsPerUnit INT NOT NULL
);

CREATE TABLE LeaveRequestStatus (
    id INT IDENTITY(1,1) PRIMARY KEY,
    status NVARCHAR(255) NOT NULL
);

CREATE TABLE LeaveRequests (
    requestId INT IDENTITY(1,1) PRIMARY KEY,
    employeeId INT,
    startDate DATE,
    endDate DATE,
    reason NVARCHAR(255),
    statusId INT,
    requestDate DATETIME DEFAULT GETDATE(),
    approvalDate DATETIME,
    CONSTRAINT FK_LeaveRequests_employee FOREIGN KEY (employeeId) REFERENCES employee(employeeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_LeaveRequests_status FOREIGN KEY (statusId) REFERENCES LeaveRequestStatus(id) ON DELETE NO ACTION ON UPDATE NO ACTION
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
GO

ALTER TABLE account
ADD CONSTRAINT FK_account_role FOREIGN KEY (roleId) REFERENCES role(id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE employee
ADD CONSTRAINT FK_employee_statusEmployee FOREIGN KEY (statusEmployee) REFERENCES statusEmployee(id) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('trg_UpdateStatusOnEndTimeChange', 'TR') IS NOT NULL
    DROP TRIGGER trg_UpdateStatusOnEndTimeChange;
GO

-- Tạo lại trigger
CREATE TRIGGER trg_UpdateStatusOnEndTimeChange
ON Voucher
AFTER UPDATE
AS
BEGIN
    IF UPDATE(endTime)
    BEGIN
        UPDATE v
        SET v.status = CASE WHEN GETDATE() BETWEEN v.startTime AND i.endTime THEN 1 ELSE 0 END
        FROM Voucher v
        INNER JOIN inserted i ON v.id = i.id;
    END
END;

-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('trg_UpdateStatusToZeroOnPastEndTime', 'TR') IS NOT NULL
    DROP TRIGGER trg_UpdateStatusToZeroOnPastEndTime;
GO

-- Tạo trigger mới
CREATE TRIGGER trg_UpdateStatusToZeroOnPastEndTime
ON Voucher
AFTER UPDATE
AS
BEGIN
    IF UPDATE(endTime)
    BEGIN
        UPDATE Voucher
        SET status = 0
        FROM Voucher v
        INNER JOIN inserted i ON v.id = i.id
        WHERE i.endTime < CAST(GETDATE() AS DATE);
    END
END;
GO
CREATE OR ALTER TRIGGER trg_update_store_status
ON store
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @today DATE = GETDATE();
    
    UPDATE s
    SET isActive = 
        CASE
            WHEN @today >= s.startDate AND @today <= s.endDate THEN 0
            ELSE 1
        END
    FROM store s
    INNER JOIN inserted i ON s.id = i.id; -- Assuming 'id' is the primary key of 'store' table
END;
go

CREATE TRIGGER trg_UpdateTimeOnStatusChange
ON Orders
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra nếu statusID thay đổi
    IF UPDATE(statusID)
    BEGIN
        UPDATE Orders
        SET updateTime = GETDATE()
        FROM Orders o
        INNER JOIN inserted i ON o.orderId = i.orderId
        WHERE o.orderId = i.orderId;
    END
END;
go

CREATE TRIGGER trg_UpdateTimeOnStatusEmployeeChange
ON employee
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra nếu statusEmployee thay đổi
    IF UPDATE(statusEmployee)
    BEGIN
        UPDATE employee
        SET updateTime = GETDATE()
        FROM employee e
        INNER JOIN inserted i ON e.employeeId = i.employeeId
        WHERE e.employeeId = i.employeeId;
    END
END;
go
-- Chèn các trạng thái đơn xin nghỉ ban đầu
INSERT INTO LeaveRequestStatus (status) VALUES
(N'Đang Chờ Duyệt'),
(N'Đã Duyệt'),
(N'Từ Chối');
GO

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
(N'Nghỉ Làm'),
(N'Đang phép');
GO

-- Inserting data into customer table
INSERT INTO customer (phone, fullName) VALUES
(N'0912345169', N'Phạm Văn Mách'),
(N'0912345269', N'Nguyễn Trần Duy Nhất'),
(N'0912345369', N'Hoàng Trung'),
(N'0912345469', N'Phạm Vân Trường'),
(N'0912345569', N'Nguyễn Tử Long'),
(N'0912345769', N'Phạm Khổng Minh'),
(N'0912345869', N'Phạm Văn Lanh'),
(N'0912345969', N'Phạm Văn Manh'),
(N'0912345669', N'Phạm Văn Anh'),
(N'0912345668', N'Nguyễn Văn Bảo'),
(N'0912345667', N'Trương Văn Cam'),
(N'0912345666', N'Hoàng Văn Dương'),
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
(N'0912345169', 'password3', 3, 'phamvane@example.com', 1, 1, 10, N'OIP.jpg', GETDATE()),
(N'0912345269', 'password3', 3, 'phamvanf@example.com', 1, 1, 20, N'OIP.jpg', GETDATE()),
(N'0912345369', 'password3', 3, 'phamvang@example.com', 1, 1, 10, N'OIP.jpg', GETDATE()),
(N'0912345469', 'password3', 3, 'phamvanh@example.com', 1, 1, 10, N'OIP.jpg', GETDATE()),
(N'0912345569', 'password3', 3, 'phamvani@example.com', 1, 1, 10, N'OIP.jpg', GETDATE()),
(N'0912345769', 'password3', 3, 'phamvank@example.com', 1, 1, 10, N'OIP.jpg', GETDATE()),
(N'0912345869', 'password3', 3, 'phamvanl@example.com', 1, 1, 20, N'OIP.jpg', GETDATE()),
(N'0912345969', 'password3', 3, 'phamvanm@example.com', 1, 1, 100, N'OIP.jpg', GETDATE()),
(N'0912345611', 'password2', 2, 'thuat@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345671', 'password1', 1, 'admin@example.com', 1, 1, NULL, NULL, GETDATE()),
(N'0912345679', 'password2', 2, 'trung@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345678', 'password2', 2, 'quypdhe173508@fpt.edu.vn', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345677', 'password2', 2, 'thien@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345676', 'password2', 2, 'anh@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345675', 'password2', 2, 'kiet@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345674', 'password2', 2, 'duong@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345673', 'password2', 2, 'vinh@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345672', 'password2', 2, 'uoc@example.com', 1, 1, NULL, N'OIP.jpg', GETDATE()),
(N'0912345669', 'password3', 3, 'phamvana@example.com', 1, 1, 100, N'OIP.jpg', GETDATE()),
(N'0912345668', 'password3', 3, 'nguyenvanb@example.com', 1, 1, 100, N'OIP.jpg', GETDATE()),
(N'0912345667', 'password3', 3, 'truongvanc@example.com', 1, 1, 100, N'OIP.jpg', GETDATE()),
(N'0912345666', 'password3', 3, 'hoangvand@example.com', 1, 1, 100, N'OIP.jpg', GETDATE());
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

-- Inserting data into status table
INSERT INTO status ([status]) VALUES
(N'Đã Đặt'),
(N'Hàng Đợi'),
(N'Bắt Đầu'),
(N'Thanh Toán'),
(N'Hủy Đơn'),
(N'Thanh Toán Thất Bại');
GO
-- Chèn dữ liệu mẫu vào bảng LeaveRequests
INSERT INTO LeaveRequests (employeeId, startDate, endDate, reason, statusId) VALUES
(1, '2023-07-01', '2023-07-05', N'Nghỉ phép năm', 1),
(2, '2023-08-10', '2023-08-15', N'Nghỉ ốm', 1),
(3, '2023-09-20', '2023-09-25', N'Nghỉ cưới', 1);

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
(N'14072024BK001', 1, 1, 4, '2024-07-14', 150000),
(N'20072024BK002', 2, 2, 4, '2024-07-20', 180000),
(N'22072024BK003', 3, 3, 4, '2024-07-22', 250000),
(N'23072024BK004', 4, 4, 4, '2024-07-23', 120000),
(N'27072024BK001', 9, 1, 5, '2024-07-27', 190000),
(N'25072024BK001', 10, 1, 4, '2024-07-25', 190000),
(N'28072024BK001', 11, 1, 3, '2024-07-28', 210000),
(N'28062024BK002', 10, 2, 4, '2024-06-13', 213000),
(N'28062024BK003', 5, 3, 4, '2024-06-21', 315000),
(N'28062024BK004', 12, 3, 4, '2024-06-15', 128000),
(N'28062024BK005', 2, 4, 4, '2024-06-17', 570000),
(N'17062024BK006', 3, 5, 4, '2024-06-17', 430000),
(N'28062024BK007', 4, 6, 4, '2024-06-03', 600000),
(N'28062024BK008', 6, 2, 4, '2024-06-26', 380000),
(N'28062024BK009', 7, 2, 4, '2024-06-29', 550000),
(N'28062024BK010', 10, 7, 4, '2024-06-30', 620000),
(N'28062024BK011', 8, 8, 4, '2024-06-17', 440000),
(N'29072024BK005', 5, NULL, 1, '2024-07-29', 170000),
(N'29072024BK006', 6, NULL, 1, '2024-07-29', 130000),
(N'29072024BK007', 7, NULL, 1, '2024-07-29', 140000),
(N'29072024BK008', 8, NULL, 1, '2024-07-29', 160000);
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
(3, 5),
(4, 11),
(1, 12),
(1, 13),
(4, 13),
(1, 14),
(2, 15),
(4, 15),
(2, 16),
(3, 17),
(3, 18),
(4, 19),
(5, 20),
(6, 21);
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
	(7, 10),
	(2, 11),
	(2, 12),
	(2, 13),
	(2, 14),
	(2, 15),
	(2, 16),
	(2, 17),
	(2, 18),
	(2, 19),
	(2, 20),
	(2, 21);
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
N'Barber-performing-a-shave-service-1-scaled.jpg', GETDATE(), GETDATE(), 1),

(N'Làm sao để chăm sóc tóc sau khi uốn', 
N'Uốn tóc có thể làm tóc trở nên khô và dễ gãy. Để giữ cho tóc luôn mềm mượt và khỏe mạnh sau khi uốn, bạn cần biết cách chăm sóc đúng cách. Bài viết này sẽ chia sẻ một số bí quyết chăm sóc tóc hiệu quả sau khi uốn.', 
N'Barber-performing-a-shave-service-1-scaled.jpg', GETDATE(), GETDATE(), 1),

(N'Các sản phẩm dưỡng tóc tốt nhất cho tóc nhuộm', 
N'Tóc nhuộm cần được chăm sóc đặc biệt để giữ màu lâu và tóc luôn khỏe mạnh. Dưới đây là danh sách các sản phẩm dưỡng tóc tốt nhất mà bạn nên thử cho tóc nhuộm của mình.', 
N'Barber-performing-a-shave-service-1-scaled.jpg', GETDATE(), GETDATE(), 1),

(N'Mẹo vặt để cắt tóc tại nhà', 
N'Không phải lúc nào bạn cũng có thể đến tiệm cắt tóc. Trong những trường hợp đó, biết cách tự cắt tóc tại nhà sẽ rất hữu ích. Bài viết này sẽ hướng dẫn bạn một số mẹo để cắt tóc tại nhà dễ dàng và đẹp.', 
N'Barber-performing-a-shave-service-1-scaled.jpg', GETDATE(), GETDATE(), 1),

(N'Xu hướng màu tóc nổi bật cho năm 2024', 
N'Bạn đang tìm kiếm một sự thay đổi cho màu tóc của mình? Hãy cùng khám phá những xu hướng màu tóc nổi bật cho năm 2024. Từ những màu sắc truyền thống đến những tông màu nổi bật, chắc chắn sẽ có lựa chọn phù hợp cho bạn.', 
N'Barber-performing-a-shave-service-1-scaled.jpg', GETDATE(), GETDATE(), 1);
GO

