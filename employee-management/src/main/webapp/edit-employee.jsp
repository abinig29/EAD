<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Edit Employee</title>
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
	<h2>Edit Employee</h2>
	<form action="editEmployee" method="post">
		<input type="hidden" name="id" value="${id}">
		 Name: <input type="text" name="name" value="${name}" required>
			<br>
		Designation: <input type="text" name="designation" value="${designation}" required>
			<br>
		Salary: <input type="text" name="salary" value="${salary}" required><br>
		<input type="submit" value="Update">
	</form>
	<a href="/employe">View Employees</a>
</body>
</html>
