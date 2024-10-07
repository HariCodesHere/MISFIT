<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");
PreparedStatement ps=con.prepareStatement("select username from LOGIN where username='"+n+"'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
out.print("<font style='color:red'>Username already exist</font>");
}
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>