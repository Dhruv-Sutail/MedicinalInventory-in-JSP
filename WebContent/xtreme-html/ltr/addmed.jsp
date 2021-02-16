<%@page import="Admin.med_function" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>  
<jsp:useBean id="u" class="Admin.med_store"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=med_function.save(u);  
if(i>0){
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Medicine Added");
	response.sendRedirect("form.jsp");  
}else{
	JFrame parent = new JFrame();
    JOptionPane.showMessageDialog(parent, "Some Error Occurred!! Please Try Again");
	response.sendRedirect("form.jsp");  
}  
%>  