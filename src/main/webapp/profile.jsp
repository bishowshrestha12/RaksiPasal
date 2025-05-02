<%@ page import="com.RaksiPasal.model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h2>User Profile</h2>

    
    <form action="${pageContext.request.contextPath}/Profile" method="post">
        <label>Email:</label>
        <input type="email" name="email" required /><br/><br/>

        <label>Password:</label>
        <input type="password" name="password"  required /><br/><br/>

        <label>First Name:</label>
        <input type="text" name="fname"  required /><br/><br/>

        <label>Last Name:</label>
        <input type="text" name="lname"  required /><br/><br/>

        <label>Date of Birth:</label>
        <input type="date" name="dob"  required /><br/><br/>

        <input type="submit" value="Update Profile" />
    </form>
</body>
</html>
