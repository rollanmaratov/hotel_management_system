<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
    <script type="text/javascript">
        //here goes my script

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for(var i = 0; i <ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) === ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) === 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function writeGuestInfoJson(data) {
            $("#firstName").html(data['firstname']);
            $("#lastName").html(data['lastname']);
            $("#email").html(data['email']);
            $("#addressLine1").html(data['addressLine1']);
            $("#addressLine2").html(data['addressLine2']);
            $("#idType").html(data['idType']);
            $("#idNumber").html(data['idNumber']);
            $("#mobilePhoneNumber").html(data['mobilePhoneNumber']);
            $("#homePhoneNumber").html(data['homePhoneNumber']);
            $("#sex").html(data['sex']);
            $("#dateOfBirth").html(data['dateOfBirth']);
        }

        function getGuestInfo() {
            var email = getCookie("userEmail");
            $.post("profile_information", email, function (data) {
                writeGuestInfoJson(data);
            })
        }

        function compareDates(date) {
            var today = new Date();
            var d = date.split("-");
            if (parseInt(d[0]) < today.getFullYear()) {
                return false;
            } else if (parseInt(d[0]) > today.getFullYear()) {
                return true;
            } else {
                if (parseInt(d[1]) < today.getMonth()+1) {
                    return false;
                } else if (parseInt(d[1]) > today.getMonth()+1) {
                    return true;
                } else {
                    return parseInt(d[2]) > today.getDate();
                }
            }
        }

        function deleteItem(resID) {
            const res = resID.toString()
            $.post("cancel_booking", res, function (r) {
                console.log("response is:", r['message'])
            })
        }

        function updateList(bookings) {
            bookings.forEach(function (booking) {
                const resID = booking['reservationID']
                const inDate = booking['checkInDate']
                var isFuture = compareDates(inDate)
                const outDate = booking['checkOutDate']
                const resDate = booking['reservationDate']
                const typeName = booking['typeName']
                const hotelID = booking['hotelID']

                let deleteBooking = "<button id=\"cancel_button" + resID + "\" type=\"button\" onclick='deleteItem("+ resID +")'>Cancel</button>";
                let manageDates;
                if(isFuture) {
                    $("#activeBookingList").append("<li class=\"one_booking\">Booking ID: " + resID + ", Check In date: " + inDate + ", Check Out date: " + outDate + ", Reservation date: " + resDate + ", Room: " + typeName + " in Hotel " +  hotelID + deleteBooking + "</li>");
                } else {
                    $("#pastBookingList").append("<li class=\"one_booking\">Booking ID: " + resID + ", Check In date: " + inDate + ", Check Out date: " + outDate + ", Reservation date: " + resDate + ", Room: " + typeName + " in Hotel " +  hotelID + "</li>");
                }
            });
        }

        function getBookings() {
            var email = getCookie("userEmail");
            $.get("get_bookings", email, function(data) {
                if (data !== null) {
                    var b = document.getElementById("bookings")
                    b.style.display = "block";
                    updateList(data);
                } else {
                    var n = document.getElementById("no_bookings")
                    n.style.display = "block";
                    $("#no_bookings").html("You have no bookings yet")
                }
            })
        }

        $(document).ready(function() {
            var b = document.getElementById("bookings")
            b.style.display = "none";
            var n = document.getElementById("no_bookings")
            n.style.display = "none";
            getGuestInfo();
            getBookings();
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

<div id="bookings">
    <div id="active_bookings">
        <span>Current Bookings:</span> <br>
        <ul id="activeBookingList"></ul>
    </div>

    <div id="past_bookings">
        <span>Past Bookings:</span> <br>
        <ul id="pastBookingList"></ul>
    </div>
</div>
<div id="no_bookings"></div>
<br />
<br />
<div class="container">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="title_section">
                <span class="title"> User Profile </span>
            </div>
        </div>

        <div class="panel-body">
            <div class="info_section">
                <div class="form-group">
                    <span>First Name: </span> <span id="firstName" ></span> <br>
                </div>
                <span>Last Name: </span> <span id="lastName"></span><br>
                <span>Email: </span> <span id="email"></span> <br>
                <span>Address: </span> <span id="addressLine1"></span> <span id="addressLine2"></span> <br>
                <span>Document: </span> <span id="idType"></span> <span id="idNumber"></span> <br>
                <span>Mobile Phone Number: </span> <span id="mobilePhoneNumber"></span> <br>
                <span>Home Phone Number: </span> <span id="homePhoneNumber"></span> <br>
                <span>Sex: </span> <span id="sex"></span> <br>
                <span>Date of Birth: </span> <span id="dateOfBirth"></span> <br>
            </div>
        </div>
    </div>
</div>

</body>
</html>
