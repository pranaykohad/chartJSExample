<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>

<body>

	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");
		String sql ="call chart1_get_id_name_info()";
		CallableStatement cs = conn.prepareCall(sql);
		ResultSet rs = cs.executeQuery();	
	%>
	
	<form name="myform">
		
		<label >title: </label>
		<input type="text" name="title1">
		<input type="button" value ="add title" onclick="addTitle(title1.value)"><br>
		
		<h1 id="title_display"></h1>
		
		<input type="button" value ="add data" onclick="addTuple()"><br><br>
		
		<div id="d1"></div>
		<div id="d2"></div>
		<br><br>
		
		<table style="border: 2px solid black; paddding: 5px">
			<tr>
				<th>id</th>
				<th>title</th>
			</tr>
			<%while(rs.next()){%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
				</tr>
			<%}%>
		</table>
		
		<label>enter id to build graph</label>
		ID: <input type="text" name="id1">
		
	
		<br><br><br>
		<input type="button" value ="line graph"       onclick="chart1(id1.value)">
		<input type="button" value ="bar graph"        onclick="chart2(id1.value)">
		<input type="button" value ="pie graph"        onclick="chart3(id1.value)">
		<input type="button" value ="radar graph"      onclick="chart4(id1.value)">
		<input type="button" value ="Doughnut graph"   onclick="chart5(id1.value)">
		<input type="button" value ="polar area graph" onclick="chart6(id1.value)">
		
	</form>
	
</body>

<script>

	var title = "";
	var check_submit_button = true;
	var l_list = "";
	var d_list = "";
	var i;
	
	
	function addTitle(t){
		if(t != ""){
			title = t;
			document.getElementById("title_display").innerHTML = title;
		}
		else{
			alert("please input title");
		}
		
		
	}

	function addTuple() {
	
		if(title != ""){
			
			var lbl1 = document.createElement("label");
		    var lbl2 = document.createElement("label");
		    var in1  = document.createElement("input");
		    var in2  = document.createElement("input");
		    var br   = document.createElement("hr");
		    
		    var t1 = document.createTextNode("name: ");
		    var t2 = document.createTextNode("value(int): ");		    
			
			lbl1.appendChild(t1);
		    lbl2.appendChild(t2);
		    
		    d1.appendChild(lbl1);
		    d1.appendChild(in1);
		   
		    d1.appendChild(lbl2);
		    d1.appendChild(in2);
		    
		    in1.setAttribute('name', "label_list");
		    in2.setAttribute('name', "data_list");
		    
		    d1.appendChild(br);
		    d1.appendChild(br);
		    
		    addSubmitButton();
		}
		else{
			alert("add title first");
		}
    	    
	}
	
	function addSubmitButton(){
		if(check_submit_button){
			
			check_submit_button=false;
			
			 var btn1  = document.createElement("button");
			 var t3 = document.createTextNode("submit");
			 		 
			 btn1.appendChild(t3);
			 d2.appendChild(btn1);
			 
			 var b = document.querySelector("button"); 
			 b.setAttribute("id", "submit1");
			 b.setAttribute("onclick", "submitData()");
			 		
		}
	}
	
	function submitData(l,d){
		
/*		var c = document.getElementById("d1").childElementCount;
		
			
		for (i = 0; i < c; ) {
			
			if(d1.childNodes[i].nodeName === "INPUT"){
				l_list = l_list + d1.childNodes[i].value + " ";
				d_list = d_list + d1.childNodes[i+2].value + " ";
				i = i+3;
				
			}
			else{
				i++;
			}	
		}
		
		alert(l_list+" : "+d_list);*/
		
		document.myform.action="InsertData";
		document.myform.submit();
		
		
		
	}


	function chart1(i){
		if(i != ""){
			document.myform.action="chart1.jsp";
			document.myform.submit();
		}
		else{
			alert("please select 1 id");
		}
		
	}
	function chart2(i){
		if(i != ""){
			document.myform.action="chart2.jsp";
			document.myform.submit();
		}
		else{
			alert("please select 1 id");
		}
	}
	function chart3(i){
		if(i != ""){
			document.myform.action="chart3.jsp";
			document.myform.submit();
		}
		else{
			alert("please select 1 id");
		}
	}
	function chart4(i){
		if(i != ""){
			document.myform.action="chart4.jsp";
			document.myform.submit();
		}
		else{
			alert("please select 1 id");
		}
	}
	function chart5(i){
		if(i != ""){
			document.myform.action="chart5.jsp";
			document.myform.submit();
		}
		else{
			alert("please select 1 id");
		}
	}
	function chart6(i){
		if(i != ""){
			document.myform.action="chart6.jsp";
			document.myform.submit();
		}
		else{
			alert("please select 1 id");
		}
	}


</script>



</html>