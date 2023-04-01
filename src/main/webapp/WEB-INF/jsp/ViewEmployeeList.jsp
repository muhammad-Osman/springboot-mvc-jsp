<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
   <meta charset="ISO-8859-1">
   <title>View Employee List</title>
   <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
   <style>
      a{
      color: white;
      }
      a:hover {
      color: white;
      text-decoration: none;
      }
   </style>
</head>
<body>
   <div class="container">
      <h1 class="p-3"> Employee Management Dashboard</h1>
      <a href="/addEmployee">
         <div class="row p-2" style="width:200px">
            <div class="col-md-2" style="width:200px">
               <button style="width:200px" class="btn btn-success">
               Add New Employee
               </button>
            </div>
         </div>
      </a>
      <form:form>
         <table class="table table-bordered">
            <tr>
               <th>Id</th>
               <th>First Name</th>
               <th>Last Name</th>
               <th>Date of birth</th>
               <th>Department</th>
               <th>Salary</th>
               <th>Manager</th>
               <th>Edit</th>
               <th>Delete</th>
            </tr>
            <c:forEach var="employee" items="${employeeList}">
               <tr>
                  <td>${employee.id}</td>
                  <td>${employee.firstName}</td>
                  <td>${employee.lastName}</td>
                  <td>${employee.dob}</td>
                  <td>${employee.department}</td>
                  <td>${employee.salary}</td>
                  <td>${employee.manager}</td>
                  <td>
                     <button type="button" class="btn btn-success">
                     <a href="/updateEmployee/${employee.id}">Edit</a>
                     </button>
                  </td>
                  <td>
                     <button type="button" class="btn btn-danger">
                     <a href="/deleteEmployee/${employee.id}">Delete</a>
                     </button>
                  </td>
               </tr>
            </c:forEach>
         </table>
      </form:form>
   </div>
</body>
</html>