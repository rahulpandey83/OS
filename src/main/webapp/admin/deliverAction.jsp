<%@page import ="project.ConnectionProviderclass" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Delivered";
try
{
	Connection conn= ConnectionProviderclass.getConnection();
	Statement st=conn.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	
}
%>