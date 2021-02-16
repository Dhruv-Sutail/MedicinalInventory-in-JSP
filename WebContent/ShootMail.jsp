<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

<%

    String result;
	
    final String to = request.getParameter("mail");
    session.setAttribute("email",to);  
    final String from = "dhruvsutail18@gnu.ac.in";
    final String pass = "**********";

    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.smtp.port", "587");
    

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);

        }

    });

    try {
        MimeMessage message = new MimeMessage(mailSession);
		message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Reset Password Link");
        message.setText("Password Reset Link:http://localhost:8081/Team_Alpha1/UpdatePassword.jsp");
        Transport.send(message);
       
        
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";

    }
%>

<h1 style = "padding-top:45px;"><center><b>Please check your inbox for updating your password!</b></h1>
