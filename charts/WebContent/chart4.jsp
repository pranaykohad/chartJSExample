<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
        <%@page import="org.json.JSONObject" %>
    <%@page import="org.json.JSONException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
	<%
	Integer id = Integer.parseInt((String)request.getParameter("id1"));
		String []label_arr=null;
		String []data_arr=null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");
		String sql ="call chart1_retrival(?)";
		CallableStatement cs = conn.prepareCall(sql);
		cs.setInt(1, id);
		ResultSet rs = cs.executeQuery();	
		
		
		while(rs.next()){

			label_arr = rs.getString(2).split(" ");
			
			for(String s : label_arr){
				System.out.print(s+" ");
			}
			
			System.out.println();
			
			data_arr = rs.getString(3).split(" ");
			
			for(String s : data_arr){
				System.out.print(s+" ");
			}
			
		}
		
	%>
	
	<div style="width:600px; height:600px">
		this is line chart<br><br>
		<canvas id="myChart" ></canvas>		
		
	</div>
</body>
<script>
	
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'radar',

	    // The data for our dataset
	    data: {
	        labels: ['<%=label_arr[0]%>',
	        		 '<%=label_arr[1]%>',
	        		 '<%=label_arr[2]%>',
	        		 '<%=label_arr[3]%>',
	        		 '<%=label_arr[4]%>',
	        		 '<%=label_arr[5]%>',
	        		 '<%=label_arr[6]%>',
	        		 ], 
	        datasets: [{
	            label: "month data",
	            backgroundColor: 'green',
	            borderColor: 'black',
	            data: ['<%=data_arr[0]%>',
	                   '<%=data_arr[1]%>',
	            	   '<%=data_arr[2]%>',
	            	   '<%=data_arr[3]%>',
	            	   '<%=data_arr[4]%>',
	            	   '<%=data_arr[5]%>',
	            	   '<%=data_arr[6]%>',
	            	
	            ],
	        }]
	    },

	    // Configuration options go here
	    options: {}
	});
	
	
	</script>
</html>