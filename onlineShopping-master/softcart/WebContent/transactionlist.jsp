<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="logic.*"%>
<jsp:useBean id= "orderlist" scope= "page"  class= "logic.ProductSort" type= "logic.ProductSort" >  </jsp:useBean>
<%
UserDetails user = (UserDetails)request.getSession().getAttribute("user");
if(user==null){
	response.sendRedirect("login.jsp");
}
else if(user.getRole().equals("admin"))
{
   
}
else if(user.getRole().equals("user"))
{
   response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Soft Cart</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <!-- <link rel="stylesheet" href="./bootstrap/bootstrap.min.css">
  <script src="./bootstrap/jquery-1.8.3.min.js"></script>
  <script src="./bootstrap/bootstrap.min.js"></script>-->
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */
    .navbar {
      margin-bottom: 30px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */
     .jumbotron {
      margin-bottom: -30px;
      margin-top: -30px;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    #phead{
    background-color: #bd2031;
    }
  </style>
</head>
<body>

<div class="jumbotron">
  <div class="container text-center">
    <a href="#" class="pull-center"><img src="./images/softlogo.png"></a> 
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <h1 ><font color="#bd2031">Administration</font></h1>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <li>
<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
<span class="glyphicon glyphicon-user"></span> <%= user.getUsername() %>
<span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="logout.jsp">logout</a></li>
  </ul>
</li>
        
      </ul>
    </div>
  </div>
</nav>
</head>
<body>

<ul class="nav nav-tabs">
  <li><a href="admin.jsp">Home</a></li>
  <li><a href="productlist.jsp">Products</a></li>
  <li><a href="userlist.jsp">User Requests</a></li>
  <li class="active"><a href="transactionlist.jsp">Transaction</a></li>
  <li><a href="reportlist.jsp">Reports</a></li>
</ul>
Transactions:
<table class="table">
    <thead>
      <tr>
        <th>Order_ID</th>
         <th>User_ID</th>
        <th>Order Details</th>
        <th>Payment Details</th>
        <th>Total</th>
       
        <th>Status</th>
        
        
      </tr>
    </thead>
    <tbody>
    
<%  for (OrderDetails od : orderlist.getOrders(0))  {%>


      <tr>
     
        <td><%= od.getId() %></td>
        <td><%= od.getIdUser() %></td>
        <td><%= od.getOrders() %></td>
        <td><%= od.getPayment() %></td>
       
        <td><%= od.getTotal() %></td>
        <td> 
        <a href="LogServlet?log=updateorder&orderid=<%=od.getId()%>" class="btn btn-info" role="button"><%  if (od.getStatus()==1) {out.print("Deliver");}
else out.print("Delivered"); %></a>
        </td>
      </tr>
<% }%>
    </tbody>
  </table>
</body>
</html>