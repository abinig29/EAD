<%@ page import="java.util.List"%>
<%@ page import="com.itsc.Employee"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>View Employees</title>
<style>
/* Style for the Add Employee button */
.btn {
	padding: 6px 6px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	background-color: #4CAF50; /* Green background color */
	color: white; /* White text color */
	border: 1px solid #4CAF50; /* Green border */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer;
}

.d-btn {
	padding: 6px 6px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	background-color: red; /* Green background color */
	color: white; /* White text color */
	border: 1px solid #4CAF50; /* Green border */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer;
}

.no-dis {
	display: none;
}

.btn:hover {
	background-color: #45a049; /* Darker green on hover */
}

.table {
	margin-bottom: 20px;
}

body {
	font-family: Arial, sans-serif;
}

h2 {
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

a.button {
	display: inline-block;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
}
</style>
</head>
<body>
	<h2>Employee List</h2>
	<table border="1" class='table'>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Designation</th>
				<th>Salary</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Employee> employees = (List<Employee>) request.getAttribute("employees");
			for (Employee employee : employees) {
			%>
			<tr>
				<td><%=employee.getId()%></td>
				<td><%=employee.getName()%></td>
				<td><%=employee.getDesignation()%></td>
				<td><%=employee.getSalary()%></td>
				<td><a class='btn' href="editEmployee?id=<%=employee.getId()%>">Edit</a></td>
				<td><button class='d-btn'
						onclick="showDeleteModal(<%=employee.getId()%>)">Delete</button></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<a class='btn' href="add-employee.jsp">Add Employee</a>
	<p id='employeeIdToDelete' class='no-dis'></p>

	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeDeleteModal()">&times;</span>
			<p>Are you sure you want to delete this employee?</p>
			<button class='d-btn' onclick="deleteEmployee()">Delete</button>
			<button class='btn' onclick="closeDeleteModal()">Cancel</button>
		</div>
	</div>
	<script>
		function showDeleteModal(employeeId) {
			document.getElementById('employeeIdToDelete').value = employeeId;
			document.getElementById('deleteModal').style.display = 'block';
		}
		function closeDeleteModal() {
			document.getElementById('deleteModal').style.display = 'none';
		}
		function deleteEmployee() {
			var employeeId = document.getElementById('employeeIdToDelete').value;
			window.location.href = 'deleteEmployee?id=' + employeeId;
		}
	</script>
</body>
</html>
