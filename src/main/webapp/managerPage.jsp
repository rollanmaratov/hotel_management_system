<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dreamers - Manager Page</title>
    <link rel="stylesheet" href="style.css">
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    <script src="scripts/lodash.min.js"></script>
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

        const isValidElement = element => {
            return element.name && element.value;
        };


        const formToJSON = elements => [].reduce.call(elements, (data, element) => {
            if (isValidElement(element) ) {
                data[element.name] = element.value;
            }
            return data;
        }, {});


        function deleteItem(resID) {
            $.post("cancel_booking", resID, function () {
                console.log("success!")
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

                let deleteBooking = "<button onclick='deleteItem("+ resID +")'>Cancel</button>";
                if(isFuture) {
                    $("#activeBookingList").append("<li>" + resID + inDate + outDate + resDate + typeName + hotelID + deleteBooking + "</li>");
                } else {
                    $("#pastBookingList").append("<li>" + resID + inDate + outDate + resDate + typeName + hotelID + "</li>");
                }
            });
        }

        function getBookings() {
            var email = getCookie("userEmail");
            $.get("get_bookings", email, function(data) {
                updateList(data);
            })
        }

        function fillFields(emp, id) {
            $("#foundEmp").show()
            var form = document.getElementById("empForm")
            $("#monHours").attr("value", emp["monHours"])
            $("#tueHours").attr("value", emp["tueHours"])
            $("#wedHours").attr("value", emp["wedHours"])
            $("#thuHours").attr("value", emp["thuHours"])
            $("#friHours").attr("value", emp["friHours"])
            $("#satHours").attr("value", emp["satHours"])
            $("#sunHours").attr("value", emp["sunHours"])
            $("#hourSalary").attr("value", emp["hourSalary"])
            $("#userID").attr("value", id)
            $("#update").on("click", function() {
                const data = formToJSON(form.elements)
                console.log("passed data", data)
                const dataJson = JSON.stringify(data)
                var p = $.post('manage_employee', dataJson);
                p.done(function () {
                    console.log('success')
                })
            })
        }

        function findEmployee() {
            const id = $("#emp").val();
            console.log(id);
            var p = $.get('find_employee', id);
            p.done(function (data) {
                console.log(data)
                if (data !== null) {
                    $("#no_employee").hide()
                    fillFields(data, id)
                } else if (data === null) {
                    $("#foundEmp").hide()
                    $("#no_employee").show()
                    $("#no_employee").html("No employee matches this ID")
                }
            })
        }

        $(document).ready(function() {

            $("#search").on("click", function () {
                findEmployee();
            });
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
        <a>Manage</a>
        <a href="draft.html">Information</a>
        <a href="draft.html">Contacts</a>
    </div>
</div>

<div class="title_section">
    <span class="title"> Manage Employees </span>
</div>

<div class="searchEmployee">
    <form id="search_emp">
        <label for="emp">Search Employee by ID</label>
        <input name="emp" id="emp" type="text">
        <button type="button" id="search">Search</button>
    </form>
</div>
<span id="no_employee"></span>
<div id="foundEmp" style="display: none">
    <span id="employee"></span> <br>
    <form id="empForm">
        <span id="wh">Working Hours: </span> <br>
        <div class="days">
            <label for="monHours">Monday:</label><input type="text" name="monHours" id="monHours">
            <label for="tueHours">Tuesday:</label><input type="text" name="tueHours" id="tueHours">
            <label for="wedHours">Wednesday:</label><input type="text" name="wedHours" id="wedHours">
            <label for="thuHours">Thursday:</label><input type="text" name="thuHours" id="thuHours">
            <label for="friHours">Friday:</label><input type="text" name="friHours" id="friHours">
            <label for="satHours">Saturday:</label><input type="text" name="satHours" id="satHours">
            <label for="sunHours">Sunday:</label><input type="text" name="sunHours" id="sunHours">
            <input type="text" id="userID" name="userID" style="display: none">
        </div>
        <br>
        <div class="hrsslry">
            <label for="hourSalary">Salary: </label><input type="text" name="hourSalary" id="hourSalary">
        </div>
        <br><button type="button" id="update">Submit changes</button>
    </form>

    <div id="response"></div>
</div>

</body>
</html>
