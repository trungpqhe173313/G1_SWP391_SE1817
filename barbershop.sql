use master 
go

-- Tạo cơ sở dữ liệu
CREATE DATABASE Barbershop;
GO 

-- Sử dụng cơ sở dữ liệu
USE Barbershop;
GO

-- Tạo bảng accounts
CREATE TABLE [accounts] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [phone] varchar(10) UNIQUE NOT NULL,
  [password] varchar(255) NOT NULL,
  [fullName] nvarchar(100) NOT NULL,
  [email] varchar(100) UNIQUE NOT NULL,
  [avatar] varchar(255),
  [isMale] bit DEFAULT (1),
  [roleId] int NOT NULL,
  [isActive] bit DEFAULT (1),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng roles
CREATE TABLE [roles] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(50),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO


-- Tạo bảng employees
CREATE TABLE [employees] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [accountId] int NOT NULL,
  [isActive] bit DEFAULT (1),
  [dateOfBirth] date NOT NULL,
  [address] nvarchar(255) NOT NULL,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng shifts
CREATE TABLE [shifts] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [startTime] VARCHAR(5) NOT NULL,
  [endTime] VARCHAR(5) NOT NULL,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng statuses
CREATE TABLE [statuses] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(50),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng orders
CREATE TABLE [orders] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [accountID] int NOT NULL,
  [employeeId] int NOT NULL,
  [shiftsID] int NOT NULL,
  [statusId] int NOT NULL,
  [orderDate] datetime NOT NULL,
  [totalAmount] int,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng services
CREATE TABLE [services] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) NOT NULL,
  [image] varchar(255) NOT NULL,
  [description] nvarchar(255),
  [price] int NOT NULL,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng order_services
CREATE TABLE [order_services] (
  [orderId] int NOT NULL,
  [serviceId] int NOT NULL,
  [isActive] bit DEFAULT (1),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime,
  PRIMARY KEY (orderId, serviceId)
);
GO

-- Tạo bảng schedules_work
CREATE TABLE [schedules_work] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [orderId] int NOT NULL,
  [isActive] bit DEFAULT (1),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Thiết lập khóa ngoại cho bảng order_services
ALTER TABLE [order_services] 
ADD FOREIGN KEY ([orderId]) REFERENCES [orders] ([id]),
    FOREIGN KEY ([serviceId]) REFERENCES [services] ([id]);
GO

-- Thiết lập khóa ngoại cho bảng accounts
ALTER TABLE [accounts] 
ADD FOREIGN KEY ([roleId]) REFERENCES [roles] ([id]);
GO

-- Thiết lập khóa ngoại cho bảng employees
ALTER TABLE [employees] 
ADD FOREIGN KEY ([accountId]) REFERENCES [accounts] ([id]);
GO

-- Thiết lập khóa ngoại cho bảng schedules_work
ALTER TABLE [schedules_work] 
ADD  FOREIGN KEY ([orderId]) REFERENCES [orders] ([id]);
GO

-- Thiết lập khóa ngoại cho bảng orders
ALTER TABLE [orders] 
ADD FOREIGN KEY ([accountID]) REFERENCES [accounts] ([id]),
    FOREIGN KEY ([employeeId]) REFERENCES [accounts] ([id]),
    FOREIGN KEY ([statusId]) REFERENCES [statuses] ([id]),
    FOREIGN KEY ([shiftsID]) REFERENCES [shifts] ([id]);
GO
-- Chèn dữ liệu vào bảng roles
INSERT INTO roles (name, createdAt, updatedAt)
VALUES 
('user', GETDATE(), GETDATE()),
('admin', GETDATE(), GETDATE()),
('cashier', GETDATE(), GETDATE()),
('barber', GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng accounts
INSERT INTO accounts (phone, password, fullName, email, avatar, isMale, roleId, isActive, createdAt, updatedAt)
VALUES 
('0123456789', 'password1', N'Nguyễn Văn A', 'user1@example.com', 'avatar1.png', 1, 1, 1, GETDATE(), GETDATE()),  -- user
('0123456788', 'password2', N'Nguyễn Văn B', 'user2@example.com', 'avatar2.png', 1, 1, 1, GETDATE(), GETDATE()),  -- user
('0123456787', 'password3', N'Nguyễn Văn C', 'admin@example.com', 'avatar3.png', 1, 2, 1, GETDATE(), GETDATE()),  -- admin
('0123456786', 'password4', N'Trần Thị D', 'cashier@example.com', 'avatar4.png', 0, 3, 1, GETDATE(), GETDATE()),  -- cashier
('0123456785', 'password5', N'Phạm Văn E', 'barber1@example.com', 'avatar5.png', 1, 4, 1, GETDATE(), GETDATE()),  -- barber
('0123456784', 'password6', N'Lê Văn F', 'barber2@example.com', 'avatar6.png', 1, 4, 1, GETDATE(), GETDATE());   -- barber
GO

-- Chèn dữ liệu vào bảng employees
INSERT INTO employees (accountId, isActive, dateOfBirth, address, createdAt, updatedAt)
VALUES 
(4, 1, '1985-01-01', N'123 Đường ABC, Quận 1', GETDATE(), GETDATE()),  -- cashier
(5, 1, '1990-02-02', N'456 Đường DEF, Quận 2', GETDATE(), GETDATE()),  -- barber
(6, 1, '1992-03-03', N'789 Đường GHI, Quận 3', GETDATE(), GETDATE());  -- barber
GO

-- Chèn dữ liệu vào bảng shifts với thời gian cách nhau 30 phút từ 9h đến 20h
INSERT INTO shifts (startTime, endTime, createdAt, updatedAt) VALUES
('09:00', '09:30', GETDATE(), GETDATE()),
('09:30', '10:00', GETDATE(), GETDATE()),
('10:00', '10:30', GETDATE(), GETDATE()),
('10:30', '11:00', GETDATE(), GETDATE()),
('11:00', '11:30', GETDATE(), GETDATE()),
('11:30', '12:00', GETDATE(), GETDATE()),
('12:00', '12:30', GETDATE(), GETDATE()),
('12:30', '13:00', GETDATE(), GETDATE()),
('13:00', '13:30', GETDATE(), GETDATE()),
('13:30', '14:00', GETDATE(), GETDATE()),
('14:00', '14:30', GETDATE(), GETDATE()),
('14:30', '15:00', GETDATE(), GETDATE()),
('15:00', '15:30', GETDATE(), GETDATE()),
('15:30', '16:00', GETDATE(), GETDATE()),
('16:00', '16:30', GETDATE(), GETDATE()),
('16:30', '17:00', GETDATE(), GETDATE()),
('17:00', '17:30', GETDATE(), GETDATE()),
('17:30', '18:00', GETDATE(), GETDATE()),
('18:00', '18:30', GETDATE(), GETDATE()),
('18:30', '19:00', GETDATE(), GETDATE()),
('19:00', '19:30', GETDATE(), GETDATE()),
('19:30', '20:00', GETDATE(), GETDATE());
GO

INSERT INTO statuses (name, createdAt, updatedAt)
VALUES 
('Processing', GETDATE(), GETDATE()),
('Confirm', GETDATE(), GETDATE()),
('Completed', GETDATE(), GETDATE()),
('Cancelled', GETDATE(), GETDATE());
GO

INSERT INTO services (name, image, description, price, createdAt, updatedAt)
VALUES 
(N'Cắt tóc', 'cut.jpg', N'Cắt tóc nam', 100, GETDATE(), GETDATE()),
(N'Gội đầu', 'wash.jpg', N'Gội đầu và massage', 50, GETDATE(), GETDATE()),
(N'Nhuộm tóc', 'dye.jpg', N'Nhuộm tóc thời trang', 200, GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng orders
INSERT INTO orders (accountID, employeeId, shiftsID, statusId, orderDate, totalAmount, createdAt, updatedAt)
VALUES 
(1, 5, 1, 1, GETDATE(), 150, GETDATE(), GETDATE()),  -- order 1
(2, 6, 2, 2, GETDATE(), 250, GETDATE(), GETDATE()),  -- order 2
(1, 5, 3, 3, GETDATE(), 100, GETDATE(), GETDATE());  -- order 3
GO

-- Chèn dữ liệu vào bảng order_services
INSERT INTO order_services (orderId, serviceId, isActive, createdAt, updatedAt)
VALUES 
(1, 1, 1, GETDATE(), GETDATE()),  -- service 1 for order 1
(1, 2, 1, GETDATE(), GETDATE()),  -- service 2 for order 1
(2, 3, 1, GETDATE(), GETDATE()),  -- service 3 for order 2
(3, 1, 1, GETDATE(), GETDATE());  -- service 1 for order 3
GO

-- Chèn dữ liệu vào bảng schedules_work
INSERT INTO schedules_work (orderId, isActive, createdAt, updatedAt)
VALUES 
(1, 1, GETDATE(), GETDATE()),  -- schedule for order 1
(2, 1, GETDATE(), GETDATE()),  -- schedule for order 2
(3, 1, GETDATE(), GETDATE());  -- schedule for order 3
GO
