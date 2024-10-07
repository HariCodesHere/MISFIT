<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.Clock"%>>
<%@page import="java.math.BigDecimal"%>

<%try{

String username = (String)session.getAttribute("username");
int pincode = Integer.parseInt(request.getParameter("pincode"));
String district = request.getParameter("district");
int question1 = Integer.parseInt(request.getParameter("recommed"));
int question2 = Integer.parseInt(request.getParameter("inp"));
int question3 = Integer.parseInt(request.getParameter("bite"));
System.out.println("values received from UI"+" "+username+" "+pincode+" "+district+" "+question1+" "+question2+" "+question3);
Clock clock = Clock.systemDefaultZone();
long milliSeconds=clock.millis();
BigDecimal BigSeconds = new BigDecimal(milliSeconds);

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");
PreparedStatement ps=con.prepareStatement("insert into survey values(?,?,?,?,?,?,?)");

ps.setString(1,username);
ps.setInt(2,pincode);
ps.setString(3,district);
ps.setInt(4,question1);
ps.setInt(5,question2);
ps.setInt(6,question3);
ps.setBigDecimal(7,BigSeconds);
int s=ps.executeUpdate();
System.out.print("Survey data saved "+s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="home.jsp"></jsp:forward>