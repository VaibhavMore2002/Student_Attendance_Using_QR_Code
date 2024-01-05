<%-- 
    Document   : student_signup
    Created on : 17 November, 2023, 6:31:31 PM
    Author     : Vaibhav-More(MC-I-132)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Student Attendance System</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/templatemo-style.css">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.singlePageNav.min.js"></script>
        <script src="js/typed.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/custom.js"></script>
        <style>
            #tt{
               /* Linear gradient from grey to black with less opacity */
                background: linear-gradient(to left, rgba(30, 30, 30, 0.7), rgba(0, 0, 0, 0.7));
            }
            #year,#gen{
                font-size: 14px;
                color: #333;
                background-color: #fff;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            #year option,#gen option{
                color: #333;
            }
            .error {
                color: red;
            }
        </style>
    </head>
    <body id="top">

        <!-- start preloader -->
        <div class="preloader">
            <div class="sk-spinner sk-spinner-wave">
                <div class="sk-rect1"></div>
                <div class="sk-rect2"></div>
                <div class="sk-rect3"></div>
                <div class="sk-rect4"></div>
                <div class="sk-rect5"></div>
            </div>
        </div>
        <!-- end preloader -->

        <!-- start header -->
        <header>
            <div class="container">
                <div class="row">
                </div>
            </div>
        </header>
        <script>
            $(document).ready(function () {
                $("#bs-example-navbar-collapse-1").find("a:not(.dropdown-toggle)").off("click").off("mousedown");
            });
        </script>
        <script>
            var loadFile = function (event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('output');
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            };
        </script>
        <!-- end header -->

        <!-- start navigation -->
        <nav class="navbar navbar-default templatemo-nav" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand"><i class="fa fa-bars fa-2x"></i></a>
                </div>
                <div class="collapse navbar-collapse" id='bs-example-navbar-collapse-1'>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="Student_login.jsp">Student</a></li>
                        <li><a href="Staff_login.jsp">Staff</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end navigation -->

        <!-- start home -->
        <section id="home">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="wow fadeIn" data-wow-offset="50" data-wow-delay="0.9s">
                            <span id="tt">Student Attendance System Using QR-Code</span></h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- end home -->

        <!-- start about -->
        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="wow bounceIn" data-wow-offset="50" data-wow-delay="0.3s">Student <span>Registration</span></h2>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-offset="50" data-wow-delay="0.9s">
                        <form action="student_reg" method="post" enctype="multipart/form-data">
                            <label>NAME</label>
                            <input type="text" id="fullName" name="username" class="form-control" placeholder="Enter Your Name" required="">
                            <span id="nameError" class="error"></span><br>

                            <label>EMAIL</label>
                            <input id="email" type="email" name="email" class="form-control" placeholder="Enter Your Email" required="">
                            <span id="emailError" class="error"></span><br>
                            <label>DOB</label>
                            <input id="dateob" type="date" name="dob" class="form-control" required="">

                            <label>GENDER</label>
                            <select id="gen" name="gender" class="form-control" required="">
                                <option value="">Select Your Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Others</option>
                            </select>

                            <label>DEPARTMENT</label>
                            <input id="department" type="text" name="dept" class="form-control" placeholder="Enter Your Department" required="">
                            <span id="departmentError" class="error"></span><br>

                            <label>YEAR</label>
                            <select id="year" name="year" class="form-control" required="">
                                <option value="">Select Your Year</option>
                                <option>First</option>
                                <option>Second</option>
                                <option>Third</option>
                                <option>Final</option>
                            </select>

                            <label>PHONE NO</label>
                            <input id="phoneNumber" type="text" name="phone" class="form-control" placeholder="Enter Your Phone No" required="">
                            <span id="phoneError" class="error"></span><br>
                            <label>ADDRESS</label>
                            <input id="address" type="text" name="address" class="form-control" placeholder="Enter Your Address" required>
                            <span id="addressError" class="error"></span><br>
                            <label>PASSWORD</label>
                            <input id="password" type="password" name="pass" class="form-control" placeholder="Enter Your Password" required="">
                            <span id="passwordError" style="color: red;"></span><br>

                            <label>PROFILE</label>
                            <input id="profilePhoto" type="file" name="photo" accept="image/x-png,image/gif,image/jpeg" onchange="loadFile(event)" class="form-control" required="">
                            <span id="photoError" class="error"></span><br>
                            <input onclick="validatePassword()" type="submit" value="Sign Up" class="form-control">
                        </form>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInRight" data-wow-offset="50" data-wow-delay="0.6s">
                        <br>
                        <img src="images/reg.png" width="480" height="530" /><br><br><br><br>
                        <img id="output" src="#" alt="Preview Profile" width="480" height="350" />
                    </div>
                </div>
            </div>
        </section>
        <!-- end about -->

        <!-- end contact -->

        <!-- start copyright -->
        <footer id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p class="wow bounceIn" data-wow-delay="0.3s">
                            &copy; 2023-24</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end copyright -->
        <script>
            function validatePassword() {
                var passwordInput = document.getElementById('password');
                document.getElementById('nameError').textContent = '';
                document.getElementById('emailError').textContent = '';
                document.getElementById('departmentError').textContent = '';
                document.getElementById('phoneError').textContent = '';
                document.getElementById('photoError').textContent = '';
                document.getElementById('addressError').textContent = '';
                //document.getElementById('dobError').textContent='';
                var passwordError = document.getElementById('passwordError');
                var fullName = document.getElementById('fullName').value;
                var email = document.getElementById('email').value;
                var department = document.getElementById('department').value;
                var phoneNumber = document.getElementById('phoneNumber').value;
                var profilePhoto = document.getElementById('profilePhoto').value;
                var address = document.getElementById('address').value;
                //var dob=document.getElementId('dob').value;
                // Reset the error message
                passwordError.textContent = '';
                // Check password length
                    // Validation for Full Name (only letters, spaces, or hyphens)
                if (!/^[A-Za-z\s\-]+$/.test(fullName)) {
                    document.getElementById('nameError').textContent = 'Please enter a valid name.';
                    return;
                }

                // Validation for Email
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    document.getElementById('emailError').textContent = 'Please enter a valid email address.';
                    return;
                }
                // Validation for Department (not empty)
                if (!/^[A-Za-z\s\-]+$/.test(department)) {
                    document.getElementById('departmentError').textContent = 'Please enter a valid department name (letters, spaces, or hyphens only).';
                    return;
                }

                // Validation for Phone Number (10 digits)
                if (!/^\d{10}$/.test(phoneNumber)) {
                    document.getElementById('phoneError').textContent = 'Please enter a valid 10-digit phone number.';
                    return;
                }
                if (!address.trim()) {
                    document.getElementById('addressError').textContent = 'Please enter your address.';
                    return;
                }
                if (passwordInput.value.length < 8) {
                    passwordError.textContent = 'Password must be at least 8 characters long.';
                    return;
                }
                // Check for at least one uppercase letter
                if (!/[A-Z]/.test(passwordInput.value)) {
                    passwordError.textContent = 'Password must contain at least one uppercase letter.';
                    return;
                }
                // Check for at least one lowercase letter
                if (!/[a-z]/.test(passwordInput.value)) {
                    passwordError.textContent = 'Password must contain at least one lowercase letter.';
                    return;
                }
                // Check for at least one digit
                if (!/\d/.test(passwordInput.value)) {
                    passwordError.textContent = 'Password must contain at least one digit.';
                    return;
                }
                // Check for at least one special character
                if (!/[!@#$%^&*(),.?":{}|<>]/.test(passwordInput.value)) {
                    passwordError.textContent = 'Password must contain at least one special character.';
                    return;
                }
                if (!profilePhoto) {
                    document.getElementById('photoError').textContent = 'Please upload a profile photo.';
                    return;
                }
               
                // If all criteria are met, the password is valid
                alert('Remember your Password !');
            }
            
            </script>
    </body>
</html>
