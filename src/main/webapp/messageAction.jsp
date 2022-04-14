<%@page import ="project.ConnectionProviderclass" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{
	Connection conn=ConnectionProviderclass.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("messageUs.jsp?msg=Invalid");
	System.out.println(e);
}
%>