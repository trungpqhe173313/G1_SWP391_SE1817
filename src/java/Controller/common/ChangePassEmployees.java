package Controller.common;

import Dal.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ChangePassEmployees", urlPatterns = {"/changepassemployees"})
public class ChangePassEmployees extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassEmployees</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassEmployees at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("changePassEmployees.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldpass = request.getParameter("oldpassword");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String message = null;

        if (account != null) {
            String email = account.getEmail();
            boolean oldPassValid = false;
            boolean passwordsMatch = false;

            if (oldpass.equals(password)) {
                message = "Mật khẩu mới và mật khẩu cũ trùng nhau.";
            } else {
                try {
                    oldPassValid = dao.checkOldPass(email, oldpass);
                    passwordsMatch = password.equals(confirmPassword);

                    if (!oldPassValid) {
                        message = "Mật khẩu cũ không đúng.";
                    } else if (!passwordsMatch) {
                        message = "Mật khẩu mới và xác nhận mật khẩu không trùng khớp.";
                    } else if (password.length() < 8) {
                        message = "Mật khẩu mới phải có ít nhất 8 ký tự.";
                    } else {
                        dao.changePass(email, password);
                        message = "Đổi mật khẩu thành công.";
                    }
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(ChangePassEmployees.class.getName()).log(Level.SEVERE, null, ex);
                    message = "Có lỗi xảy ra. Vui lòng thử lại.";
                }
            }

            request.setAttribute("message", message);
            request.setAttribute("oldpassword", oldpass);
            request.setAttribute("password", password);
            request.setAttribute("confirmPassword", confirmPassword);
            request.getRequestDispatcher("changePassEmployees.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
