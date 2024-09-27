<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing_page.aspx.cs" Inherits="WebApplication22.Landing_page" %>
 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HireQuest</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-color: #ffffff;
            color: #333;
        }
 
        .sidebar {
            width: 294px; /* Initial sidebar width */
            height: 100vh; /* Full viewport height */
            background-color: black; /* Sidebar color */
            position: fixed;
            left: -1px;
            top: -8px;
            transition: width 0.3s ease; /* Smooth transition */
        }
 
        .profile-container {
            display: none; /* Hidden by default */
            padding: 20px;
            background-color: white;
            color: black;
            margin-left: 300px; /* Adjust to show next to sidebar */
            position: absolute;
            top: 0;
            left: 0;
            width: calc(100% - 300px - 250px); /* Adjust for new right container */
            height: 250%; /* Full height */
            z-index: 10;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
 
        .search-jobs-container {
            background-color: #f9f9f9; /* Light background for contrast */
            padding: 2rem; /* Add padding for spacing */
            border-radius: 0.5rem; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }
 
        .right-container {
            display: none; /* Hidden by default */
            position: absolute;
            top: 0;
            right: 0;
            width: 300px; /* Width for the right container */
            height: 250%; /* Full height */
            padding: 20px;
            background-color: #f9f9f9; /* Background color */
            z-index: 10;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
 
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
 
        .container {
            max-width: 1131px;
            margin: 36px auto;
            padding: 20px;
        }
 
        header {
            background-color: white;
            padding: 20px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
 
        .hero {
            position: relative;
            background-color: #fff;
            padding: 40px 0;
        }
 
        .search-bar {
            margin-left: 25px;
            display: flex;
            gap: 10px; 
        }
 
        .search-bar input {
            flex: 2; 
            padding: 10px;
            border: 1px solid #eee;
            border-radius: 5px;
            margin-bottom: 0; 
        }
 
        .search-bar select {
            flex: 1; 
            padding: 10px;
            border: 1px solid #eee;
            border-radius: 5px;
            margin-bottom: 0; /* Remove bottom margin */
        }
 
        .search-bar button {
            flex: 1; /* Same as select for consistency */
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #0a0b0b;
            color: #fff;
            cursor: pointer;
        }
 
        .jobs {
            background-image: url('/bgimgsj.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire section */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent repeating */
            padding: 40px 0;
            text-align: center; /* Center the text */
            color: white; /* Change text color for contrast */
        }
 
        .jobs h2 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }
 
        .jobs p {
            font-size: 18px;
            line-height: 1.5;
            margin-bottom: 30px;
        }
 
        .jobs-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center job cards */
        }
 
        .job-card {
            width: 30%; /* Adjusted width for better alignment */
            padding: 20px;
            border: 1px solid rgba(255, 255, 255, 0.3); /* Slightly visible border */
            border-radius: 5px;
            margin: 10px; /* Added margin for spacing */
            display: flex; /* Use flexbox for centering */
            flex-direction: column; /* Stack items vertically */
            align-items: center; /* Center items horizontally */
            text-align: center; /* Center text */
            background-color: rgba(0, 0, 0, 0.7); /* Black with 70% opacity */
        }
 
        .job-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px; /* Space between icon and text */
        }
 
        .job-icon img {
            max-width: 30px;
            height: auto;
        }
 
        .job-info {
            float: left;
            width: calc(100% - 60px);
        }
 
        .job-info h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 5px;
        }
 
        .job-info p {
            font-size: 16px;
            color: #888;
        }
 
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
 
        .apply-btn {
            background-color: #0a0b0b;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px; /* Space between the job description and button */
        }
 
        .apply-btn:hover {
            background-color: #333; /* Darker on hover */
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
 
    <section class="hero">
<div class="search-bar">
<input type="text" id="positionInput" name="positionInput" placeholder="Search by company or role..." runat="server" />
<select id="locationSelect" name="locationSelect">
<option value="">Location</option>
</select>
<button id="searchButton" class="btn" runat="server" onserverclick="SearchButton_Click">Search</button>
</div>
</section>
 
    <section class="jobs">
<div class="container">
<h2>Finding Jobs at an ease...</h2>
<div class="jobs-grid">
<asp:Repeater ID="jobsRepeater" runat="server">
<ItemTemplate>
<div class="job-card">
<div class="job-icon">
<img src='<%# Eval("IconUrl") %>' alt="Job Icon">
</div>
<div class="job-info">
<h3><%# Eval("Position") %></h3>
<p><%# Eval("Company") %></p>
<p><%# Eval("Location") %></p>
<p><%# Eval("SalaryRange") %></p>
<p><%# Eval("JobDescription") %></p>
<a href='<%# Eval("CompanyWebsite") %>' target="_blank" class="apply-btn">Apply</a>
</div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
</section>
 
    <footer>
<div class="container">
<p>Copyright © 2024 HireQuest. All rights reserved.</p>
</div>
</footer>
</body>
</html>