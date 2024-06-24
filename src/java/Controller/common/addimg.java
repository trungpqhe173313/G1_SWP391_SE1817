/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.common;

import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author LENOVO
 */
public class addimg {
    public String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUploadStaff() {
        //mn tu doi lai thanh duong dan cua mn nhe
        File folderUpload = new File("D:\\FPT\\Ky5FPTU\\SWP391\\Project\\G1_SWP391_SE1817\\web\\img");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
    
  
}
