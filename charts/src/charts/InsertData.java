package charts;


import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;


@WebServlet("/InsertData")
public class InsertData extends HttpServlet {
	
	Connection conn;
	String sql;
	CallableStatement cs;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String title = request.getParameter("title1");
		String[] l = request.getParameterValues("label_list");
		String[] d = request.getParameterValues("data_list");
		
		System.out.println(title);
		
		String labelList = "";
		String dataList = "";
		
		for(String s : l) {
			labelList = labelList + s +" ";
		}
		
		for(String s : d) {
			dataList = dataList + s + " ";
		}
		
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "root");
			System.out.println("conn ok.........");
			sql = "call chart1_insert(?,?,?)";
			
			CallableStatement cs = conn.prepareCall(sql);
			
			cs.setString(1, labelList);
			cs.setString(2, dataList);
			cs.setString(3, title);
			
			//int row = cs.executeUpdate();
			
			//System.out.println(row +" record is entered in database");
			
		} catch (ClassNotFoundException | SQLException e) {e.printStackTrace();}
		

	}

}
