<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
int count = 0;
int users = 0;
ResultSet rs = null;
ResultSet rs2 = null;
String Select_pincode = "SELECT * FROM SURVEY WHERE pincode = ";
String Count_Users = "SELECT COUNT(*) FROM SURVEY WHERE pincode = ";
float result = 0;
String zone = null;

try{
	//Getting Inputted Pin Code
	int pinCode = Integer.parseInt(request.getParameter("pincode"));
	System.out.println("Pin Code: " + pinCode);
	
	//DataBase Connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");
    
    //Fetching Pincode
    PreparedStatement ps = con.prepareStatement(Select_pincode + pinCode);
    rs = ps.executeQuery();
    while(rs.next()){
    	count = count + rs.getInt(5);
    	System.out.println("Count: " + count);
    }
    
    //Fetching Number of Users
    PreparedStatement ps2 = con.prepareStatement(Count_Users + pinCode);
    rs2 = ps2.executeQuery();
    while(rs2.next()){
    	users = rs2.getInt(1);
    	System.out.println("Number of Users = " + users);
    }
    if (users == 0) {
    	users = 1;
    }
    
    //Calculating Zone
    result = count/users;
    if (result > 2.75) {
        System.out.println("Red zone");
        zone = "Red Zone";
        
    } 
    else if (result > 1.75) {
        System.out.println("Yellow zone");
        zone = "Yellow Zone";
        
    } 
    else if (result < 1.75) {
    	System.out.println("Green zone");
    	zone = "Green Zone";
    }
    
    request.setAttribute("Zone", zone);
    
    
}

catch(Exception e){
	e.printStackTrace();
	}
%>
<jsp:forward page="heatmap.jsp"></jsp:forward>