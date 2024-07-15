/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import static Dal.DBContext.connection;
import Model.Store;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xdrag
 */
public class StoreDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(StoreDAO.class.getName());

    public Store getStore() {
        Store s = new Store();
        String sql = "SELECT [id]\n"
                + "      ,[isActive]\n"
                + "      ,[startDate]\n"
                + "      ,[endDate]\n"
                + "  FROM [dbo].[store]";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setIsActive(rs.getBoolean("isActive"));
                s.setStartDate(rs.getDate("startDate").toLocalDate());
                s.setEndDate(rs.getDate("endDate").toLocalDate());
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
        return s;
    }

    public void UpdateStore(Store s) {
        String sql = "UPDATE [dbo].[store]\n"
                + "   SET [isActive] = ?\n"
                + "      ,[startDate] = ?\n"
                + "      ,[endDate] = ?\n"
                + " WHERE store.id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setBoolean(1, s.isIsActive());
            st.setString(2, s.getStartDate().toString());
            st.setString(3, s.getEndDate().toString());
            st.setInt(4, s.getId());
            st.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public static void main(String[] args) {
        StoreDAO s = new StoreDAO();
        System.out.println(s.getStore());
        LocalDate date = LocalDate.parse("2024-07-19");
        s.UpdateStore(new Store(1, true, date, date));
        System.out.println("sau khi update: ");
        System.out.println(s.getStore());

    }
}
