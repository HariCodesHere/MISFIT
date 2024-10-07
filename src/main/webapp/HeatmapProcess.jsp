<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.misfit.SG" %>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs_select = null;
ArrayList<Integer> list = null;
int pincode = 0;

double result = 0.0;
String zone = null;
ResultSet rs = null;
String Select_pincode = "SELECT * FROM survey WHERE pincode = ";
String Count_Users = "SELECT COUNT(*) FROM survey WHERE pincode = ";
HashMap<Integer, String> pincodeZones = null;

try{
	//DataBase Connection
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/misfit","root","Hashim@1");
	
	//Fetching All PinCodes in DB
	ps = con.prepareStatement("SELECT DISTINCT pincode FROM survey");
	rs_select = ps.executeQuery();
	
	//Adding Them To Array List
	list = new ArrayList<>();
	while(rs_select.next()){
		pincode = rs_select.getInt(1);
		list.add(pincode);
	}
	
	pincodeZones = new HashMap<>();
	
	//Entering Values to Object
	for(int loop:list){
		int count = 0;
		int users = 0;
		
		//Fetching Pincode
		System.out.println("SQL COMMAND(pincode): "+ Select_pincode + loop + "\n");
	    PreparedStatement ps1 = con.prepareStatement(Select_pincode + loop);
	    rs = ps1.executeQuery();
	    while(rs.next()){
	    	count = count + rs.getInt(5);
	    	System.out.println("Count: " + count);
	    }
	    
	    //Fetching Number of Users
	    System.out.println("\nSQL COMMAND(user count): " + Count_Users + loop);
	    PreparedStatement ps2 = con.prepareStatement(Count_Users + loop);
	    ResultSet rs2 = ps2.executeQuery();
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
	    System.out.println("\nEnd of Loop\n");
	    
	    //Adding to HashMap
	    pincodeZones.put(loop, zone);
	}
	System.out.println(pincodeZones);
	

}
catch(Exception e){
e.printStackTrace();
}
%>
<jsp:forward page = "heatmap.jsp"></jsp:forward>