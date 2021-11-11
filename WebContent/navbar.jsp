<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="stlf" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 	<style><%@include file="css/Navbar.css"%></style>
 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
</head>
<body>
		<header>
			<c:if test=""></c:if>
			
			//Setting heading for header
			<%
				String heading="";
				String str=request.getServletPath(); 
				if(str.equals("/register.jsp"))
				{
					heading="Registration";
				}
				else if(str.equals("/index.jsp"))
				{
					heading="Login";
				}
				else if(str.equals("/rearch.jsp"))
				{
					heading="Search User";
				}
				else if(str.equals("/rllUsers.jsp"))
				{
					heading="All Users";
				}
				else if(str.equals("/userProfile.jsp"))
				{
					heading="User Details";
				}
				else if(str.equals("/update.jsp"))
				{
					heading="Update Profile";
				}
				
			%>
			
			//Setting Login/Logut with the help of cookies
			<%
				Cookie[] cookies=request.getCookies();
				boolean f=false;
				String name="";
				String login="Login";

				System.out.println("Starting to write cookie details.");
				if(cookies==null)
				{
					login="Login";
				}
				else
				{
					for(Cookie c:cookies)
					{
						System.out.println("Check cookie "+c+" "+c.getValue()+" "+c.getName());
						if(c.getValue().equals("yes"))
						{
							f=true;
							login="Logout";
						}
					}
				}
				System.out.println(login);
				String loginpath="index.jsp";
				System.out.println(loginpath+" "+login.equals("Logout"));
				if(login.equals("Logout")){
					loginpath="logout";
				}
			%>
			<h1><%=heading%></h1> 
			<nav>
				<div class="nav_links">
					<div><a href=<%=loginpath %>><%=login %></a></div>
					<div><a href="register.jsp">Register</a></div>
					<div><a href="search.jsp">Search</a></div>
				</div>
			</nav>
			<a class="cta" href="allUsers.jsp"><button class="my_button" >All Users</button></a>
		</header>
</body>
</html>