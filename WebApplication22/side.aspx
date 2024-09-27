<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="side.aspx.cs" Inherits="WebApplication22.side" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jobie Hover Effect</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #663399;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }

        .container {
            background-color: #663399;
            border-radius: 20px;
            padding: 20px;
            width: 300px;
            color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        .logo {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .logo img {
            width: 50px;
            height: 50px;
        }

        .logo h1 {
            margin-left: 10px;
            font-size: 24px;
            font-weight: bold;
        }

        .menu {
            list-style: none;
            padding: 0;
        }

        .menu li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .menu li:hover {
            background-color: #9966CC;
            border-radius: 10px;
            padding: 10px 15px;
        }

        .icon {
            margin-right: 15px;
        }

        .text {
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="logo.png" alt="Jobie Logo">
            <h1>Jobie</h1>
        </div>
        <ul class="menu">
            <li>
                <span class="icon"><i class="fas fa-home"></i></span>
                <span class="text">Dashboard</span>
            </li>
            <li>
                <span class="icon"><i class="fas fa-search"></i></span>
                <span class="text">Search Job</span>
            </li>
            <li>
                <span class="icon"><i class="fas fa-puzzle-piece"></i></span>
                <span class="text">Applications</span>
            </li>
            <li>
                <span class="icon"><i class="fas fa-comments"></i></span>
                <span class="text">Message</span>
            </li>
            <li>
                <span class="icon"><i class="fas fa-chart-pie"></i></span>
                <span class="text">Statistics</span>
            </li>
            <li>
                <span class="icon"><i class="fas fa-newspaper"></i></span>
                <span class="text">News</span>
            </li>
        </ul>
    </div>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit-id.js" crossorigin="anonymous"></script>
</body>
</html>
