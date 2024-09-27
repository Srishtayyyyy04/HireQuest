<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sidebar.aspx.cs" Inherits="WebApplication22.sidebar" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sidebar</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start; /* Align to the left for sidebar */
            align-items: flex-start; /* Align to the top for sidebar */
            height: 100vh;
            background: white;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .sidebar {
            position: relative;
            width: 250px; /* Fixed width for the sidebar */
            background: #f8f9fa; /* Background color for the sidebar */
            border-radius: 20px; /* Rounded corners */
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
            background: green; /* Background color of imgbox */
            transition: height 0.5s;
            z-index: 1; /* Ensure imgbox is below the links */
        }
        .sidebar .item:hover .imgbox {
            height: 100px; /* Expanded imgbox height */
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <div class="logo">
                <span>HireHub.</span>
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
    </form>
</body>
</html>
