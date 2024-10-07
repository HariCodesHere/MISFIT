<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%-- <%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String username=request.getParameter("username");
System.out.print(username);
session.setAttribute("username",username);
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");

boolean status=false;

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");
PreparedStatement ps=con.prepareStatement("SELECT * FROM login WHERE username=? and userpass=? ");
ps.setString(1,username);
ps.setString(2,userpass);
ResultSet rs=ps.executeQuery();
status=rs.next();
if(status){
System.out.print(" has logged in!\n");
username=rs.getString(1);
session.setAttribute("username",String.valueOf(username));
session.setAttribute("islogin","Please Login first!");
session.setAttribute("category",category);
%>
<jsp:forward page="home.jsp"></jsp:forward>
<%
}
else{
System.out.print("Error");
request.setAttribute("Error","Invalid username or password");
session.setAttribute("Loginmsg","You must sign in first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
}

catch(Exception e){
e.printStackTrace();
}

%>


