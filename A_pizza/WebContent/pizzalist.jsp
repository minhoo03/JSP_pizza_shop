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
				<td>매출전표번호</td>
				<td>지점</td>
				<td>판매일자</td>
				<td>피자코드</td>
				<td>피자명</td>
				<td>판매수량</td>
				<td>매출액</td>
			</tr>
			<%
			
			String sql = "select a.saleno, a.scode, to_char(a.saledate, 'yyyy-mm-dd'), b.pcode, b.pname, a.amount, to_char(a.amount * b.cost, '000,000') from tbl_salelist_01 a, tbl_pizza_01 b where a.pcode = b.pcode";
			ResultSet rs = dbconnection.getRs(sql);
			
			while(rs.next()){
				String saleno = rs.getString(1);
				String scode = rs.getString(2);
				String saledate = rs.getString(3);
				String pcode = rs.getString(4);
				String pname = rs.getString(5);
				String amount = rs.getString(6);
				String price = rs.getString(7);
			%>
			<tr>
				<td><%=saleno %></td>
				<td><%=scode %></td>
				<td><%=saledate %></td>
				<td><%=pcode %></td>
				<td><%=pname %></td>
				<td><%=amount %></td>
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
