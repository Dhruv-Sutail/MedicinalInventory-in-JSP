<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,Retailer.*,java.sql.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/team_alpha","root","dhruv123");
String id=request.getParameter("id");  
int id1=Integer.parseInt(id);
feedback u=feedback_function.getRecordById(Integer.parseInt(id));  
String firm_name=u.getFirm_name();
String med = u.getMed_requirement();
String feedback	=u.getFeedback();
PreparedStatement ps=con.prepareStatement(  
"insert into manager_request(firm_name,med_requirement,feedback) values(?,?,?)");  
        ps.setString(1,firm_name);  
        ps.setString(2,med);  
        ps.setString(3,feedback);    
        int status=ps.executeUpdate();  
        PreparedStatement ps1=con.prepareStatement("delete from retailer_request where id=?");  
        ps1.setInt(1,id1);  
        ps1.executeUpdate();
        JFrame parent = new JFrame();
	    JOptionPane.showMessageDialog(parent, "Request Sent to Admin");
	    response.sendRedirect("http://localhost:8081/Team_Alpha1/xtreme-html/ltr/Retail_request.jsp");
%>  
  
</body>
</html>