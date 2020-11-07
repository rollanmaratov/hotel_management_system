<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Page</title>
        <link rel="stylesheet" href="style.css">
        <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
        <script src="scripts/lodash.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
        <script type="text/javascript">
        //here goes my script

        var session = '<%= session.getAttribute("user") != null %>';
        console.log(${user.email})

        function writeJson(data) {
            console.log(data['firstName']);
            $("#firstName").innerHTML(data['firstName']);
            $("#lastName").innerHTML(data['lastName']);
            $("#email").innerHTML(data['email']);
            $("#addressLine1").innerHTML(data['addressLine1']);
            $("#addressLine2").innerHTML(data['addressLine2']);
            $("#idType").innerHTML(data['idType']);
            $("#idNumber").innerHTML(data['idNumber']);
            $("#mobilePhoneNumber").innerHTML(data['mobilePhoneNumber']);
            $("#homePhoneNumber").innerHTML(data['homePhoneNumber']);
            $("#sex").innerHTML(data['sex']);
            $("#dateOfBirth").innerHTML(data['dateOfBirth']);
        }

        function getGuestInfo() {
            $.post("profile_information", ${user.email}, function (data) {
                //here data is json of every field it has
                writeJson(data);
            })
        }

        $(document).ready(function() {
            getGuestInfo();
        });

    </script>
    </head>
    <body>
        <div class="links">
            <a href="logout.jsp"><b>Logout</b></a>
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
                <a>Manage my Booking</a>
                <a href="draft.html">Information</a>
                <a href="draft.html">Contacts</a>
            </div>
        </div>

        <div class="title_section">
            <span class="title"> My bookings </span>
        </div>

        <div class="bookings">
            <div id="active_bookings">
                <ul id="activeBookingList"></ul>
            </div>

            <div id="past_bookings">
                <ul id="pastBookingList"></ul>
            </div>
        </div>
        <br />
        <br />

        <div class="title_section">
            <span class="title"> User Profile </span>
        </div>

        <div class="info_section">
            <span>First Name: </span> <span id="firstName"></span>
            <span>Last Name: </span> <span id="lastName"></span>
            <span>Email: </span> <span id="email"></span>
            <span>Address: </span> <span id="addressLine1"></span> <span id="addressLine2"></span>
            <span>Document: </span> <span id="idType"></span> <span id="idNumber"></span>
            <span>Mobile Phone Number: </span> <span id="mobilePhoneNumber"></span>
            <span>Home Phone Number: </span> <span id="homePhoneNumber"></span>
            <span>Sex: </span> <span id="sex"></span>
            <span>Date of Birth: </span> <span id="dateOfBirth"></span>
        </div>

    </body>
</html> 
