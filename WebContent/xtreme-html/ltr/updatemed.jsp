<%@page import="Admin.med_function"%>  
<jsp:useBean id="u" class="Admin.med_store"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
med_function.update1(u);  
response.sendRedirect("inventory.jsp");  
%>  