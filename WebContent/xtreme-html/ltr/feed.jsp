<%@page import="Retailer.feedback_function" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>  
<jsp:useBean id="u" class="Retailer.feedback"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=feedback_function.save(u);  
if(i>0){
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Your FeedBack has been Sent to Manager");
	response.sendRedirect("Index_retailer.jsp");  
}else{
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Some Error Occurred!! Please Try Again");
	response.sendRedirect("Index_retailer.jsp");  
}  
%>  