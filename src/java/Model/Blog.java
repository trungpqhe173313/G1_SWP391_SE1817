/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author ducth
 */
public class Blog {
    private int postId;
    private String title;
    private String content;
    private String image;
    private Date createAt;
    private Date updateAt;
    private Boolean isActive;

    public Blog() {
    }

    public Blog(int postId, String title, String content, String image, Date createAt, Date updateAt, Boolean isActive) {
        this.postId = postId;
        this.title = title;
        this.content = content;
        this.image = image;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.isActive = isActive;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Blog{" + "postId=" + postId + ", title=" + title + ", content=" + content + ", image=" + image + ", createAt=" + createAt + ", updateAt=" + updateAt + ", isActive=" + isActive + '}';
    }
    
}
