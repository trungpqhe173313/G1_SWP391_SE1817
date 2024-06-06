CREATE DATABASE Barber;
GO
USE Barber;
GO 
CREATE TABLE Services (
    servicesId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255),
    image NVARCHAR(255),
    price INT,
    description NVARCHAR(255),
    isActive BIT
);
GO

CREATE TABLE roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    role NVARCHAR(50)
);
GO

CREATE TABLE accounts (
    phone NVARCHAR(255) PRIMARY KEY,
    pass NVARCHAR(255),
    rolesId INT NOT NULL,
    email NVARCHAR(255),
    gender BIT,
    isActive BIT,
    FOREIGN KEY (rolesId) REFERENCES roles(id)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE customers (
    phone NVARCHAR(255) PRIMARY KEY,
    fullName NVARCHAR(255),
    FOREIGN KEY (phone) REFERENCES accounts(phone)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE employees (
    employeesId INT IDENTITY(1,1) PRIMARY KEY,
    fullName NVARCHAR(255),
    phone NVARCHAR(255),
    FOREIGN KEY (phone) REFERENCES accounts(phone)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE status (
    id INT IDENTITY(1,1) PRIMARY KEY,
    status NVARCHAR(255)
);
GO

CREATE TABLE shift (
    id INT IDENTITY(1,1) PRIMARY KEY,
    startTime NVARCHAR(255)
);
GO

CREATE TABLE orders (
    orderId INT IDENTITY(1,1) PRIMARY KEY,
    phone NVARCHAR(255),
    shiftId INT,
    statusID INT,
    orderDate DATE,
    isActive BIT,
    totalAmount INT,
    FOREIGN KEY (phone) REFERENCES customers(phone)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION,
    FOREIGN KEY (shiftId) REFERENCES shift(id)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION,
    FOREIGN KEY (statusID) REFERENCES status(id)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE Order_services (
    OrderId INT,
    servicesId INT,
    PRIMARY KEY(OrderId, servicesId),
    FOREIGN KEY (OrderId) REFERENCES orders(orderId)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION,
    FOREIGN KEY (servicesId) REFERENCES Services(servicesId)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE feedback (
    id INT IDENTITY(1,1) PRIMARY KEY,
    phone NVARCHAR(255),
    noidung NVARCHAR(255),
    isActive BIT,
    FOREIGN KEY (phone) REFERENCES customers(phone)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE services_employees (
    employeesId INT,
    servicesId INT,
    PRIMARY KEY(employeesId, servicesId),
    FOREIGN KEY (servicesId) REFERENCES Services(servicesId)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION,
    FOREIGN KEY (employeesId) REFERENCES employees(employeesId)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE order_employees (
    employeesId INT,
    orderId INT,
    PRIMARY KEY(employeesId, orderId),
    FOREIGN KEY (employeesId) REFERENCES employees(employeesId)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION,
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
        ON UPDATE NO ACTION 
        ON DELETE NO ACTION
);
GO

CREATE TABLE store (
    id INT IDENTITY(1,1) PRIMARY KEY,
    isActive BIT
);
GO

INSERT INTO roles(role) VALUES
('admin'),
('employees'),
('customers');
GO

INSERT INTO accounts (phone, pass, rolesId, email, gender, isActive) VALUES
(N'0912345671', 'password1', 1, 'admin@example.com', 1, 1),
(N'0912345679', 'password2', 2, 'trung@example.com', 1, 1),
(N'0912345678', 'password3', 2, 'quy@example.com', 1, 1),
(N'0912345677', 'password4', 2, 'thien@example.com', 1, 1),
(N'0912345676', 'password5', 2, 'anh@example.com', 1, 1),
(N'0912345675', 'password6', 2, 'kiet@example.com', 1, 1),
(N'0912345674', 'password7', 2, 'duong@example.com', 1, 1),
(N'0912345673', 'password8', 2, 'vinh@example.com', 1, 1),
(N'0912345672', 'password9', 2, 'uoc@example.com', 1, 1),
(N'0912345669', 'password10', 3, 'phamvana@example.com', 1, 1),
(N'0912345668', 'password11', 3, 'nguyenvanb@example.com', 1, 1),
(N'0912345667', 'password12', 3, 'truongvanc@example.com', 1, 1),
(N'0912345666', 'password13', 3, 'hoangvand@example.com', 1, 1);
GO

INSERT INTO customers (phone, fullName) VALUES
(N'0912345669', N'Phạm Văn Anh'),
(N'0912345668', N'Nguyễn Văn Bảo'),
(N'0912345667', N'Trương Văn Cam'),
(N'0912345666', N'Hoàng Văn Dương');
GO

INSERT INTO Services (name, image, price, description, isActive) VALUES
(N'Cắt Tóc', 'cattoc.jpg', 70000, N'cắt tóc tạo kiểu', 1),
(N'Nhuộm Tóc', 'nhuomtoc.jpg', 300000, N'nhuộm tóc', 1),
(N'Uốn Tóc', 'uontoc.jpg', 200000, N'uốn tóc', 1),
(N'Gội Đầu', 'goidau.jpg', 30000, N'gội đầu', 1),
(N'Massage', 'massage.jpg', 50000, N'massage', 1),
(N'Trị Mụn', 'trimun.jpg', 70000, N'trị mụn', 1);
GO

INSERT INTO employees (fullName, phone) VALUES
(N'Phạm Quốc Trung', N'0912345679'),
(N'Phạm Đạt Quý', N'0912345678'),
(N'Phạm Đức Thiện', N'0912345677'),
(N'Phạm Quang Đức Anh', N'0912345676'),
(N'Quách Thế Kiệt', N'0912345675'),
(N'Nguyễn Cảnh Dương', N'0912345674'),
(N'Đỗ Đức Vinh', N'0912345673'),
(N'Nguyễn Quang Bá Ước', N'0912345672');
GO

INSERT INTO services_employees (employeesId, servicesId) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(4, 2),
(5, 4),
(5, 5),
(6, 5),
(6, 6),
(7, 4),
(7, 6),
(8, 4),
(8, 5);
GO

INSERT INTO status (status) VALUES
(N'Đang xử lý'),
(N'Xác nhận'),
(N'Đã thanh toán'),
(N'Hủy đơn');
GO

INSERT INTO shift (startTime) VALUES
(N'08:00'),
(N'09:00'),
(N'10:00'),
(N'11:00'),
(N'12:00'),
(N'13:00'),
(N'14:00'),
(N'15:00'),
(N'16:00'),
(N'17:00'),
(N'18:00');
GO

INSERT INTO orders (phone, shiftId, statusID, orderDate, isActive, totalAmount) VALUES
(N'0912345669', 1, 1, '2024-06-07', 1, 70000),
(N'0912345668', 1, 1, '2024-06-07', 1, 370000),
(N'0912345667', 2, 1, '2024-06-08', 1, 100000),
(N'0912345666', 2, 2, '2024-06-08', 1, 220000);
GO

INSERT INTO Order_services (OrderId, servicesId) 
VALUES 
(1, 1),
(2, 1),
(2, 2),
(3, 4),
(3, 1),
(4, 5),
(4, 6),
(4, 3);
GO

INSERT INTO order_employees (employeesId, orderId) VALUES
(1, 1),
(2, 2),
(5, 3),
(3, 3),
(4, 4),
(7, 4);
GO

INSERT INTO feedback (phone, noidung, isActive) VALUES
(N'0912345669', N'Nhân viên thái độ lồi lõm', 1),
(N'0912345667', N'Em gội đầu xinh gái', 1);
GO

INSERT INTO store (isActive) VALUES
(1),
(0);
GO
