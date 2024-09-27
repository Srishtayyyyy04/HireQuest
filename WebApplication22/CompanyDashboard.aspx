<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyDashboard.aspx.cs" Inherits="WebApplication22.CompanyDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link rel="stylesheet" href="CompanyDash.css">
    <style>
        .sidebar {
  
    margin-left: -11px;
    margin-top: -16px;
    height: 741px;
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
.gif-render {
    margin: 20px auto; /* Center it, adjust as necessary */
    display: block; /* Ensures it behaves like a block element */
    height: 200px; /* Set specific height or width as needed */
    /* Additional styles to customize */
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
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
            <div class="content-container">
                <div class="header-container">
                    <h1>Hello Recruiter!</h1>
                    <img src="headerimg.gif" alt="Recruitment" class="header-image" />
                </div>
                <div class="calendar-container">
                     <h2>Calendar</h2>
    <div id="calendar"></div>
    <script>
        function generateCalendar(year, month) {
            // Get the calendar container
            const calendarEl = document.getElementById('calendar');

            // Create table elements
            const table = document.createElement('table');
            const headerRow = table.insertRow();

            // Add month and year header
            const monthYearHeader = document.createElement('th');
            monthYearHeader.colSpan = 7; // Span across all columns
            monthYearHeader.textContent = new Date(year, month).toLocaleString('default', { month: 'long', year: 'numeric' });
            headerRow.appendChild(monthYearHeader);

            // Add day names header
            const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            const dayNameRow = table.insertRow();
            daysOfWeek.forEach(day => {
                const dayHeader = document.createElement('th');
                dayHeader.textContent = day;
                dayNameRow.appendChild(dayHeader);
            });

            // Get the first day of the month
            const firstDay = (new Date(year, month)).getDay();

            // Get the number of days in the month   code for another gif:  <div class="gif-content"> <img src="ff.gif" alt="Loading GIF" class="gif-render" /> </div>
            const daysInMonth = new Date(year, month + 1, 0).getDate();

            // Keep track of the current day
            let date = 1;

            // Generate calendar rows and cells
            for (let i = 0; i < 6; i++) { // 6 weeks maximum on a calendar
                const row = table.insertRow();

                for (let j = 0; j < 7; j++) {
                    const cell = row.insertCell();

                    if (i === 0 && j < firstDay) {
                        // Add empty cells before the first day of the month
                        cell.textContent = '';
                    } else if (date > daysInMonth) {
                        // Stop adding cells after the last day of the month
                        break;
                    } else {
                        // Add day number to the cell
                        cell.textContent = date;

                        // Highlight today's date
                        const today = new Date();
                        if (date === today.getDate() &&
                            month === today.getMonth() &&
                            year === today.getFullYear()) {
                            cell.classList.add('today');
                        }

                        date++;
                    }
                }
            }

            // Clear previous calendar and add the new one
            calendarEl.innerHTML = '';
            calendarEl.appendChild(table);
        }

        // Initial calendar display (current month)
        const today = new Date();
        generateCalendar(today.getFullYear(), today.getMonth());
    </script>

</div>
          
                <div class="hire-container"> 
    <h2>You need to hire</h2>
    <div class="card-container">
        <div class="card-row">
             <a href="SearchStu.aspx" class="card">3 Content Writers</a>
              <a href="SearchStu.aspx"class="card">2 Node.js Developers</a>
        </div>
        <div class="card-row">
              <a href="SearchStu.aspx" class="card">1 UI Designer</a>
              <a href="SearchStu.aspx" class="card">2 Accountants</a>
        </div>
    </div>
</div>

                <div class="table-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="styled-grid">
                        <Columns>
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>

                </div>
                     
                
            </div>
        </div>
    </form>
</body>
</html>
