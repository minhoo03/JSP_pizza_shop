<%@page import="java.sql.Date"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" />
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	
	<section>
		<table>
		
			<tr>
				<td>지점 코드</td>
				<td>지점 명</td>
				<td>총매출액</td>
			</tr>
			<%
			
			String sql = "select a.scode, a.sname, to_char(sum(b.amount*c.cost), 'fm999,999,99') from tbl_shop_01 a, tbl_salelist_01 b, tbl_pizza_01 c where a.scode = b.scode group by a.scode, a.sname order by scode asc";
			ResultSet rs = dbconnection.getRs(sql);
			
			while(rs.next()){
				String scode = rs.getString(1);
				String sname = rs.getString(2);
				String price = rs.getString(3);
			%>
			<tr>
				<td><%=scode %></td>
				<td><%=sname %></td>
				<td><%=price %></td>
			</tr>	
			<%
				}
			%>
		</table>
	</section>
	
	<%@include file="footer.jsp" %>
</body>
</html>
