<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calender.aspx.cs" Inherits="WebApplication22.calender" %>

<!DOCTYPE html>
<html>
<head>
  <title>Calendar</title>
  <style>
    /* Basic Calendar Styling */
    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      text-align: center;
      padding: 10px;
      border: 1px solid #ddd;
    }

    th {
      background-color: #f2f2f2;
    }

    .today {
      background-color: #f0f0f0;
    }

    /* Optional: Add rounded corners to the table */
    table {
      border-radius: 5px;
    }
  </style>
</head>
<body>

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

    // Get the number of days in the month
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

</body>
</html>
