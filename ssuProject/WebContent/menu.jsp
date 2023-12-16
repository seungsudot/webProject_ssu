<%@ include file="session_check.jsp" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/cerulean/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="./assets/css/custom.css">
</head>
<body>
<header class="background-header">
<nav class="navbar navbar-expand-lg">
	<div class="container">
       	<div class="collapse navbar-collapse" id="navbarResponsive">
       		<ul class="navbar-nav ml-auto">
       			<li class="nav-item">
       				<a class="nav-link" href="./welcome.jsp">Home</a>
       			</li>
       			<li class="nav-item">
       				<a class="nav-link" href="./products.jsp">Products</a>
       			</li>
       			<%
       				if(isName) {
       			%>
       			<li class="nav-item">
       				<a class="nav-link" href="./myPage.jsp">MyPage</a>
       			</li>
       			<li class="nav-item">
       				<a class="nav-link" href="./logout.jsp">LogOut</a>
       			</li>
       			<%
       				} else {
       			%>
       			<li class="nav-item">
           			<a class="nav-link" href="./login.jsp">Login</a>
           		</li>
       			<% 
       			} 
       			%>
       		</ul>
       	</div>
	</div>
</nav>
</header>
</body>
</html>

