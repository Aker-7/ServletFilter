<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Success Page</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).on("click", "#somebutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
		$.post("SessionKill");
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#productos").click(function() {
			servletCall();
		});
	});
	function servletCall() {
		$.post("ServletProducts", {
			id : '1',
			name : 'Samsung',
			price : '19540.25',
			area : 'Electronica'
		});
	};
</script>

</head>
<body>
	<%
		//allow access only if session exists
		String user = (String) session.getAttribute("user");
		String userName = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user"))
					userName = cookie.getValue();
				if (cookie.getName().equals("JSESSIONID"))
					sessionID = cookie.getValue();
			}
		}
	%>
	<h3>
		Hi
		<%=userName%>, Login successful. Your Session ID=<%=sessionID%></h3>
	<br> User=<%=user%>
	<br>
	<a href="CheckoutPage.jsp">Checkout Page</a>
	<form action="LogoutServlet" method="post">
		<input type="submit" value="Salir">
	</form>
	<button id="somebutton">Matar Session</button>

	<button id="productos">Registrar productos Ajax</button>
</body>
</html>