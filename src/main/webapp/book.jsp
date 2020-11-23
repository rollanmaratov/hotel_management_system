<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Hotel Dreamers</title>


</head>
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">


<script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="scripts/jquery.min.js"></script>
<script src="scripts/lodash.min.js"></script>


<script type="text/javascript">

    var rooms = {
        free: []
    }

    $(document).ready(function() {

        const form = document.getElementById('searchForm');

        const isValidElement = element => {
            return element.name && element.value;
        };

        const formToJSON = elements => [].reduce.call(elements, (data, element) => {

            if (isValidElement(element)) data[element.name] = element.value;

            return data;

        }, {});


        function updateList() {
            $("#rooms").html("");
            rooms.free.forEach(function (e, p) {

                var inputElement = document.createElement('input');

                inputElement.type = "button"
                inputElement.value = "book"

                inputElement.addEventListener('click', function(){
                    rooms.free[p].checkInDate = form.elements.arrive.value;
                    rooms.free[p].checkOutDate = form.elements.depart.value;
                    
                    let date_ob = new Date();
                    let date = ("0" + date_ob.getDate()).slice(-2);
                    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
                    let year = date_ob.getFullYear();

                    rooms.free[p].reservationDate = year + "-" + month + "-" + date;

                    console.log(rooms.free[p]);

                    $.post('create_booking', rooms.free[p]);
                    //window.location.href = "index.jsp";
                });

                $("#rooms").append("<li>" + e.city + '   Type of Room: ' + e.typeName + '   Capacity: ' + e.capacity + "</li>").append(inputElement);
            });
        }


        form.addEventListener('submit', (event) => {

            event.preventDefault(); //stops form from submitting

            const data = formToJSON(form.elements);
            //const dataJson = JSON.stringify(data);

            console.log('json data', data);
            var p = $.get('search', data);

            p.done(function (r) {
                rooms.free = r;
                updateList();
            });

        });


    });

</script>

<body>

<div class="links">
    <a href="logout.jsp">Logout</a>
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

<form id="searchForm">
    <h2 class="heading">Search rooms</h2>
    <h2 class="heading">Details</h2>

    <div class="grid">

        <div class="controls">

            <div class="required">
                <input id="arrive" type="date" class="floatLabel" name="arrive" value="<?php echo date('Y-m-d'); ?>">
                <label class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Arrive</label>
            </div>

            <div class="required">
                <input id="depart" type="date" class="floatLabel" name="depart" value="<?php echo date('Y-m-d'); ?>" />
                <label class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Depart</label>
            </div>

            <select class="floatLabel" id="people" class="required" name="people">
                <option value="blank"></option>
                <option value="1">1</option>
                <option value="2" selected>2</option>
                <option value="3">3</option>
            </select>

            <label>People</label>

            <select class="floatLabel" id="city" class="required" name="city">
                <option value="Astana">Astana</option>
                <option value="London" selected>London</option>
                <option value="New York">New York</option>
                <option value="Moscow">Moscow</option>
                <option value="Dubai">Dubai</option>
            </select>

            <label>City</label> <br>

            <button id="searchButton" type="submit">Search</button>

        </div>

    </div>
</form>

<ul id="rooms"></ul>
</body>

</html>