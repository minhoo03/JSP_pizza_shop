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
				<td>피자 코드</td>
				<td>피자 명</td>
				<td>총매출액</td>
			</tr>
			<%
			
			String sql = "select a.pcode, a.pname, to_char(sum(a.cost*b.amount),'fm999,999,999') from tbl_pizza_01 a, tbl_salelist_01 b, tbl_shop_01 c where a.pcode = b.pcode group by a.pcode, a.pname order by to_char(sum(a.cost*b.amount),'fm999,999,999') asc";
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
