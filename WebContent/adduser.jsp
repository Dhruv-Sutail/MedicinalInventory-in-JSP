<%@page import="User.User_store" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>  
<jsp:useBean id="u" class="User.User_details"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=User_store.save(u);  
if(i>0){
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "You Have Registered Successfully!!");
	response.sendRedirect("Home.html");  
}else{
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Some Error Occurred!! Please Try Again");
	response.sendRedirect("Home.html");  
}  
%>  