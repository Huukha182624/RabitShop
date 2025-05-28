<%-- 
    Document   : viewcart
    Created on : May 25, 2024, 4:35:12 AM
    Author     : DELL'
--%>

<%@page import="product.CartDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewcart Page</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                background-color: #f1f1f1;
                margin: 0;
                padding: 0;
                text-align: center;
                height: 700px;
            }
            .cont{
                text-align: center;
                width: 100%;
                float: left;
                font-size: 44px;
                color: #252525;
                font-weight: bold;
                text-transform: uppercase;

            }

            .social ul{
                margin-top: 20px;
                display: flex; 
                justify-content: space-around;
                list-style: none;
            }
            .social ul a{
                margin-top: 20px;
                color: black;
                text-decoration: none;
            }

            @keyframes gradientAnimation {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
            .form-container {
                background: #f2f2f2;
                opacity: 0.9;
                padding: 20px;
                margin-top: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-container form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 10px;
            }
            .form-container input[type="text"] {
                width: 200px;
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .form-container input[type="submit"] {
                padding: 10px 20px;
                background: #50b3a2;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-container input[type="submit"]:hover {
                background: #45a089;
            }
            .notification {
                color: brown;
                font-size: 18px;
                text-align: center;
                margin-top: 20px;
            }
            table {
                width: 70%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: cornsilk;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #dda285e6;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            img.rabbitimg {
                width: 70px;
                height: 70px;
            }
            input[type="submit"] {
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 10px 20px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 4px;
            }

            input[type="submit"]:hover {
                background-color: #c82333;
            }
            a {
                text-decoration: none;
                color: black;
                font-weight: bold;
            }
            a:hover {
                color: #45a089;
            }
            .navbar{
                background-color: blueviolet;
                width: 100%;
                background-color: #660066;
            }

            .logo{
                width: 70px;
                height: 40px;
            }
            .button{
                padding: 8px 16px;
                border-radius: 40px;
                margin: 10px; 
            }
           
            
            .checkout{
                margin-bottom: 150px;
            }
        </style>
    </head>
    <body style="background-color: #fef4ec;">
        <%
            String user = (String) session.getAttribute("user");
        %>
        <jsp:include page="headershop.jsp"/>
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">  
                    <h1><i>My Cart</i></h1>
                    <h4> <p class="cont"> Welcome <%= user%></p></h4> 
                </div>
            </div>
        </div>
        <br>
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <table border="1px">
            <tr>
                <th> Rabbit name </th>
                <th>  img </th>
                <th> Description </th>
                <th> Price </th>
                <th> Quanity </th>
                <th> Action </th>
            </tr>
            <%
                for (ProductDTO i : cart.getCart()) {
            %>
            <form action="MainController"> 
                <tr>
                    <td style="font-weight: bold;"> 
                        <%=i.getName()%> 
                        <input type="hidden" name="productName" value="<%=i.getName()%>">
                    </td>
                    <td> <img class="rabbitimg" src="img/<%= i.getpImage()%>"  </td>
                    <td> <%=i.getpDescription()%>  </td>
                    <td> <%=i.getPrice()%> $ </td>
                    <td> 
                        <input type="number" name="productQuantity" min="1" required="" value="<%=i.getQuantity()%>">
                    </td>
                    <td> 
                        <input type="hidden" name="pId" value="<%= i.getpId()%>"> 
                        <input type="submit" name="action" value="Edit" style="padding: 8px 16px;
                border-radius: 40px;
                margin: 10px; 
                background-color: black"> 
                        <input type="submit" name="action" value="Remove" style="padding: 8px 16px;
                border-radius: 40px;
                margin: 10px;">
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </table>
        <%
                }
            }
            if (cart == null || cart.getCart().isEmpty()) {
        %>
        <div class="noti">
            <h3 style="color: red">
                Your cart is empty !!
            </h3> 
        </div>
        <%
            }
            if (cart != null && !cart.getCart().isEmpty()) {
                float total = cart.totalMoney();
        %>
        <h3 style="color: brown">
            Your total money is: <%= total%> $
        </h3>
        <%
            }
        %>

        <br>
        <h3 style="color: red"> ${requestScope.outOfStock}   </h3>
        <h3 style="color: red"> ${requestScope.error}  </h3>
        <h3 style="color: red"> ${requestScope.editError}  </h3>
        <h3 style="color: red"> ${requestScope.emptyCart}  </h3>
        <%
            if (request.getAttribute("emptyCart") != null) {
        %>
        <script type="text/javascript">
            alert("You haven't added any product yet !!")
        </script>
        <%
            }
        %>
        <h3 style="color: green"> ${requestScope.removed}  </h3>
        <h3 style="color: green"> ${requestScope.edited}  </h3>
        <div style="display: inline-flex">
            <div class="addmore">
                <form action="MainController">
                    <input type="submit" name="action" value="Add more" style="padding: 8px 16px;
                border-radius: 40px;
                margin: 10px; 
                background-color: black">
                </form> 
            </div>
            <div class="checkout">
                <form action="BeforeCheckOutController">
                    <input type="submit" name="action" value="Check Out" style="padding: 8px 16px;
                border-radius: 40px;
                margin: 10px; ">
                </form> 
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div  class="social">
                        <ul>
                            <li> <a href="#"><i class="fa-brands fa-facebook"></i> &nbsp; Facebook </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-instagram"></i> &nbsp; Instagram </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-x-twitter"></i> &nbsp; X(Twitter) </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-threads"></i> &nbsp; Thread </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-tiktok"></i> &nbsp; Tiktok </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-threads"></i> &nbsp; Thread </a> </li>
                        </ul> 
                    </div>   
                </div>
            </div>
        </div>
        
    </body>
</html>
