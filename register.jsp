<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <link rel="stylesheet" href="style.css">
        <script src="scripts/jquery.min.js"></script>
        <script src="scripts/lodash.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
        <script type="text/javascript">
        //here goes my script

        function sendRegisterInfo() {
            var firstname = $("#firstname").val();
            var lastname = $("#lastname").val();
            var email = $("#email").val();
            var password = $("#password").val();
            var reppassword = $("#reppassword").val();
            var origin = $("#origin").val();
            var age = $("#age").val();
            if (email === "" || password === "" || firstname === "" || lastname === "" || reppassword === "" || origin === ""|| age === "") {
                alert("Enter all the fields");
            }

            $.post('register', {firstname: firstname, lastname: firstname, email: email, password: password, reppassword: reppassword, origin: origin, age: age}, function(response) {
                $('.ajax_response').text(response);
                alert(response);
            });
        }

        $(document).ready(function () {
            $("#register_button").on('click', function()  {
                sendRegisterInfo();
            });
        });
        </script>
    </head>
<body>
    <div class="links">
        <a href="login.jsp">Log In or Register</a>
    </div>
    <div class="heading">
        
        <div class="hotel_logo">
            <a href="index.jsp">
            <span>Hotel <br> Dreamers</span>
            </a>
        </div>
        
        <div class="services">
            <a href="index.jsp"> Homepage </a>
            <a href="draft.html">Create a Booking</a>
            <a href="draft.html">Manage my Booking</a>
            <a href="draft.html">Information</a>
            <a href="draft.html">Contacts</a>
        </div>
    </div>

    <div class="registration">
        <span class="title">Registration</span>
        <form method="POST"> 
            <input type="text" placeholder="Enter First Name" name="firstname" id="firstname"> <br>
            <input type="text" placeholder="Enter Last Name" name="lastname" id="lastname"> <br>
            <input type="text" placeholder="Enter Email" name="email" id="email"> <br>
            <input type="password" placeholder="Enter Password" name="password" id="password"> <br>
            <input type="password" placeholder="Repeat Password" name="reppassword" id="reppassword"> <br>
            <input type="text" placeholder="Enter your country of origin" name="origin" id="origin"> <br>
            <input type="number" placeholder="Enter your age" name="age" id="age"> <br>
            <input type="button" id="register_button" value="Register">
        </form>
        <div class="ajax_response"></div>
    </div>
</body>
</html>