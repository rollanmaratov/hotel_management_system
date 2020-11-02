<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css">
        <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="scripts/lodash.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
        <script type="text/javascript">
        //here goes my script

        function sendLoginInfo() {
            var email = $("#email").val();
            var password = $("#password").val();
            if (email === "" || password === "") {
                alert("Fields empty");
            }

            $.post('login', {email: email, password: password}, function(response) {
                $('#ajax_response').text(response);
            });
        }

        $(document).ready(function () {
            $("#login_button").on('click', function()  {

                sendLoginInfo();
            }),

            $("#loginForm").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },

                    password: "required",
                },

                messages: {
                    email: {
                        required: "Please enter email",
                        email: "Please enter a valid email address"
                    },

                    password: "Please enter password"
                }
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

        <div class="login">
            <span class="title">Login</span>
            <form method="POST" id="loginForm">
                <input type="text" placeholder="Email" name="email" id="email"> <br>
                <input type="password" placeholder="Password" name="password" id="password"> <br>
                <input type="button" id="login_button" name="login_button" value="Login">
                <br>${message}
                <script>
                    console.log(${message});
                </script>
                <p>New user? Register <a href="register.jsp">here</a></p>
            </form>
        </div>

   
    </body>
</html> 
