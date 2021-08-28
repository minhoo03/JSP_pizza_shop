<%@page import="java.sql.Date"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String action = request.getParameter("action");
	ResultSet rs = null;
	
	String url = "";
	String msg = "";
	
	switch(action) {
		case "addpizza" :
			
			Connection conn = dbconnection.getConnection();
			
			int saleno = Integer.parseInt(request.getParameter("saleno"));
			String scode = request.getParameter("scode");
			Date saledate = Date.valueOf(request.getParameter("saledate"));
			String pcode = request.getParameter("pcode");
			int amount = Integer.parseInt(request.getParameter("amount"));
			System.out.println(pcode);
			String sql = "insert into tbl_salelist_01 values ('"+ saleno +"', '"+ scode +"', '"+ saledate +"', '"+ pcode +"', '" + amount +"')";
			dbconnection.Insert(sql);
			
			url="index.jsp";
			msg="정상 등록";
		break;
	}
%>
</body>
<script>
	alert("<%=msg %>")
	location.replace("<%=url %>")
</script>
</html>