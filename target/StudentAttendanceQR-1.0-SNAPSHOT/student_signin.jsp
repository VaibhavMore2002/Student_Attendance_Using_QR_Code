<%-- 
    Document   : student_signin
    Created on : 1 December, 2023, 11:42:02 AM
    Author     : Vaibhav
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="Networks.Mail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");
    System.out.println("Check User name And Password : " + mail + pass);
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_attendance","root","");
    Statement st = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM student_reg where email='" + mail + "' AND password='" + pass + "' AND status='Approved' ");
        if (rs.next()) {
            session.setAttribute("uname", rs.getString("name"));
            session.setAttribute("umail", rs.getString("email"));
            session.setAttribute("uid", rs.getString("id"));
            response.sendRedirect("student_verify.jsp?Success");
        } else {
            response.sendRedirect("Student_login.jsp?Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>