<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Add Employee</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 20px;
}

h2 {
	color: #333;
}

form {
	max-width: 400px;
	margin: 20px auto;
	padding: 15px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 5px;
}

label {
	display: block;
	margin-bottom: 8px;
}

input[type="text"], input[type="number"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 12px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #4caf50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

a {
	color: #1e90ff;
	text-decoration: none;
	display: block;
	margin-top: 10px;
}
</style>
</head>
<body>
	<h2>Add Employee</h2>

	<form action="addEmployee" method="post">
		<label for="name">Name:</label> <input type="text" id="name"
			name="name" required> <label for="designation">Designation:</label>
		<input type="text" id="designation" name="designation" required>

		<label for="salary">Salary:</label> <input type="number" id="salary"
			name="salary" required> <input type="submit"
			value="Add Employee">
	</form>

	<a href="/employe">View Employees</a>
</body>
</html>
