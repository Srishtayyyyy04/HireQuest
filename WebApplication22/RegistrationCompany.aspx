<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationCompany.aspx.cs" Inherits="WebApplication22.Registration" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hire Interns & Freshers Faster</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Allow footer to be positioned below the content */
            min-height: 100vh; /* Ensure the body takes full height of the viewport */
            background: linear-gradient(to right, #f0ffff, #e0ffff);
        }
          footer {
      background-color: #333;
      color: #fff;
      padding: 20px 0;
      text-align: center;
  }
        .biggercontainer {
            display: flex;
            width: 100%;
            height: auto; /* Adjusted height to fit content */
            flex: 1; /* Allow it to expand and push the footer down */
        }

        .left-section, .right-section {
            flex: 1;
            padding: 20px;
        }

        .left-section {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .right-section {
            background: linear-gradient(to right, #f0ffff, #e0ffff);
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            margin-top: 9px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="email"], input[type="password"], input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            padding: 15px 30px; /* Increased padding */
            font-size: 18px; /* Increased font size */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: inline-block;
            text-align: center;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .text-center {
            text-align: center;
            margin-top: 20px;
        }

        .login-link {
            color: #007bff;
            text-decoration: none;
        }
        
        img {
            height: 418px;
            margin-left: 67px;
        }

        .footercontainer {
            background: linear-gradient(to right, #f0ffff, #e0ffff);
            text-align: center; /* Center the footer content */
            box-sizing: border-box; /* Ensure padding is included in the width */
        }
    </style>
</head>
<body>
    <div class="biggercontainer">
        <div class="right-section">
            <h1>Hire Interns & Freshers <span style="color: #007bff;">faster</span></h1>
            <p style="text-align: center;">Post Internships for Free & Hire Talent with up to 2 Years of Experience</p>
            <div class="imgbg">
                <img src="log des2.png" alt="Example Image"/>
            </div>
        </div>
        <div class="left-section">
            <div class="container">
                <form id="registrationForm" runat="server">
                    <div class="form-group">
                        <label for="firstname">Company Name</label>
                        <asp:TextBox ID="firstname" runat="server" CssClass="form-control" Placeholder="Your First Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstname" ErrorMessage="Name cannot be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="lastname">Address</label>
                        <asp:TextBox ID="lastname" runat="server" CssClass="form-control" Placeholder="Your Last Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastname" ErrorMessage="Address cannot be empty!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="mobilenumber">Mobile Number</label>
                        <div style="display: flex;">
                            <asp:TextBox ID="mobilenumber" runat="server" CssClass="form-control" Placeholder="Enter mobile number" Style="width: 80%; margin-right: 10px;"></asp:TextBox>
                            <input type="text" value="+91" readonly style="width: 20%;" />
                            <br />
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="mobilenumber" ErrorMessage="Incorrect phone format!" ForeColor="Red"  ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Official Email Id</label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" Placeholder="name@company.com"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Incorrect email format!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Minimum 6 characters"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="password" ErrorMessage="Invalid password!" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <asp:TextBox ID="confirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm your password"></asp:TextBox>
                        <asp:CompareValidator 
                            ControlToCompare="password" 
                            ControlToValidate="confirmPassword" 
                            ID="CompareValidator1" 
                            runat="server" 
                            ErrorMessage="Passwords do not match." 
                            ForeColor="Red" 
                            Display="Dynamic" />
                    </div>
                    <div class="text-center">
                        <asp:Button ID="submitButton" runat="server" CssClass="btn-primary" Text="Post for Free" OnClick="SubmitButton_Click" />
                        <p style="margin-top: 10px;">Already registered? <a href="login.aspx" class="login-link">Login</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footercontainer">
         <footer>
         <p>Copyright © 2024 HireQuest. All rights reserved.</p>
 </footer>
    </div>
</body>
</html>

