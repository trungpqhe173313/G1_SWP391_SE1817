/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Blog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
/**
 *
 * @author ducth
 */
public class BlogDAO extends DBContext{
    // Create Blog
    public void createBlog(String title, String content, String image) {
        String sql = "INSERT INTO BlogPosts (title, content, image, createdAt, updatedAt, isActive) VALUES (?, ?, ?, GETDATE(), GETDATE(), 1)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setString(3, image);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Update Blog
    public void updateBlog(int postId, String title, String content, String image) {
        String sql = "UPDATE BlogPosts SET title = ?, content = ?, image = ?, updatedAt = GETDATE() WHERE postId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setString(3, image);
            stmt.setInt(4, postId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Blog> getBlogById(int postId) {
        String sql = "SELECT * FROM BlogPosts WHERE postId = ?";
        List<Blog> blogs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setPostId(rs.getInt("postId"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setImage(rs.getString("image"));
                blog.setCreateAt(rs.getDate("createdAt"));
                blog.setUpdateAt(rs.getDate("updatedAt"));
                blog.setIsActive(rs.getBoolean("isActive"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }
    // Delete Blog (Đổi trạng thái isActive)
public void toggleBlogStatus(int postId) {
    String sqlSelect = "SELECT isActive FROM BlogPosts WHERE postId = ?";
    String sqlUpdate = "UPDATE BlogPosts SET isActive = ? WHERE postId = ?";
    try (PreparedStatement stmtSelect = connection.prepareStatement(sqlSelect);
         PreparedStatement stmtUpdate = connection.prepareStatement(sqlUpdate)) {
        
        // Get current status
        stmtSelect.setInt(1, postId);
        ResultSet rs = stmtSelect.executeQuery();
        if (rs.next()) {
            boolean currentStatus = rs.getBoolean("isActive");
            boolean newStatus = !currentStatus;
            
            // Update to new status
            stmtUpdate.setBoolean(1, newStatus);
            stmtUpdate.setInt(2, postId);
            stmtUpdate.executeUpdate();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    // View List Blog
    public List<Blog> viewListBlog() {
        String sql = "SELECT * FROM BlogPosts";
        List<Blog> blogs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setPostId(rs.getInt("postId"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setImage(rs.getString("image"));
                blog.setCreateAt(rs.getDate("createdAt"));
                blog.setUpdateAt(rs.getDate("updatedAt"));
                blog.setIsActive(rs.getBoolean("isActive"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }
    
    // View List Blog (Customer)
    public List<Blog> viewListBlogCustomer() {
        String sql = "SELECT * FROM BlogPosts WHERE isActive = 1";
        List<Blog> blogs = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setPostId(rs.getInt("postId"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setImage(rs.getString("image"));
                blog.setCreateAt(rs.getDate("createdAt"));
                blog.setUpdateAt(rs.getDate("updatedAt"));
                blog.setIsActive(rs.getBoolean("isActive"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }
    
    // View Blog (Customer)
    public Blog viewBlogCustomer(int postId) {
        String sql = "SELECT * FROM BlogPosts WHERE postId = ? AND isActive = 1";
        Blog blog = null;
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    blog = new Blog();
                    blog.setPostId(rs.getInt("postId"));
                    blog.setTitle(rs.getString("title"));
                    blog.setContent(rs.getString("content"));
                    blog.setImage(rs.getString("image"));
                    blog.setCreateAt(rs.getDate("createdAt"));
                    blog.setUpdateAt(rs.getDate("updatedAt"));
                    blog.setIsActive(rs.getBoolean("isActive"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }
    
}
