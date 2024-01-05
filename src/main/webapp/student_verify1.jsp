<%-- 
    Document   : verify1
    Created on : 16 November, 2023, 3:31:31 PM
    Author     : Vaibhav-More(MC-I-132)
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="Action.QRCodeExtract"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.StandardCopyOption" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.List" %>

<%@ page import="Action.QRCodeExtract" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="DBconnection.SQLconnection" %>
<%@ page import="Networks.Mail" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
try {
    String setvall;
    String status = null;
    final String uploadDirectory = "V:\\StudentQRCodeGenerator\\";
    // Check that we have a file upload request
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        List<FileItem> items = upload.parseRequest(request);

        String id = null;
        FileItem fileItem = null;

        for (FileItem item : items) {
            if (item.isFormField()) {
                // Process regular form field (id)
                if ("id".equals(item.getFieldName())) {
                    id = item.getString();
                }
            } else {
                // Process file upload (file)
                fileItem = item;
            }
        }

        if (id != null && fileItem != null) {
            String fileName = Paths.get(fileItem.getName()).getFileName().toString();
            Path filePath = Paths.get(uploadDirectory, fileName);
            try (InputStream input = fileItem.getInputStream()) {
                Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
            }
            System.out.println("Check User ID : " + id);
            System.out.println("Check path : " + filePath);

            QRCodeExtract qrread = new QRCodeExtract();
            qrread.QRCodeReader(filePath.toString());
            setvall = QRCodeExtract.getvall;

            // V
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);

            DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = new Date();
            System.out.println(dateFormat1.format(date1));
            String indate = dateFormat1.format(date1);
            //
            DateFormat TimeFormat = new SimpleDateFormat("HH:mm:ss");
            Date CurrentTime = new Date();
            System.out.println(TimeFormat.format(CurrentTime));
            String ctime = TimeFormat.format(CurrentTime);

            System.out.println("Check details : " + setvall);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_attendance","root","");
                //Connection con = SQLconnection.getconnection();
            try{
                Statement st1 = conn.createStatement();
                Statement sto = conn.createStatement();
                ResultSet rs = sto.executeQuery("SELECT * FROM student_reg where details ='" + setvall + "' AND id ='" + id + "' ");
                if (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String dept = rs.getString("dept");
                    String year = rs.getString("year");
                    int i = st1.executeUpdate("insert into attendance (sid, name, email, time , details, dept, year, date, ctime)values('" + id + "','" + name + "','" + email + "','" + time + "','" + setvall + "','" + dept + "','" + year + "','" + indate + "','" + ctime + "')");
                    response.sendRedirect("Student_Home.jsp?Success");
                }else {
                    response.sendRedirect("Student_login.jsp?Msg=Incorrect_QR-code");
                }
            }catch(Exception e){
                System.out.println(e);
            }
        }
    }
    }catch (Exception ex) {
        ex.printStackTrace();
        response.sendRedirect("Student_login.jsp?Msg=Incorrect_QR-code");
    }
%>
