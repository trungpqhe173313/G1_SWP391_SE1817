/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ducth
 */
import Dal.BlogDAO;
import Dal.EmployeesDAO;
import Model.Blog;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class Main {

    public static void main(String[] args) {
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> blogs = blogDAO.viewListBlogCustomer();
        for (Blog blog : blogs) {
            System.out.println(blog);
        }
    }

}


