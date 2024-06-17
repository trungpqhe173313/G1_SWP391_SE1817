CREATE DATABASE Barber;
GO

USE Barber;
GO

CREATE TABLE [Services] (
	[servicesId] INT IDENTITY UNIQUE,
	[name] NVARCHAR(255),
	[image] NVARCHAR(255),
	[price] INT,
	[description] NVARCHAR(255),
	[isActive] BIT,
	PRIMARY KEY([servicesId])
);
GO

-- Remove the empty index creation

CREATE TABLE [employee] (
	[employeeId] INT NOT NULL IDENTITY UNIQUE,
	[fullName] NVARCHAR(255),
	[phone] NVARCHAR(255),
	[statusEmployee] INT,
	[updateTime] DATETIME,
	PRIMARY KEY([employeeId])
);
GO

CREATE TABLE [account] (
	[phone] NVARCHAR(255),
	[pass] NVARCHAR(255),
	[roleId] INT,
	[email] NVARCHAR(255),
	[gender] BIT,
	[isActive] BIT,
	[avatar] NVARCHAR(255),
	PRIMARY KEY([phone])
);
GO

CREATE TABLE [role] (
	[id] INT NOT NULL IDENTITY UNIQUE,
	[role] NVARCHAR(255) UNIQUE,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [Order_services] (
	[servicesId] INT,
	[OrderId] INT,
	PRIMARY KEY([servicesId], [OrderId])
);
GO

CREATE TABLE [order] (
	[orderId] INT NOT NULL IDENTITY UNIQUE,
	[customerId] INT,
	[employeeId] INT,
	[statusID] INT,
	[orderDate] DATE,
	[totalAmount] INT,
	[shiftId] INT,
	[updateTime] DATETIME,
	PRIMARY KEY([orderId])
);
GO

CREATE TABLE [shift] (
	[id] INT NOT NULL IDENTITY UNIQUE,
	[startTime] NVARCHAR(255),
	PRIMARY KEY([id])
);
GO

CREATE TABLE [status] (
	[id] INT NOT NULL IDENTITY UNIQUE,
	[status] NVARCHAR(255),
	PRIMARY KEY([id])
);
GO

CREATE TABLE [customer] (
	[customerId] INT IDENTITY UNIQUE,
	[fullName] NVARCHAR(255),
	[phone] NVARCHAR(255),
	PRIMARY KEY([customerId])
);
GO

CREATE TABLE [feedback] (
	[id] INT NOT NULL IDENTITY UNIQUE,
	[noidung] NVARCHAR(255),
	[customerId] INT,
	[isActive] BIT,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [store] (
	[id] INT NOT NULL IDENTITY UNIQUE,
	[isActive] BIT,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [statusEmployee] (
	[id] INT NOT NULL IDENTITY UNIQUE,
	[status] NVARCHAR(255) UNIQUE,
	PRIMARY KEY([id])
);
GO

ALTER TABLE [account]
ADD FOREIGN KEY([roleId]) REFERENCES [role]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [order]
ADD FOREIGN KEY([statusID]) REFERENCES [status]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [Order_services]
ADD FOREIGN KEY([OrderId]) REFERENCES [order]([orderId])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [Order_services]
ADD FOREIGN KEY([servicesId]) REFERENCES [Services]([servicesId])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [order]
ADD FOREIGN KEY([shiftId]) REFERENCES [shift]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [employee]
ADD FOREIGN KEY([phone]) REFERENCES [account]([phone])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [customer]
ADD FOREIGN KEY([phone]) REFERENCES [account]([phone])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [order]
ADD FOREIGN KEY([customerId]) REFERENCES [customer]([customerId])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [feedback]
ADD FOREIGN KEY([customerId]) REFERENCES [customer]([customerId])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [order]
ADD FOREIGN KEY([employeeId]) REFERENCES [employee]([employeeId])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [employee]
ADD FOREIGN KEY([statusEmployee]) REFERENCES [statusEmployee]([id])
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO
CREATE TRIGGER trg_UpdateEmployeeTime
ON [employee]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE([statusEmployee])
    BEGIN
        UPDATE [employee]
        SET [updateTime] = GETDATE()
        WHERE [employeeId] IN (SELECT [employeeId] FROM inserted);
    END
END;
GO
CREATE TRIGGER trg_UpdateOrderTime
ON [order]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE([statusID])
    BEGIN
        UPDATE [order]
        SET [updateTime] = GETDATE()
        WHERE [orderId] IN (SELECT [orderId] FROM inserted);
    END
END;
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
(N'Nghỉ Làm');
GO

-- Inserting data into account table
INSERT INTO account (phone, pass, roleId, email, gender, isActive, avatar) VALUES
(N'0912345671', 'password1', 1, 'admin@example.com', 1, 1, NULL),
(N'0912345679', 'password2', 2, 'trung@example.com', 1, 1, NULL),
(N'0912345678', 'password3', 2, 'quypdhe173508@fpt.edu.vn', 1, 1, NULL),
(N'0912345677', 'password4', 2, 'thien@example.com', 1, 1, NULL),
(N'0912345676', 'password5', 2, 'anh@example.com', 1, 1, NULL),
(N'0912345675', 'password6', 2, 'kiet@example.com', 1, 1, NULL),
(N'0912345674', 'password7', 2, 'duong@example.com', 1, 1, NULL),
(N'0912345673', 'password8', 2, 'vinh@example.com', 1, 1, NULL),
(N'0912345672', 'password9', 2, 'uoc@example.com', 1, 1, NULL),
(N'0912345669', 'password10', 3, 'phamvana@example.com', 1, 1, NULL),
(N'0912345668', 'password11', 3, 'nguyenvanb@example.com', 1, 1, NULL),
(N'0912345667', 'password12', 3, 'truongvanc@example.com', 1, 1, NULL),
(N'0912345666', 'password13', 3, 'hoangvand@example.com', 1, 1, NULL);
GO

-- Inserting data into customer table
INSERT INTO customer (phone, fullName) VALUES
(N'0912345669', N'Phạm Văn Anh'),
(N'0912345668', N'Nguyễn Văn Bảo'),
(N'0912345667', N'Trương Văn Cam'),
(N'0912345666', N'Hoàng Văn Dương');
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

-- Inserting data into employee table
INSERT INTO employee (fullName, phone, statusEmployee, updateTime) VALUES
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
(N'Hủy Đơn');
GO

-- Inserting data into shift table
INSERT INTO shift (startTime) VALUES
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

-- Inserting data into order table
INSERT INTO [order] (customerId, employeeId, statusID, orderDate, totalAmount, shiftId, updateTime) VALUES
(1, 1, 3, '2024-06-07', 70000, 1, GETDATE()),
(2, 2, 2, '2024-06-07', 370000, 1, GETDATE()),
(3, 3, 1, '2024-06-08', 100000, 2, GETDATE()),
(4, 4, 1, '2024-06-08', 220000, 2, GETDATE());
GO

-- Inserting data into Order_services table
INSERT INTO Order_services (OrderId, servicesId) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 4),
(3, 1),
(4, 5),
(4, 6),
(4, 3);
GO

-- Inserting data into feedback table
INSERT INTO feedback (noidung, customerId, isActive) VALUES
(N'Nhân viên thái độ lồi lõm', 1, 1),
(N'Em gội đầu xinh gái', 3, 1);
GO

-- Inserting data into store table
INSERT INTO store (isActive) VALUES
(1),
(0);
GO
