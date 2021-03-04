<%@page import="com.Item"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
if (request.getParameter("itemCode") != null) 
 { 
	 Item itemObj = new Item(); 
	 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
	 request.getParameter("itemName"), 
	 request.getParameter("itemPrice"), 
	 request.getParameter("itemDesc")); 
	 session.setAttribute("statusMsg", stsMsg); 
 } 

if (request.getParameter("itemID") != null)
{
	Item itemObj = new Item();
	String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">

<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>


<div class="jumbotron jumbotron-fluid">

<center><h1>Items Management</h1> <br> </center>

<div class="container">
 <div class="row">
 	<div class="col">

<form method="post" action="items.jsp">
	 Item code: <br><input name="itemCode" type="text" class="form-control"><br> <br>
	 Item name: <br><input name="itemName" type="text" class="form-control"><br> <br>
	 Item price: <br><input name="itemPrice" type="text" class="form-control"><br> <br>
	 Item description: <br><input name="itemDesc" type="text" class="form-control"><br> <br>
	 <center><input name="btnSubmit" type="submit" value="Save Item" class="btn btn-primary"> </center>
	 
	 <br><br>

</form>


<div class="alert alert-success">
 <% out.print(session.getAttribute("statusMsg"));%>
</div>


<br> <br>

<%
 	Item itemObj = new Item();
 	out.print(itemObj.readItems());
%>



	</div>
 </div>
</div>

</div>
</body>
</html>