package Dal;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LINHNTHE170290
 */
public class DBContext {

    protected static Connection connection;

    public DBContext() {
        try {
            // Edit URL, username, and password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        System.out.println(new DBContext().connection);
    }
}
