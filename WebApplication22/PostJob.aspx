<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="WebApplication22.PostJob" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="PostJob.css">
    <style>
                .sidebar {
  
    margin-left: -11px;
    margin-top: -16px;
   height: 60rem;
    position: relative;
    width: 250px;
    background: #f8f9fa;
    border-radius: 20px;
    box-shadow: 0 20px 25px rgba(0, 0, 0, 0.25);
    overflow: hidden;
    padding: 10px;
    transition: 0.5s;
}
.sidebar .item {
    position: relative;
    width: 100%;
    height: 60px; /* Initial height of the item */
    background: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
    border-radius: 20px;
    margin: 10px 0; /* Spacing between items */
    overflow: hidden;
    transition: height 0.5s, box-shadow 0.5s, background 0.5s;
}
.sidebar .item:hover {
    height: 120px; /* Expanded height on hover */
    box-shadow: 0 20px 25px rgba(0, 0, 0, 0.25);
    background: transparent; /* Make item transparent on hover */
}
.sidebar .item .imgbox {
    position: relative;
    width: 100%;
    height: 60px; /* Match item height */
   background-color: #4c4545;
    transition: height 0.5s;
    z-index: 1; /* Ensure imgbox is below the links */
}
.sidebar .item:hover .imgbox {
    height: 100px; /* Expanded imgbox height */
}
.gif-loading{
    margin-left: 110px;
   margin-top: -14px;
   height: 36rem;
}
.sidebar .item .imgbox::before {
    content: '';
    position: absolute;
    bottom: -40px;
    width: 100%;
    height: 80px;
    border-radius: 20px;
    background: #fff;
    transition: 0.5s;
    z-index: -1; /* Ensure the before pseudo-element is below the links */
}
.sidebar .item:hover .imgbox::before {
    bottom: -60px; /* Move down on hover */
}
.sidebar .item .imgbox::after {
    content: '';
    position: absolute;
    right: 0;
    bottom: 40px;
    width: 80px;
    height: 80px;
    background: transparent;
    border-radius: 50%;
    box-shadow: 75px 70px 0 40px #fff;
    transition: 0.5s;
}
.sidebar .item:hover .imgbox::after {
    bottom: 60px; /* Move up on hover */
}
.sidebar .logo {
    padding: 20px;
    font-size: 24px;
    font-weight: bold;
    color: #333;
    text-align: center;
}
.sidebar a {
    position: absolute; /* Position the links absolutely within their item */
    left: 0;
    right: 0;
    top: 80px;
    padding: 10px 15px;
    color: #333;
    text-decoration: none;
    opacity: 0; /* Initially hidden */
    transition: opacity 0.3s;
    z-index: 2; /* Ensure links are above other elements */
}
.sidebar .item:hover a {
    opacity: 1; /* Show links on item hover */
}
.sidebar .item a:hover {
   background: white; /* Background change on hover */
    color: #007BFF; /* Change text color on hover */
}
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  
</head>
<body>
                 <div class="sidebar">
    <div class="logo">
        <span>HireQuest.</span>
    </div>
    <div class="item">
        <div class="imgbox"></div>
        <a href="CompanyDashboard.aspx">Dashboard</a>
    </div>
    <div class="item">
        <div class="imgbox"></div>
        <a href="SearchStu.aspx">Search Student</a>
    </div>
    <div class="item">
        <div class="imgbox"></div>
        <a href="PostJob.aspx">Post Job</a>
    </div>
    <div class="item">
        <div class="imgbox"></div>
        <a href="ManageJob.aspx">Manage Job</a>
    </div>
    <div class="item">
        <div class="imgbox"></div>
        <a href="Messages.aspx">Messages</a>
    </div>
</div>

    <div class="form-container">
        <form id="form1" runat="server" class="form">
            <h2>Post a Job</h2>
            <div>
                <label>Position:</label>
                <asp:TextBox ID="Position" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Company Name:</label>
                <asp:TextBox ID="CompanyName" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Location:</label>
                <asp:TextBox ID="Location" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Username:</label>
                <asp:TextBox ID="Username" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Password:</label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Mobile Phone:</label>
                <asp:TextBox ID="MobilePhone" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Address:</label>
                <asp:TextBox ID="Address" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Email:</label>
                <asp:TextBox ID="Email" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Job Description:</label>
                <asp:TextBox ID="JobDescription" runat="server" TextMode="MultiLine" required="required" CssClass="form-input" />
            </div>

            <div>
                <label>Skills:</label>
                <asp:TextBox ID="Skills" runat="server" required="required" CssClass="form-input" />
            </div>

            <div>
                <asp:Button ID="PostJobButton" runat="server" Text="Post Job" OnClick="PostJobButton_Click" />
            </div>
        </form>
    </div>
</body>
</html>
