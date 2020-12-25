use hotel;


delete from Payment;
delete from Service_has_Reservation;
delete from Service;
delete from Reservation;
delete from phoneNumber;
delete from Employee_has_Supervisor;

delete from Guest_has_Category;
delete from Category;
delete from Guest;


delete from hotelFeature;
delete from roomFeature;
delete from Season;
delete from Employee_cleans_Room;
delete from Room;
delete from roomType;
delete from Employee;
delete from User;
delete from Hotel;


insert into Hotel(hotelID, name, address) values ('111', 'Astana Dream', 'Astana');
insert into Hotel(hotelID, name, address) values ('222', 'Moscow Dream', 'Moscow');
insert into Hotel(hotelID, name, address) values ('333', 'London Dream', 'London');
insert into Hotel(hotelID, name, address) values ('444', 'Dubai Dream', 'Dubai');
insert into Hotel(hotelID, name, address) values ('555', 'New York Dream', 'New York');


insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('single', '45.50', '111', '1', '49.99', '49.99', '49.99', '49.99', '49.99', '54.99', '54.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('double', '75.50', '111', '2', '59.99', '59.99', '59.99', '59.99', '59.99', '64.99', '64.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('single', '45.50', '222', '1', '49.99', '49.99', '49.99', '49.99', '49.99', '54.99', '54.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('double', '75.50', '222', '2', '59.99', '59.99', '59.99', '59.99', '59.99', '64.99', '64.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('single', '45.50', '333', '1', '59.99', '59.99', '59.99', '59.99', '59.99', '64.99', '64.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('double', '75.50', '333', '2', '69.99', '69.99', '69.99', '69.99', '69.99', '74.99', '74.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('single', '35.50', '444', '1', '49.99', '49.99', '49.99', '49.99', '49.99', '54.99', '54.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('double', '65.50', '444', '2', '59.99', '59.99', '59.99', '59.99', '59.99', '64.99', '64.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('penthouse suite', '120.50', '444', '5', '89.99', '89.99', '89.99', '89.99', '89.99', '94.99', '94.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('single', '35.50', '555', '1', '59.99', '59.99', '59.99', '59.99', '59.99', '64.99', '64.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('double', '115.50', '555', '2', '69.99', '69.99', '69.99', '69.99', '69.99', '74.99', '74.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('suite', '95.50', '555', '3', '79.99', '79.99', '79.99', '79.99', '79.99', '84.99', '84.99');

insert into roomType(typeName, size, hotelID, capacity, monPrice, tuePrice, wedPrice, thuPrice, friPrice, satPrice, sunPrice)
values ('penthouse suite', '120.50', '555', '5', '89.99', '89.99', '89.99', '89.99', '89.99', '94.99', '94.99');

insert into Season(name, startDate, endDate, alteringPrice, hotelID) 
values ('winter', '2020-12-01', '2021-02-28', '-10.00', '111');
insert into Season(name, startDate, endDate, alteringPrice, hotelID) 
values ('Christmas time', '2020-12-20', '2021-01-10', '20.00','555');
insert into Season(name, startDate, endDate, alteringPrice, hotelID)
values ('summer', '2020-06-01', '2021-08-30', '5.00', '111');
insert into Season(name, startDate, endDate, alteringPrice, hotelID)
values ('winter', '2020-12-01', '2021-02-28', '-5.00', '222');
insert into Season(name, startDate, endDate, alteringPrice, hotelID)
values ('winter', '2020-12-01', '2021-02-28', '-5.00', '333');
insert into Season(name, startDate, endDate, alteringPrice, hotelID)
values ('summer', '2020-06-01', '2021-08-30', '15.00', '222');
insert into Season(name, startDate, endDate, alteringPrice, hotelID)
values ('summer', '2020-06-01', '2021-08-30', '15.00', '333');
insert into Season(name, startDate, endDate, alteringPrice, hotelID)
values ('summer', '2020-06-01', '2021-08-30', '10.00', '555');


######## NEW INSERTS ######
###########################
######## SINGLES ##########

insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '111', 'single');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '222', 'single');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '333', 'single');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '444', 'single');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '555', 'single');

######## DOUBLES ##########

insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '111', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '222', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '333', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '444', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '555', 'double');

insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '111', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '222', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '333', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '444', 'double');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '555', 'double');

######## SUITE ########

insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '555', 'suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '555', 'suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('pool', '555', 'suite');


######## PENTHOUSE SUITE #######

insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '555', 'penthouse suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '555', 'penthouse suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('spa', '555', 'penthouse suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('champagne', '555', 'penthouse suite');

insert into roomFeature(roomFeature, hotelID, typename) values ('meal', '444', 'penthouse suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('tv', '444', 'penthouse suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('spa', '444', 'penthouse suite');
insert into roomFeature(roomFeature, hotelID, typename) values ('champagne', '444', 'penthouse suite');



########### Hotel FEATURES ##########

insert into hotelFeature(hotelID, hotelFeature) values ('111', 'free kumys');
insert into hotelFeature(hotelID, hotelFeature) values ('222', 'russian roulette');
insert into hotelFeature(hotelID, hotelFeature) values ('333', 'best tea');
insert into hotelFeature(hotelID, hotelFeature) values ('444', 'golden furniture');
insert into hotelFeature(hotelID, hotelFeature) values ('555', 'casino nearby');



########## User TABLE ###############

insert into User(password, firstname, lastname, email, userID)
values ('meowmeow', 'Nargiza', 'Mirzabekova', 'nargiza.mirzabekova@nu.edu.kz', '1');
insert into User(password, firstname, lastname, email, userID)
values ('peowpeow', 'Dnislam', 'Urazayev', 'dnislam.urazayev@nu.edu.kz', '2');
insert into User(password, firstname, lastname, email, userID)
values ('bleowbleow', 'Rollan', 'Maratov', 'rollan.maratov@nu.edu.kz', '3');
insert into User(password, firstname, lastname, email, userID)
values ('huewhuew', 'Adil', 'Zhiyenbayev', 'adil.zhiyenbayev@nu.edu.kz', '4');
insert into User(password, firstname, lastname, email, userID)
values ('kaewkaew', 'Karim', 'Almas', 'karim.almas@nu.edu.kz', '5');
insert into User(password, firstname, lastname, email, userID)
values ('bestprof', 'Mona', 'Rizvi', 'mona.rizvi@nu.edu.kz', '6');


########## Guest TABLE ############

insert into Guest(IdentificationNumber, IdentificationType, address, homePhoneNumber, mobilePhoneNumber, address2, dateOfBirth, sex, GuestID)
values ('12345', 'passport', 'Kazakhstan, Astana', '+77121234345', '+11231235566', '', date('2000-06-26'), 'F', '1');
insert into Guest(IdentificationNumber, IdentificationType, address, homePhoneNumber, mobilePhoneNumber, address2, dateOfBirth, sex, GuestID)
values ('54321', 'passport', 'Kazakhstan, Karagandy', '+77121234345', '+11231235566', '', date('1999-03-18'), 'M', '4');
insert into Guest(IdentificationNumber, IdentificationType, address, homePhoneNumber, mobilePhoneNumber, address2, dateOfBirth, sex, GuestID)
values ('78901', 'passport', 'Kazakhstan, Astana', '', '+44018973458', '', date('1980-03-18'), 'F', '6');

########## Category #############

insert into Category(categoryName, discount, categoryID) values ('gold', '30', '1');
insert into Category(categoryName, discount, categoryID) values ('silver', '15', '2');
insert into Category(categoryName, discount, categoryID) values ('bronze', '5', '3');


####### Guest HAS Category #####

insert into Guest_has_Category(guestID, categoryID) values ('1', '1');
insert into Guest_has_Category(guestID, categoryID) values ('4', '3');
insert into Guest_has_Category(guestID, categoryID) values ('6', '1');


######### EMPLOYEE ############

insert into Employee(employeeID, position, hotelID, hourSalary, 
monHours, tueHours, wedHours, thuHours, friHours, satHours, sunHours )
values('3', 'manager', '111', '10','8', '8','8','8','8','0','0');

insert into Employee(employeeID, position, hotelID, hourSalary, 
monHours, tueHours, wedHours, thuHours, friHours, satHours, sunHours)
values('2', 'deskClerk', '111','5','10', '10','10','10','10','5','5');

insert into Employee(employeeID, position, hotelID, hourSalary, 
monHours, tueHours, wedHours, thuHours, friHours, satHours, sunHours)
values('5', 'cleaner', '111','1','10', '10','10','10','10','5','5');


########## EMPLOYEE HAS SUPER ############

insert into Employee_has_Supervisor(employeeID, supervisorID) values ('2', '3');
insert into Employee_has_Supervisor(employeeID, supervisorID) values ('5', '3');


############ PHONE NUMBER ###########

insert into phoneNumber(hotelID, phoneNumber)
values ('111', '+77270001110');
insert into phoneNumber(hotelID, phoneNumber)
values ('222', '+99890002220');
insert into phoneNumber(hotelID, phoneNumber)
values ('333', '+88900003330');
insert into phoneNumber(hotelID, phoneNumber)
values ('444', '+97980004440');
insert into phoneNumber(hotelID, phoneNumber)
values ('555', '+88790005550');


###### ROOMS IN HOTEL 111 ##########

insert into Room(number, floor, numberOfOccupants, hotelID, typeName)
values('01', '1', '1', '111', 'single');
insert into Room(number, floor, hotelID, typeName)
values('02', '1', '111', 'single');
insert into Room(number, floor, hotelID, typeName)
values('03', '1', '111', 'single');
insert into Room(number, floor, hotelID, typeName)
values('04', '1','111', 'single');
insert into Room(number, floor, numberOfOccupants, hotelID, typeName)
values('20', '2', '2', '111', 'double');
insert into Room(number, floor, hotelID, typeName)
values('21', '2', '111', 'double');
insert into Room(number, floor, hotelID, typeName)
values('22', '2','111', 'double');
insert into Room(number, floor, hotelID, typeName)
values('23', '2', '111', 'double');
insert into Room(number, floor, hotelID, typeName)
values('25', '2', '111', 'double');
insert into Room(number, floor, hotelID, typeName)
values('311', '3', '111', 'double');

###### ROOMS IN HOTEL 222 ##########

insert into Room(number, floor, numberOfOccupants, hotelID, typeName)
values('11', '1', '1', '222', 'single');
insert into Room(number, floor, hotelID, typeName)
values('12', '1', '222', 'single');
insert into Room(number, floor, hotelID, typeName)
values('13', '1', '222', 'single');
insert into Room(number, floor, hotelID, typeName)
values('14', '1','222', 'single');
insert into Room(number, floor, numberOfOccupants, hotelID, typeName)
values('20', '2', '2', '222', 'double');
insert into Room(number, floor, hotelID, typeName)
values('21', '2', '222', 'double');
insert into Room(number, floor, hotelID, typeName)
values('22', '2','222', 'double');
insert into Room(number, floor, hotelID, typeName)
values('23', '2', '222', 'double');
insert into Room(number, floor, hotelID, typeName)
values('311', '3', '222', 'double');


############# RESERVATIONS ##############

insert into Reservation(reservationID, checkInDate, checkOutDate, reservationDate, roomNumber, guestID, typeName, hotelID)
values ('1', date('2020-11-01'), date('2020-11-10'), date('2020-11-20'), '20', '1', 'double', '111'); 
insert into Reservation(reservationID, checkInDate, checkOutDate, reservationDate, roomNumber, guestID, typeName, hotelID)
values ('2', '2020-12-02 08:00:00', '2020-12-08 20:00:00', '2020-12-01 10:00:00', '20', '4', 'double', '111');
insert into Reservation(reservationID, checkInDate, checkOutDate, reservationDate, roomNumber, guestID, typeName, hotelID)
values ('3', date('2020-12-20'), date('2020-12-28'), date('2020-12-10'), '21', '1', 'double', '111');
insert into Reservation(reservationID, checkInDate, checkOutDate, reservationDate, roomNumber, guestID, typeName, hotelID)
values ('6', date('2020-10-13'), date('2020-10-16'), date('2020-09-27'), '311', '1', 'double', '222');

############# SERVICES ##############

insert into Service(serviceName, servicePrice) values ('massage', '50');
insert into Service(serviceName, servicePrice) values ('parking', '20');
insert into Service(serviceName, servicePrice) values ('gas fill', '30');


###### SERVICE HAS RESERVATION ######

insert into Service_has_Reservation(serviceName, reservationID) values ('massage','1');
insert into Service_has_Reservation(serviceName, reservationID) values ('parking','2');
insert into Service_has_Reservation(serviceName, reservationID) values ('gas fill','2');


####### PAYMENT #######

insert into Payment(totalPriceForRoom, additionalFee, reservationID) values ('514.9','50','1');
insert into Payment(totalPriceForRoom, additionalFee, reservationID) values ('149.97','50','2');

####### Employee cleans Room #######

insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','20','111', '2020-11-27 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','21','111', '2020-11-27 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','22','111', '2020-11-26 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','21','111', '2020-11-20 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','22','111', '2020-11-25 06:00:00');

insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','20','111', '2020-12-08 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','20','111', '2020-12-08 08:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','21','111', '2020-12-08 06:30:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','22','111', '2020-12-08 00:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','21','111', '2020-12-03 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','22','111', '2020-12-01 06:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','23','111', '2020-12-08 08:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','25','111', '2020-12-07 08:00:00');
insert into Employee_cleans_Room(employeeID, Room_number, Room_hotelID, cleanDateTime)
values ('5','311','111', '2020-12-08 09:30:00');

