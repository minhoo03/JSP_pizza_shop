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
		<form name="form" method="post" action="action.jsp" onsubmit="return validCheck()">
			<input type="hidden" name="action" value="addpizza"/>
			<table>
			<%
				String sql = "select trim(to_char(sysdate, 'yyyy-mm-dd')) from dual";
				ResultSet rs = dbconnection.getRs(sql);
				if(rs.next()){
					Date saledate = rs.getDate(1);
			%>
				<tr>
					<td>매출전표번호</td>
					<td><input type="text" name="saleno" /></td>
				</tr>
				
				<tr>
					<td>지점코드</td>
					<td><input type="text" name="scode" /></td>
				</tr>
				
				<tr>
					<td>판매일자</td>
					<td><input type="text" name="saledate" value="<%=saledate %>" readonly /></td>
				</tr>
				<tr>
					<td>피자선택</td>
					<td>
						<select name="pcode">
							<option>선택</option>
							<%
								sql = "select pcode, pname from tbl_pizza_01";
								rs = dbconnection.getRs(sql);
								
								while(rs.next()){
									String pcode = rs.getString(1);
									String pname = rs.getString(2);
							%>
								<option value="<%=pcode %>">[<%=pcode %>]<%=pname %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="text" name="amount" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인" /></td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
	</section>
	
	<%@include file="footer.jsp" %>
</body>
</html>
