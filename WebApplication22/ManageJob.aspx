<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageJob.aspx.cs" Inherits="WebApplication22.ManageJob" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom style to center content */
        .table-center td, .table-center th {
            text-align: center;
        }
        table#gvStudents.table.w-full.table-center {
            margin-top: 2rem;
        }
        .header-container {
            border-radius: 20px;
            margin-left: 22px;
            height: 93px;
            margin-top: -6px;
            background-color: #4c4545;
            display: flex;
            align-items: center;
            padding: 20px;
        }

        .header-container h1 {
            font-weight: bolder;
            font-size: 2rem;
            flex: 1;
            margin: 0;
            color: white;
        }
        
        .header-image {
            margin-top: -36px;
            max-width: 16%;
            height: auto;
            margin-left: -387px;
        }
        
        .container i {
            margin-top: -10px;
            margin-left: -6rem;
            cursor: pointer; /* Change cursor to pointer */
        }

        .sidebar {
            height: 100%; /* Full height */
            position: fixed; /* Fixed position */
            left: -250px; /* Initially hidden */
            width: 250px; /* Fixed width for the sidebar */
            background: #f8f9fa; /* Background color for the sidebar */
            border-radius: 20px; /* Rounded corners */
            box-shadow: 0 20px 25px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            padding: 10px;
            transition: left 0.5s; /* Smooth transition */
            z-index: 1000; /* Ensure sidebar is on top */
        }
        
        .sidebar.active {
            left: 0; /* Show sidebar when active */
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
    <script src="https://kit.fontawesome.com/345b6457cc.js" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const sidebar = document.querySelector('.sidebar');
            const toggleIcon = document.querySelector('.header-icon');

            toggleIcon.addEventListener('click', function () {
                sidebar.classList.toggle('active');
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mx-auto p-4 mt-4">
            <i class="fa-solid fa-bars-progress header-icon fa-2x"></i>
            <div class="header-container">
                <h1>Hello Recruiter!</h1>
                <img src="headerimg.gif" alt="Recruitment" class="header-image" />
            </div>
            <div class="overflow-x-auto">
                <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="table w-full table-center">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <!-- Content for the first cell -->
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                        <asp:BoundField DataField="Skillset" HeaderText="Skillset" />
                        <asp:BoundField DataField="Experience" HeaderText="Experience" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass='<%# "badge " + Eval("Status").ToString().ToLower().Replace(" ", "-") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnReject" runat="server" Text="Reject" CommandArgument='<%# Eval("Id") %>' OnClick="btnReject_Click" CssClass="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
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
    </form>
</body>
</html>
