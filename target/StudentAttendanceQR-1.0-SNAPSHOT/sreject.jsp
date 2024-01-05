<%-- 
    Document   : reject.jsp
    Created on : 16 November, 2023, 3:31:31 PM
    Author     : Vaibhav-More(MC-I-132)
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="Networks.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_attendance", "root", "");
        Statement sto = con.createStatement();
        st = con.createStatement();
        int i = sto.executeUpdate("update student_reg set status='Rejected' where id='" + id + "'");
        System.out.println("test print==" + id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from student_reg where id = '" + id + "' ");
            if (rs.next()) {
                String mail = rs.getString("email");
                String name = rs.getString("name");
                String imagePath = "V:\\StudentQRCodeGenerator\\" + name + ".png";
                String msg = "Hi " + name + ", we regret to inform you but your student registration is rejected, contact the staff to get approval and mark your attendance through this QR-code.";
                System.out.println("Image Path: " + imagePath);
                Mail.sendMail(mail,msg,imagePath);
                System.out.println("success");
                response.sendRedirect("student_details.jsp?Rejected");
            } else {
                System.out.println("failed");
                response.sendRedirect("student_details.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
