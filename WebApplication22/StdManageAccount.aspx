<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StdManageAccount.aspx.cs" Inherits="WebApplication22.StdManageAccount" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Job Seeker Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('tvs_img.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 20px;
            color: white;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: black;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: black;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background-color: #4cae4c;
        }
        .checkbox-label {
            color: black;
        }
    </style>
</head>
<body>
    <form id="profileForm" runat="server">
        <div class="container">
            <h1>Job Seeker Profile</h1>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <h2>Personal Information</h2>
            <label for="name">Name:</label>
            <asp:TextBox ID="name" runat="server" />
            <label for="email">Email:</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" />
            <label for="phone">Phone:</label>
            <asp:TextBox ID="phone" runat="server" />
            
            <h2>Resume Upload</h2>
            <label for="resume">Upload Resume:</label>
            <asp:FileUpload ID="resume" runat="server" />
            
            <h2>Skills and Qualifications</h2>
            <asp:TextBox ID="skills" runat="server" TextMode="MultiLine" />
            
            <h2>Work Experience</h2>
            <asp:TextBox ID="experience" runat="server" TextMode="MultiLine" />
            
            <h2>Education</h2>
            <asp:TextBox ID="education" runat="server" TextMode="MultiLine" />
            
            <h2>Job Preferences</h2>
            <label for="jobTitle">Desired Job Title:</label>
            <asp:TextBox ID="jobTitle" runat="server" />
            <label for="location">Location Preference:</label>
            <asp:TextBox ID="location" runat="server" />
            <label for="salary">Salary Expectation:</label>
            <asp:TextBox ID="salary" runat="server" TextMode="Number" />
            <label for="employmentType">Employment Type:</label>
            <asp:DropDownList ID="employmentType" runat="server">
                <asp:ListItem Value="Full-time">Full-time</asp:ListItem>
                <asp:ListItem Value="Part-time">Part-time</asp:ListItem>
                <asp:ListItem Value="Freelance">Freelance</asp:ListItem>
            </asp:DropDownList>
            
            <h2>Privacy Settings</h2>
            <label class="checkbox-label" for="profileVisibility">
                <asp:CheckBox ID="profileVisibility" runat="server" Text="Make profile searchable by employers" />
            </label>
            
            <asp:Button ID="btnSave" runat="server" Text="Save Profile" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
