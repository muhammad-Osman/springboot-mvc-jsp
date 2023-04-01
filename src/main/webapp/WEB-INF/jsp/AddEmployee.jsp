<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
   <meta charset="ISO-8859-1">
   <title>Add Employee</title>
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
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
   <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head>
<body>
   <div class="container" style="padding-top:200px">
      <h1 class="p-3"> Add New Employee </h1>
      <form:form action="/saveEmployee" method="post" modelAttribute="employee">
         <div class="form-row">
            <div class="form-group col-md-6">
               <label for="firstName">First Name</label>
               <form:input type="text" path="firstName" id="firstName"
                  class="form-control" required="required" />
            </div>
            <div class="form-group col-md-6">
               <label for="lastName">Last Name</label>
               <form:input type="text" path="lastName" id="lastName"
                  class="form-control" required="required" />
            </div>
         </div>
         <div class="form-row">
            <div class="form-group col-md-6">
               <label for="dob">Date of birth</label>
               <form:input class="form-control" path="dob" id="dob" name="dob" placeholder="MM/DD/YYY" type="text"
                  required="required" />
            </div>
            <select style="width:49%; height:40px; margin-top: 32px; margin-left: 3px; padding-top: 0.2rem;"
               path="department" name="department" id="department" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
               <option selected>Java Developer</option>
               <option value="IT">IT</option>
               <option value="Software Developer">Software Developer</option>
               <option value="DevOps">DevOps</option>
               <option value="UX/UI">UX/UI</option>
            </select>
         </div>
         <div class="form-row">
            <div class="form-group col-md-6">
               <label for="salary">Salary</label>
               <form:input type="number" path="salary" id="salary"
                  class="form-control" required="required" />
            </div>
            <div class="form-group col-md-6">
               <label for="manager">Manager</label>
               <form:input type="text" path="manager" id="manager"
                  class="form-control" />
            </div>
         </div>
         <div class="row p-2">
            <div class="col-md-2">
               <button type="submit" value="Register" class="btn btn-success">Save</button>
            </div>
         </div>
      </form:form>
   </div>
   <script th:inline="javascript">
      window.onload = function() {
          var msg = "${message}";

          console.log(msg);

          if (msg == "Save Failure") {
      Command: toastr["error"]("Something went wrong with the save.")
      }


      $(document).ready(function(){
                var date_input=$('input[name="dob"]');
                var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
                var options={
                  format: 'mm/dd/yyyy',
                  container: container,
                  todayHighlight: true,
                  autoclose: true,
                };
                date_input.datepicker(options);
              })

      toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
      }
      }
   </script>
</body>
</html>