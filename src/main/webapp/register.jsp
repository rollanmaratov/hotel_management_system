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


        $(document).ready(function () {
            $("#register_button").on('click', function()  {
                setTimeout(function() {
                    $('#ajax_response').text('You successfully created a profile! <br> You will be redirected to login page in 5 seconds')
                }, 5000)
            });
        });
        </script>
    </head>
<body>
    <div class="links">
        <a href="login.jsp">Log In</a>
    </div>
    <div class="heading">
        
        <div class="hotel_logo">
            <a href="index.jsp">
            <span>Hotel <br> Dreamers</span>
            </a>
        </div>
        
        <div class="services">
            <a href="index.jsp"> Homepage </a>
            <a href="book.jsp">Create a Booking</a>
            <a href="draft.html">Manage my Booking</a>
            <a href="draft.html">Information</a>
            <a href="draft.html">Contacts</a>
        </div>
    </div>

    <div class="title_section">
        <span class="title">Registration</span>
    </div>

    <div class="registration">
        <form method="POST" action="register" id="regForm">
            <input type="text" placeholder="First Name" name="firstname" id="firstname" required> <!-- on same line -->
            <input type="text" placeholder="Last Name" name="lastname" id="lastname" required> <br>
            <input type="text" placeholder="Email" name="email" id="email" required> <br>
            <input type="password" placeholder="Password" name="password" id="password" required> <br>
            <input type="password" placeholder="Repeat Password" name="reppassword" id="reppassword" required> <br>

            <label for="idType">Choose your Identification Document:</label> <br />
            <select name="idType" id="idType" required>
                <option value="passport">Passport</option>
                <option value="drivers license">Driver's License</option>
                <option value="state id">State ID</option>
            </select>
            <br>
            <input type="text" placeholder="Document Number" name="idNum" id="idNum" required> <br>
            <input type="text" placeholder="Address line 1 (country, city, place)" id="address1" name="address1" required>
            <br>
            <input type="text" placeholder="Address line 2 (any additional info)" id="address2" name="address2" > <br>
            <input type="text" name="mphone" id="mphone" placeholder="Mobile Phone Number" pattern="\+[0-9]{11}" required> <br>
            <input type="text" name="hphone" id="hphone" placeholder="Home Phone Number" pattern="\+[0-9]{11}"> <br>
            <input type="date" name="dateOfBirth" id="dateOfBirth" placeholder="yyyy-mm-dd"> <br>
            <!-- sex -->

            <input type="radio" id="male" name="sex" value="male">
            <label for="male">Male</label>
            <input type="radio" id="female" name="sex" value="female">
            <label for="female">Female</label>
            <input type="radio" id="nonbinary" name="sex" value="other">
            <label for="nonbinary">Other</label> <br>

            <input type="button" id="register_button" value="Register">
        </form>
        <div class="ajax_response"></div>
    </div>
</body>
</html>