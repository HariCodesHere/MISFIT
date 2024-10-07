<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>


<%

 try {
 
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String message= request.getParameter("message");
 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");

PreparedStatement ps=con.prepareStatement("insert into quizcontact values(?,?,?,?)");
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,message);

int s= ps.executeUpdate();


}
catch(Exception e){e.printStackTrace();}

%>
<jsp:forward page="home.jsp"></jsp:forward>
