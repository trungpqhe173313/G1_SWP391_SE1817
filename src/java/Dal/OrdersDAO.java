/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Accounts;
import Model.Employees;
import Model.Orders;
import Model.Roles;
import Model.Services;
import Model.Shifts;
import Model.Statuses;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xdrag
 */
public class OrdersDAO extends DBContext {

    public List<Accounts> getAllAccounts() {
        List<Accounts> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[phone]\n"
                + "      ,[password]\n"
                + "      ,[fullName]\n"
                + "      ,[email]\n"
                + "      ,[avatar]\n"
                + "      ,[isMale]\n"
                + "      ,[roleId]\n"
                + "      ,[isActive]\n"
                + "  FROM [dbo].[accounts]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Accounts m = new Accounts();
                m.setId(rs.getInt("id"));
                m.setPhone(rs.getString("phone"));
                m.setPassword(rs.getString("password"));
                m.setFullName(rs.getString("fullName"));
                m.setEmail(rs.getString("email"));
                m.setAvatar(rs.getString("avatar"));
                m.setIsMale(rs.getBoolean("isMale"));
                m.setRoleId(rs.getInt("roleId"));
                m.setIsActive(rs.getBoolean("isActive"));
                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Employees> getAllEmployees() {
        List<Employees> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[accountId]\n"
                + "      ,[isActive]\n"
                + "      ,[dateOfBirth]\n"
                + "      ,[address]\n"
                + "  FROM [dbo].[employees]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employees m = new Employees();
                m.setId(rs.getInt("id"));
                m.setAccountId(rs.getInt("accountId"));
                m.setIsActive(rs.getBoolean("isActive"));
                m.setDateOfBirth(rs.getDate("dateOfBirth"));
                m.setAddress(rs.getString("address"));

                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Orders> getAllOrders() {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[accountID]\n"
                + "      ,[employeeId]\n"
                + "      ,[shiftsID]\n"
                + "      ,[statusId]\n"
                + "      ,[orderDate]\n"
                + "      ,[totalAmount]\n"
                + "  FROM [dbo].[orders]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders m = new Orders();
                m.setId(rs.getInt("id"));
                m.setAccountID(rs.getInt("accountID"));
                m.setEmployeeId(rs.getInt("employeeId"));
                m.setShiftsID(rs.getInt("shiftsID"));
                m.setStatusId(rs.getInt("statusId"));
                m.setOrderDate(rs.getDate("orderDate"));
                m.setTotalAmount(rs.getInt("totalAmount"));
                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Roles> getAllRoles() {
        List<Roles> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[roles]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Roles m = new Roles();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Services> getAllServices() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[services]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Services m = new Services();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setImage(rs.getString("image"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Shifts> getAllShifts() {
        List<Shifts> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[startTime]\n"
                + "      ,[endTime]\n"
                + "  FROM [dbo].[shifts]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shifts m = new Shifts();
                m.setId(rs.getInt("id"));
                m.setStartTime(rs.getString("startTime"));
                m.setEndTime(rs.getString("endTime"));
                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Statuses> getAllStatuses() {
        List<Statuses> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[statuses]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Statuses m = new Statuses();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Accounts> getAllBarber() {
        List<Accounts> list = new ArrayList<>();
        String sql = "SELECT a.[id],\n"
                + "       a.[phone],\n"
                + "       a.[password],\n"
                + "       a.[fullName],\n"
                + "       a.[email],\n"
                + "       a.[avatar],\n"
                + "       a.[isMale],\n"
                + "       a.[roleId],\n"
                + "       a.[isActive]\n"
                + "FROM [dbo].[accounts] a\n"
                + "JOIN [dbo].[employees] e ON e.accountId = a.id\n"
                + "WHERE a.[roleId] = 4\n"
                + "  AND a.[isActive] = 1\n"
                + "  AND e.[isActive] = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Accounts m = new Accounts();
                m.setId(rs.getInt("id"));
                m.setPhone(rs.getString("phone"));
                m.setPassword(rs.getString("password"));
                m.setFullName(rs.getString("fullName"));
                m.setEmail(rs.getString("email"));
                m.setAvatar(rs.getString("avatar"));
                m.setIsMale(rs.getBoolean("isMale"));
                m.setRoleId(rs.getInt("roleId"));
                m.setIsActive(rs.getBoolean("isActive"));

                list.add(m);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Services getServicesById(String id) {

        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[services] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Services m = new Services();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setImage(rs.getString("image"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getInt("price"));
                return m;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Statuses getStatusesById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[statuses] where id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Statuses m = new Statuses();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                return m;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Accounts getAccountsById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[phone]\n"
                + "      ,[password]\n"
                + "      ,[fullName]\n"
                + "      ,[email]\n"
                + "      ,[avatar]\n"
                + "      ,[isMale]\n"
                + "      ,[roleId]\n"
                + "      ,[isActive]\n"
                + "  FROM [dbo].[accounts] where id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Accounts m = new Accounts();
                m.setId(rs.getInt("id"));
                m.setPhone(rs.getString("phone"));
                m.setPassword(rs.getString("password"));
                m.setFullName(rs.getString("fullName"));
                m.setEmail(rs.getString("email"));
                m.setAvatar(rs.getString("avatar"));
                m.setIsMale(rs.getBoolean("isMale"));
                m.setRoleId(rs.getInt("roleId"));
                m.setIsActive(rs.getBoolean("isActive"));
                return m;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Shifts getShiftsById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[startTime]\n"
                + "      ,[endTime]\n"
                + "  FROM [dbo].[shifts] where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shifts m = new Shifts();
                m.setId(rs.getInt("id"));
                m.setStartTime(rs.getString("startTime"));
                m.setEndTime(rs.getString("endTime"));
                return m;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public void AddOrder(Orders o, String[] sevicesId) {
        String sql = "INSERT INTO [dbo].[orders]\n"
                + "           ([accountID]\n"
                + "           ,[employeeId]\n"
                + "           ,[shiftsID]\n"
                + "           ,[statusId]\n"
                + "           ,[orderDate]\n"
                + "           ,[totalAmount]\n"
                + "           ,[createdAt]\n"
                + "           ,[updatedAt])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql);) {

            st.setInt(1, o.getAccountID());
            st.setInt(2, o.getEmployeeId());
            st.setInt(3, o.getShiftsID());
            st.setInt(4, o.getStatusId());
            st.setDate(5, (Date) o.getOrderDate());
            st.setInt(6, o.getTotalAmount());

            st.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public int GetNewOrderId(int accountId) {
        int id = 0;
        String sql = "SELECT top 1 [id]\n"
                + "      \n"
                + "  FROM [dbo].[orders]\n"
                + "  where accountID = ?\n"
                + "  order by  id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
        }

        return id;
    }

    public void AddOrder_Services(String sevicesId, int orderId) {
        String sql = "INSERT INTO [dbo].[order_services]\n"
                + "           ([orderId]\n"
                + "           ,[serviceId]\n"
                + "           ,[isActive]\n"
                + "           ,[createdAt]\n"
                + "           ,[updatedAt])\n"
                + "     VALUES\n"
                + "           (?,?,1,GETDATE(),GETDATE())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setString(2, sevicesId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        OrdersDAO d = new OrdersDAO();
        List<Services> l = d.getAllServices();
        for (Services a : l) {
            System.out.println(a.toString());
        }
        System.out.println(d.getShiftsById(5).toString());
    }
}
