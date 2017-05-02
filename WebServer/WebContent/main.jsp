<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="bun_yuchae_voca.Scanner" %>
<%@ page import="bun_yuchae_voca.Scanner.Format" %>
<%@ page import="bun_yuchae_voca.Translator" %>

<%
	Translator tr = Translator.getInstance();
	Scanner sc = new Scanner();
	String text="", result="",url="";
	String te = request.getParameter("url");
	if(te != null) {
		url = te;
		text = sc.act(false,te,"eng",Format.URL);
		result = tr.act(text,"en","ko");
		System.out.println("requested");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	p.head {
		border-style: groove;
    	background-color: lightblue;
    	font-size: 50px;
    	text-align: center;
    	color: #ff5722;
	}
	table, th, td {
    	border: 1px solid black;
    	border-collapse: collapse;    	
	}
	th, td {		
    	padding: 5px;
    	text-align: left;
	}
	p.trl{
		font-size: 15px;
	}
	p.ocr{
		font-size: 15px;
	}
</style>
<script>
function urlKeyDown() {	
    document.getElementById("img").src = document.getElementById("URL").value ;    
}
</script>
<title>Bun_yuchae_VOCA</title>
</head>
<body>	
	<p class="head">������-VOCA</p>
	<form method = "post" action ="main.jsp">
		ImageURL: <input type="text" id= "URL" name = "url" onchange="urlKeyDown()" value =<%=url%>><br><br>
		<table style="width: 100%">
		<tr>
			<th style="width: 50%; text-align: center">ImagePreview</th>
			<th style="width: 50%; text-align: center">Text Value</th>				
		</tr>
		<tr>
			<td rowspan ="6" style="width: 50%; text-align: center"><img alt="" src="" id="img" name="img"></td>		
			<td rowspan = "1"style="width: 50%; text-align: center" >Scanned Text</td>		
		</tr>
		<tr>
			<td rowspan = "2"style="width: 50%; text-align: left" ><p class="ocr"><%=text%></p></td>
		</tr>
		<tr></tr>		
		<tr>	
			<td rowspan = "1" style="width: 50%; text-align: center" >Translated Text</td>			
		</tr>
		<tr>
			<td rowspan = "2" style="width: 50%; text-align: left" ><p class="trl"><%=result%></p></td>
		</tr>	
		</table>
		<input type="submit" Value = "submit">
	</form>
</body>


</html>