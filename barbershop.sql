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
  [username] varchar(10) UNIQUE NOT NULL,
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
  [name] nvarchar(50),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng positions
CREATE TABLE [positions] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL,
  [description] varchar(255),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng employees
CREATE TABLE [employees] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [accountId] int NOT NULL,
  [isActive] bit DEFAULT (1),
  [positionId] int NOT NULL,
  [dateOfBirth] date NOT NULL,
  [address] nvarchar(255) NOT NULL,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng shifts
CREATE TABLE [shifts] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [startTime] time NOT NULL,
  [endTime] time NOT NULL,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng statuses
CREATE TABLE [statuses] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50),
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
  [totalAmount] decimal(10, 2),
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
  [price] decimal(10, 2) NOT NULL,
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime
);
GO

-- Tạo bảng order_services
CREATE TABLE [order_services] (
  [orderId] int NOT NULL,
  [serviceId] int NOT NULL,
  [isActive] bit DEFAULT (1),
  [quantity] int NOT NULL DEFAULT (1),
  [createdAt] datetime NOT NULL,
  [updatedAt] datetime,
  PRIMARY KEY (orderId, serviceId)
);
GO

-- Tạo bảng schedules_work
CREATE TABLE [schedules_work] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [employeeId] int NOT NULL,
  [orderId] int NOT NULL,
  [date] date NOT NULL,
  [shiftsID] int NOT NULL,
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
ADD FOREIGN KEY ([accountId]) REFERENCES [accounts] ([id]),
    FOREIGN KEY ([positionId]) REFERENCES [positions] ([id]);
GO

-- Thiết lập khóa ngoại cho bảng schedules_work
ALTER TABLE [schedules_work] 
ADD FOREIGN KEY ([employeeId]) REFERENCES [employees] ([id]),
    FOREIGN KEY ([orderId]) REFERENCES [orders] ([id]),
    FOREIGN KEY ([shiftsID]) REFERENCES [shifts] ([id]);
GO

-- Thiết lập khóa ngoại cho bảng orders
ALTER TABLE [orders] 
ADD FOREIGN KEY ([accountID]) REFERENCES [accounts] ([id]),
    FOREIGN KEY ([employeeId]) REFERENCES [employees] ([id]),
    FOREIGN KEY ([statusId]) REFERENCES [statuses] ([id]),
    FOREIGN KEY ([shiftsID]) REFERENCES [shifts] ([id]);
GO

-- Chèn dữ liệu vào bảng roles
INSERT INTO roles (name, createdAt, updatedAt) VALUES 
(N'thu ngân', GETDATE(), GETDATE()),
(N'user', GETDATE(), GETDATE()),
(N'admin', GETDATE(), GETDATE()),
(N'thợ cắt tóc', GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng positions
INSERT INTO positions (name, description, createdAt, updatedAt) VALUES
(N'Thu ngân', N'Nhân viên thu ngân', GETDATE(), GETDATE()),
(N'Thợ cắt tóc', N'Nhân viên cắt tóc', GETDATE(), GETDATE()),
(N'Quản lý', N'Nhân viên quản lý', GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng accounts
INSERT INTO accounts (username, password, fullName, email, avatar, isMale, roleId, isActive, createdAt, updatedAt) VALUES
('user01', 'password1', N'Nguyễn Văn A', 'user01@example.com', NULL, 1, 2, 1, GETDATE(), GETDATE()), -- roleId = 2 (user)
('user02', 'password2', N'Lê Thị B', 'user02@example.com', NULL, 0, 2, 1, GETDATE(), GETDATE()), -- roleId = 2 (user)
('admin01', 'password3', N'Trần Văn C', 'admin01@example.com', NULL, 1, 3, 1, GETDATE(), GETDATE()), -- roleId = 3 (admin)
('cashier01', 'password4', N'Phạm Thị D', 'cashier01@example.com', NULL, 0, 1, 1, GETDATE(), GETDATE()), -- roleId = 1 (thu ngân)
('barber01', 'password5', N'Ngô Văn E', 'barber01@example.com', NULL, 1, 4, 1, GETDATE(), GETDATE()), -- roleId = 4 (thợ cắt tóc)
('barber02', 'password6', N'Hoàng Thị F', 'barber02@example.com', NULL, 0, 4, 1, GETDATE(), GETDATE()); -- roleId = 4 (thợ cắt tóc)
GO

-- Chèn dữ liệu vào bảng employees
INSERT INTO employees (accountId, isActive, positionId, dateOfBirth, address, createdAt, updatedAt) VALUES
(4, 1, 1, '1990-01-01', N'123 Đường A, Hà Nội', GETDATE(), GETDATE()), -- accountId = 4 (cashier01)
(5, 1, 2, '1991-02-01', N'456 Đường B, Hà Nội', GETDATE(), GETDATE()), -- accountId = 5 (barber01)
(6, 1, 2, '1992-03-01', N'789 Đường C, Hà Nội', GETDATE(), GETDATE()); -- accountId = 6 (barber02)
GO

-- Chèn dữ liệu vào bảng statuses
INSERT INTO statuses (name, createdAt, updatedAt) VALUES
(N'Đang xử lý', GETDATE(), GETDATE()),
(N'Xác nhận', GETDATE(), GETDATE()),
(N'Hoàn thành', GETDATE(), GETDATE()),
(N'Đã hủy', GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng shifts với thời gian cách nhau 30 phút từ 9h đến 20h
INSERT INTO shifts (startTime, endTime, createdAt, updatedAt) VALUES
('09:00:00', '09:30:00', GETDATE(), GETDATE()),
('09:30:00', '10:00:00', GETDATE(), GETDATE()),
('10:00:00', '10:30:00', GETDATE(), GETDATE()),
('10:30:00', '11:00:00', GETDATE(), GETDATE()),
('11:00:00', '11:30:00', GETDATE(), GETDATE()),
('11:30:00', '12:00:00', GETDATE(), GETDATE()),
('12:00:00', '12:30:00', GETDATE(), GETDATE()),
('12:30:00', '13:00:00', GETDATE(), GETDATE()),
('13:00:00', '13:30:00', GETDATE(), GETDATE()),
('13:30:00', '14:00:00', GETDATE(), GETDATE()),
('14:00:00', '14:30:00', GETDATE(), GETDATE()),
('14:30:00', '15:00:00', GETDATE(), GETDATE()),
('15:00:00', '15:30:00', GETDATE(), GETDATE()),
('15:30:00', '16:00:00', GETDATE(), GETDATE()),
('16:00:00', '16:30:00', GETDATE(), GETDATE()),
('16:30:00', '17:00:00', GETDATE(), GETDATE()),
('17:00:00', '17:30:00', GETDATE(), GETDATE()),
('17:30:00', '18:00:00', GETDATE(), GETDATE()),
('18:00:00', '18:30:00', GETDATE(), GETDATE()),
('18:30:00', '19:00:00', GETDATE(), GETDATE()),
('19:00:00', '19:30:00', GETDATE(), GETDATE()),
('19:30:00', '20:00:00', GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng orders chỉ với tài khoản có role là user và employeeId là thợ cắt tóc
INSERT INTO orders (accountID, employeeId, shiftsID, statusId, orderDate, totalAmount, createdAt, updatedAt) VALUES
(1, 2, 1, 1, GETDATE(), 100.00, GETDATE(), GETDATE()), -- accountID = 1 (user01), employeeId = 2 (barber01), shiftsID = 1, statusId = 1 (Đang xử lý)
(2, 3, 2, 2, GETDATE(), 150.00, GETDATE(), GETDATE()), -- accountID = 2 (user02), employeeId = 3 (barber02), shiftsID = 2, statusId = 2 (Xác nhận)
(1, 2, 3, 3, GETDATE(), 200.00, GETDATE(), GETDATE()); -- accountID = 1 (user01), employeeId = 2 (barber01), shiftsID = 3, statusId = 3 (Hoàn thành)
GO

-- Chèn dữ liệu vào bảng schedules_work chỉ với tài khoản có role là thợ cắt tóc
INSERT INTO schedules_work (employeeId, orderId, date, shiftsID, isActive, createdAt, updatedAt) VALUES
(2, 1, GETDATE(), 1, 1, GETDATE(), GETDATE()), -- employeeId = 2 (barber01), orderId = 1, shiftsID = 1
(3, 2, GETDATE(), 2, 1, GETDATE(), GETDATE()), -- employeeId = 3 (barber02), orderId = 2, shiftsID = 2
(2, 3, GETDATE(), 3, 1, GETDATE(), GETDATE()); -- employeeId = 2 (barber01), orderId = 3, shiftsID = 3
GO

-- Chèn dữ liệu vào bảng services
INSERT INTO services (name, image, description, price, createdAt, updatedAt) VALUES
(N'Cắt tóc nam', 'image1.jpg', N'Dịch vụ cắt tóc cho nam giới', 50.00, GETDATE(), GETDATE()),
(N'Cắt tóc nữ', 'image2.jpg', N'Dịch vụ cắt tóc cho nữ giới', 70.00, GETDATE(), GETDATE()),
(N'Gội đầu', 'image3.jpg', N'Dịch vụ gội đầu', 30.00, GETDATE(), GETDATE());
GO

-- Chèn dữ liệu vào bảng order_services
INSERT INTO order_services (orderId, serviceId, isActive, quantity, createdAt, updatedAt) VALUES
(1, 1, 1, 1, GETDATE(), GETDATE()), -- orderId = 1, serviceId = 1 (Cắt tóc nam)
(2, 2, 1, 1, GETDATE(), GETDATE()), -- orderId = 2, serviceId = 2 (Cắt tóc nữ)
(3, 3, 1, 1, GETDATE(), GETDATE()); -- orderId = 3, serviceId = 3 (Gội đầu)
GO
