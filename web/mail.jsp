<%@ page import="javax.mail.Session" %>
<%@ page import="com.sun.mail.smtp.SMTPTransport" %>
<%@ page import="sun.rmi.transport.Transport" %>
<!DOCTYPE html>
language="java" import="javax.naming.*,java.io.*,javax.mail.*,
    javax.mail.internet.*,com.sun.mail.smtp.*"%>
<html>
<head>
  <title>sending mail using contact us form</title>
</head>
<body>
<%
  try{
    Session mailSession = Session.getInstance(System.getProperties());
    javax.mail.Transport transport = new SMTPTransport(mailSession,new URLName("smtp.gmail.com"));
    transport = mailSession.getTransport("smtps");

    transport.connect("smtp.gmail.com",465,"landemayuresh7@gmail.com","Mayu@790");
    MimeMessage m = new MimeMessage(mailSession);
    m.setFrom(new InternetAddress(request.getParameter("from")));
  Address[] toAddr = new InternetAddress[] {
          new InternetAddress(request.getParameter("to"))
};
  m.setRecipients(javax.mail.Message.RecipientType.TO, toAddr );
  m.setSubject(request.getParameter("subject"));
  m.setSentDate(new java.util.Date());
  m.setContent(request.getParameter("description"), "text/plain");

  transport.sendMessage(m,m.getAllRecipients());
  transport.close();
  out.println("Thanks for sending mail!");
  }
  catch(Exception e){
  out.println(e.getMessage());
  e.printStackTrace();
  }

%>
</body>