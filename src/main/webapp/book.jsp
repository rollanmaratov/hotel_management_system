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
            $("#searchForm").validate({
                rules: {
                    arrive: "required",
                    depart: "required",
                    people: "required",
                    room: "required",
                },

                messages: {
                    arrive: "Please enter email",
                    depart: "Please enter password",
                    people: "Please enter amount of people",
                    room: "Please enter amount of rooms"
                }
            });
            
            function updateList() {
                $("#rooms").html("");
                rooms.free.forEach(function (e) {
                    $("#rooms").append("<li>" + e + "</li>");
                });
            }           
            
            const isValidElement = element => {
                return element.name && element.value;
            };
            
            const formToJSON = elements => [].reduce.call(elements, (data, element) => {
                
                if (isValidElement(element)) data[element.name] = element.value;
                
                return data;
            
            }, {});
                            
            const form = document.getElementById('searchForm');
                
            form.addEventListener('submit', (event) => {

                event.preventDefault(); //stops form from submitting

                const data = formToJSON(form.elements)
                const dataJson = JSON.stringify(data);

                console.log('json data', data);
                var p = $.post('search', dataJson);

                p.done(function (r) {
                    rooms.free = r.list;
                    updateList();
                });

            });


        });
           
    </script>

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

                <div id="arrive" class="required">
                    <input type="date" class="floatLabel" name="arrive" value="<?php echo date('Y-m-d'); ?>">
                    <label class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Arrive</label>
                </div>

                <div id="depart" class="required">
                    <input type="date" class="floatLabel" name="depart" value="<?php echo date('Y-m-d'); ?>" />
                    <label class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Depart</label>
                </div>

                <select class="floatLabel" id="people" class="required">
                    <option value="blank"></option>
                    <option value="1">1</option>
                    <option value="2" selected>2</option>
                    <option value="3">3</option>
                </select>

                <label>People</label>

                <select class="floatLabel" id="room" class="required">
                    <option value="blank"></option>
                    <option value="1" selected>1</option>
                </select>

                <label>Room</label>

                <button id="searchButton" type="submit">Search</button>

            </div>

            <ul id="rooms"></ul>

        </div>
    </form>
</body>

</html>