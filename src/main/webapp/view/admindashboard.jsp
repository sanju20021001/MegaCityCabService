<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <a href="adminDashboard.jsp?action=add">Add New Car</a>
        <a href="logout.jsp">Logout</a>
    </header>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Model</th>
                <th>Plate</th>
                <th>Price</th>
                <th>Status</th>
                <th>Brand</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="car" items="${cars}">
                <tr>
                    <td>${car.id}</td>
                    <td>${car.model}</td>
                    <td>${car.plate}</td>
                    <td>${car.price}</td>
                    <td>${car.status}</td>
                    <td>${car.brand}</td>
                    <td><img src="${car.image}" alt="Car Image" width="50" /></td>
                    <td>
                        <a href="adminDashboard.jsp?action=edit&id=${car.id}">Edit</a>
                        <a href="adminController?action=delete&id=${car.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
