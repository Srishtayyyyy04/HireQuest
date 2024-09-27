<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication22.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HireQuest Sign-In</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }
        .overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
    z-index: 1000; /* Ensure it is behind the popup but above the page content */
}
          .containerloginf {
               display: none;
                position: fixed;
                 top: 50%; /* Center vertically */
    left: 50%; /* Center horizontally */
    transform: translate(-50%, -50%); 
/*      position: relative; */
      background-color: #fff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      width: 400px;
       z-index: 1001;
  }

  .close-button {
      position: absolute;
      top: 10px;
      right: 10px;
      font-size: 24px;
      cursor: pointer;
      color: #333;
      transition: color 0.3s;
  }

  .close-button:hover {
      color: #007bff;
  }

  h2 {
      text-align: center;
      margin-bottom: 20px;
  }

  .input-group {
      margin-top: 20px;
      margin-bottom: 15px;
  }

  .input-group label {
      display: block;
      margin-bottom: 5px;
  }

  .input-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      box-sizing: border-box;
  }

  .input-group input:focus {
      outline: none;
      border-color: #007bff;
  }

  button {
      background-color: #020303;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
  }

  button:hover {
      background-color: #0069d9;
  }

  .google-login {
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 3px;
      padding: 10px;
      display: flex;
      align-items: center;
      margin-bottom: 15px;
  }

  .google-login img {
      margin-right: 10px;
  }

  .google-login span {
      font-size: 16px;
      font-weight: bold;
  }

  .forgot-password {
      text-align: right;
      margin-bottom: 10px;
  }

  .register {
      text-align: center;
      margin-top: 20px;
  }

  .register span {
      margin-right: 5px;
  }

  .register a {
      color: #007bff;
      text-decoration: none;
  }

  .tabs {
      display: flex;
      margin-bottom: 0;
      padding: 0;
  }

  .tab {
      flex: 1;
      display: flex;          /* Use flexbox for alignment */
      align-items: center;    /* Center items vertically */
      justify-content: center; /* Center items horizontally */
      padding: 10px 20px;
      border-bottom: 2px solid #ccc;
      cursor: pointer;
      border-radius: 5px 5px 0 0;
      margin: 0;
      transition: all 0.3s ease;
  }

  .tab.active {
      border-bottom-color: #007bff;
      background-color: #f0f0f0;
  }

        header {
            background-color: #fff;
            padding: 20px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000; /* Ensure the header is above other content */
        }

        .logo {
            margin-left: 20px;
        }

        .logo h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }

        nav {
            margin-right: 20px;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            display: inline-block;
            margin-right: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            position: relative;
        }

        nav a::after {
            content: "";
            display: block;
            position: absolute;
            left: 0;
            bottom: -5px;
            width: 100%;
            height: 2px;
            background-color: transparent;
            transition: background-color 0.3s ease;
        }

        nav a:hover::after {
            background-color: #000;
        }

        nav .btn {
            background-color: #0a0b0b;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 80px; /* Adjust for header height */
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .left-section {
            margin-top: -62px;
            padding: 40px;
            width: 400px;
        }
        .left-section h1{
             color: #9d8f8f;
        }
        h1 {
            font-size: 46px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        p {
            font-size: 12px;
            line-height: 1.5;
            margin-bottom: 30px;
        }

        button {
            display: block;
            width: 100%;
            padding: 15px 0;
            border: none;
            border-radius: 4px;
            background-color: #0a66c2;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0752a0;
        }

        .google-button {
            background-color: #fff;
            color: #4285f4;
            border: 1px solid #dadce0;
            margin-bottom: 15px;
        }

        .google-button i {
            margin-right: 10px;
        }

        .right-section {
            margin-left: 210px;
            width: 500px;
            position: relative;
        }

        .image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .text {
            position: absolute;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            color: #fff;
            font-size: 36px;
            font-weight: bold;
        }

        .linkedin-logo {
            position: absolute;
            bottom: 80px;
            right: 50px;
            width: 60px;
            height: 60px;
        }
        p.dumdum{
           
            font-size: 17px;
    margin-left: 80px;
        }
        p.jumjum{
            margin-left: 22px;
        }
        p.jumjum a{
             text-decoration: none;
        }
       p.dumdum a{
           font-weight: bold;
    color: #7a9f3a;
            text-decoration: none;
        }

    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>HireQuest.</h1>
        </div>
        <nav>
            <ul>
                <li><a href="Home.aspx">Home</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <div class="left-section">
            <h1>Welcome to your professional community</h1>
            <p>Connect with people, build your network, and advance your career.</p>
            <button class="google-button">
                <i class="fab fa-google"></i> Login as Candidate/Employer
            </button>
            <p class="jumjum">By clicking Continue to join or sign in, you agree to HireQuest's <a href="#">User Agreement</a>, <a href="#">Privacy Policy</a>, and <a href="#">Cookie Policy</a>.</p>
            <p class="dumdum">New to HireQuest? <a href="RegistrationStudent.aspx">Join now</a></p>
        </div>
        <div class="right-section">
            <img src="cutout.png" alt="LinkedIn Image" class="image">
        </div>
    </div>
    <div class="overlay" id="overlay"></div>
    <div class="containerloginf">
    <div class="close-button" onclick="closeForm()">×</div>
    <h2>Start for free and get attractive offers.</h2>
    <div class="tabs">
        <div class="tab active" data-target="student">Student</div>
        <div class="tab" data-target="employer">Employer / T&P</div>
    </div>

  <form id="loginForm" method="post" action="login.aspx" runat="server" onsubmit="return validateForm()">
       <input type="hidden" name="tab" id="activeTab" value="student" />
        <div id="student" class="form-containerloginf">
            <!-- Student form content -->
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required 
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
                       title="Please enter a valid email address.">
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required 
                       pattern=".{6,}" 
                       title="Password must be at least 6 characters long.">
            </div>

            <div class="forgot-password">
                <!-- Optional: Forgot password link -->
            </div>
            <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red"></asp:Label>
      <asp:Button ID="Button1" runat="server" Text="Login" OnClick="LoginButton_Click" />


            <div class="register">
                <span>New to HireQuest? Register</span> 
                             <a href="RegistrationStudent.aspx">Student</a> / 
<a href="RegistrationCompany.aspx">Company</a>
            </div>
        </div>

        <div id="employer" class="form-containerloginf" style="display: none;">
            <!-- Employer form content (same as Student) -->
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email-employer" name="email" placeholder="Enter your email" required 
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
                       title="Please enter a valid email address.">
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password-employer" name="password" placeholder="Enter your password" required 
                       pattern=".{6,}" 
                       title="Password must be at least 6 characters long.">
            </div>

            <div class="forgot-password">
                <!-- Optional: Forgot password link -->
            </div>
<asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />


            <div class="register">
                <span>New to HireQuest? Register</span> 
                 <a href="RegistrationStudent.aspx">Student</a> / 
    <a href="RegistrationCompany.aspx">Company</a>
            </div>
        </div>
    </form>
</div>
     <script>
         function closeForm() {
             document.querySelector('.containerloginf').style.display = 'none';
         }

         const tabs = document.querySelectorAll('.tab');
         const formcontainerloginfs = document.querySelectorAll('.form-containerloginf');

         tabs.forEach(tab => {
             tab.addEventListener('click', () => {
                 const target = tab.dataset.target;
                 document.getElementById('activeTab').value = target; 

                 tabs.forEach(t => t.classList.remove('active'));
                 tab.classList.add('active');

                 formcontainerloginfs.forEach(containerloginf => {
                     if (containerloginf.id === target) {
                         containerloginf.style.display = 'block';
                     } else {
                         containerloginf.style.display = 'none';
                     }
                 });
             });
         });

         function validateForm() {
             const email = document.getElementById('email')?.value || document.getElementById('email-employer')?.value;
             const password = document.getElementById('password')?.value || document.getElementById('password-employer')?.value;

             // Email regex for validation
             const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
             // Password validation length check
             if (!emailRegex.test(email)) {
                 alert('Please enter a valid email address.');
                 return false;
             }
             if (password.length < 6) {
                 alert('Password must be at least 6 characters long.');
                 return false;
             }
             return true;
         }
         function showForm() {
             document.querySelector('.containerloginf').style.display = 'block';
             document.getElementById('overlay').style.display = 'block';
         }

         function closeForm() {
             document.querySelector('.containerloginf').style.display = 'none';
             document.getElementById('overlay').style.display = 'none';
         }

         document.querySelector('.google-button').addEventListener('click', showForm);
     </script>
</body>
</html>

