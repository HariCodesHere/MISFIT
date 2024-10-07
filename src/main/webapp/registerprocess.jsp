<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");
String email=request.getParameter("email");
String phoneNumber=request.getParameter("phonenumber");
String pinCode=request.getParameter("pincode");
String address=request.getParameter("address");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");
PreparedStatement ps=con.prepareStatement("insert into login values(?,?,?,?,?,?,?)");

ps.setString(1,username);
ps.setString(2,userpass);
ps.setString(3,category);
ps.setString(4,email);
ps.setString(5,phoneNumber);
ps.setString(6,pinCode);
ps.setString(7,address);
int s=ps.executeUpdate();
System.out.print("Registration data added "+s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="index.jsp"></jsp:forward>
