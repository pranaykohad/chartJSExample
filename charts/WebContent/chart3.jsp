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
		String title = null;
		JSONObject obj = new JSONObject();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");
		String sql ="call chart1_retrival(?)";
		CallableStatement cs = conn.prepareCall(sql);
		cs.setInt(1, id);
		ResultSet rs = cs.executeQuery();	
		
		

		if(rs.next()){
			label_arr = rs.getString(2).split(" ");	
			data_arr = rs.getString(3).split(" ");
			title = rs.getString(4);
			System.out.println(title);
		}		
		
		
		try {
			obj.append("l", label_arr);
			obj.append("d", data_arr);
			System.out.println(obj.get("l"));
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	%>
	
	<div style="width:500px; height:500px">
		<canvas id="myChart" ></canvas>				
	</div>
</body>

<script>
	
		var mydata = JSON.parse('<%=obj%>');
		console.log(mydata.l);
		console.log(mydata.d);
		console.log("<%=title%>");
		
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'pie',
	
		    // The data for our dataset
		    data: {
		        labels: mydata.l[0],   		        
		        datasets: [{
		            label: "<%=title%>",
		            backgroundColor: ['red','green','blue','orange','pink','brown','yellow'],
		            data: mydata.d[0],
		        }]
		    },
	
		    // Configuration options go here
		    options: {}
		});
	
	
	</script>


</html>