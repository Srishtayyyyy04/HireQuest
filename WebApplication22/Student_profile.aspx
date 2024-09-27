<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_profile.aspx.cs" Inherits="WebApplication22.Student_profile" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Standard Page</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<style>
        body {
            margin: 0;
            padding: 0;
        }
 
        .sidebar {
            width: 294px;
            height: 100vh;
            background-color: black;
            position: fixed;
            left: 0;
            top: 0;
            transition: width 0.3s ease;
        }
 
        .profile-container,
        .search-jobs-container {
            display: none; /* Hidden by default */
            padding: 20px;
            background-color: white;
            color: black;
            margin-left: 300px;
            position: absolute;
            top: 0;
            left: 0;
            width: calc(100% - 300px - 300px); /* Adjust width for right container */
            height: 100%; /* Full height */
            z-index: 10;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
 
        .right-container {
            display: none; /* Hidden by default */
            position: fixed;
            right: 0;
            top: 0;
            width: 300px;
            height: 100%; /* Full height */
            padding: 20px;
            background-color: #f9f9f9;
            z-index: 10;
        }
 
        .message {
            display: none; /* Hidden by default */
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }
 
        .success {
            background-color: #d4edda;
            color: #155724;
        }
 
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
</style>
<script>
        function toggleProfile() {
            document.getElementById("profileContainer").style.display = 'block';
            document.getElementById("searchJobsContainer").style.display = 'none';
            document.getElementById("rightContainer").style.display = 'block'; // Show right container
        }
 
        function toggleSearchJobs() {
            document.getElementById("searchJobsContainer").style.display = 'block';
            document.getElementById("profileContainer").style.display = 'none';
            document.getElementById("rightContainer").style.display = 'none'; // Hide right container
        }
 
        function updateProfileImage(event) {
            const image = document.getElementById("profileImage");
            image.src = URL.createObjectURL(event.target.files[0]);
        }
 
        function showFileInput() {
            const fileInput = document.getElementById("profileImageInput");
            fileInput.style.display = 'block'; // Show the file input
            fileInput.focus(); // Set focus on the file input
        }
 
        function addSkill() {
            const skillsContainer = document.getElementById('skillsContainer');
            const newSkillDiv = document.createElement('div');
 
            newSkillDiv.innerHTML = `
<label class="block mb-2 text-gray-700 font-semibold">Skill</label>
<input type="text" name="skills[]" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Enter new skill">
            `;
 
            skillsContainer.appendChild(newSkillDiv);
        }
 
        function saveProfile(event) {
            event.preventDefault(); // Prevent default form submission
 
            const formData = new FormData(document.getElementById("form1"));
 
            fetch("Student_profile.aspx", {
                method: "POST",
                body: formData
            })
                .then(response => response.text())
                .then(result => {
                    const messageContainer = document.getElementById("messageContainer");
                    messageContainer.style.display = 'block';
                    if (result.includes("success")) {
                        messageContainer.className = 'message success';
                        messageContainer.innerText = 'Profile saved successfully!';
                    } else {
                        messageContainer.className = 'message error';
                        messageContainer.innerText = 'An error occurred: ' + result;
                    }
                })
                .catch(error => {
                    const messageContainer = document.getElementById("messageContainer");
                    messageContainer.style.display = 'block';
                    messageContainer.className = 'message error';
                    messageContainer.innerText = 'An unexpected error occurred: ' + error.message;
                });
        }
</script>
</head>
<body class="bg-gray-100 font-sans">
 
    <form id="form1" method="post" action="Student_profile.aspx" runat="server" onsubmit="saveProfile(event)">
<div style="margin-left: 260px;">
 
            <div class="sidebar">
<div class="sidebar-content p-6 text-white">
<asp:Label ID="Label1" runat="server" Text="Hi Student!"></asp:Label>
<br />
<asp:Label ID="Label2" runat="server" Text="Let's get you started!"></asp:Label>
<br />
<asp:Button ID="Button2" runat="server" Text="Profile" class="mt-3 w-full bg-blue-500 hover:bg-blue-600 text-white rounded-md p-3" OnClientClick="toggleProfile(); return false;" />
<a href="Landing_page.aspx" class="mt-3 w-full bg-blue-500 hover:bg-blue-600 text-white rounded-md p-3 block text-center">Search Jobs</a>
                    <a href="StdManageAccount.aspx" class="mt-3 w-full bg-blue-500 hover:bg-blue-600 text-white rounded-md p-3 block text-center">Manage Account</a>
</div>
</div>
 
            <!-- Profile Container -->
<div id="profileContainer" class="profile-container">
<div class="container mx-auto px-7 py-9">
<div class="bg-white rounded-lg shadow-md p-6">
<h2 class="text-xl font-semibold text-gray-800 mb-6">Profile Information</h2>
 
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
<div>
<label for="firstName" class="block mb-2 text-gray-700 font-semibold">First Name</label>
<input type="text" id="firstName" name="firstName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label for="middleName" class="block mb-2 text-gray-700 font-semibold">Middle Name</label>
                        <input type="text" id="middleName" name="middleName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label for="lastName" class="block mb-2 text-gray-700 font-semibold">Last Name</label>
<input type="text" id="lastName" name="lastName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
</div>
 
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
<div>
<label for="username" class="block mb-2 text-gray-700 font-semibold">Username</label>
<input type="text" id="username" name="username" value="davidheree" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label for="password" class="block mb-2 text-gray-700 font-semibold">Password</label>
<input type="password" id="password" name="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
<button type="button" class="mt-2 px-4 py-2 rounded-md bg-gray-300 text-gray-800 hover:bg-gray-400">SHOW</button>
</div>
</div>
 
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
<div>
<label for="rePassword" class="block mb-2 text-gray-700 font-semibold">Re-Type Password</label>
<input type="password" id="rePassword" name="rePassword" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
<button type="button" class="mt-2 px-4 py-2 rounded-md bg-gray-300 text-gray-800 hover:bg-gray-400">SHOW</button>
</div>
</div>
 
            <div class="mt-8">
<h2 class="text-xl font-semibold text-gray-800 mb-6">CONTACT</h2>
<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
<div>
<label for="mobilePhone" class="block mb-2 text-gray-700 font-semibold">Mobile Phone</label>
<input type="text" id="mobilePhone" name="mobilePhone" value="+91" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label for="whatsapp" class="block mb-2 text-gray-700 font-semibold">WhatsApp</label>
<input type="text" id="whatsapp" name="whatsapp" value="+91" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label for="email" class="block mb-2 text-gray-700 font-semibold">Email</label>
<input type="email" id="email" name="email" value="yourmail@domain.com" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
</div>
</div>
 
            <div class="mt-8">
<h2 class="text-xl font-semibold text-gray-800 mb-6">SKILLS</h2>
<div id="skillsContainer" class="grid grid-cols-1 md:grid-cols-2 gap-6">
<!-- Existing Skills -->
<div>
<label class="block mb-2 text-gray-700 font-semibold">Programming</label>
<input type="text" name="skills[]" value="Programming" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label class="block mb-2 text-gray-700 font-semibold">UI Design</label>
<input type="text" name="skills[]" value="UI Design" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
</div>
 
                <div class="mt-4">
<button type="button" onclick="addSkill()" class="px-4 py-2 rounded-md bg-blue-500 text-white hover:bg-blue-600">+ Add New Skills</button>
</div>
</div>
 
            <div class="mt-8">
<h2 class="text-xl font-semibold text-gray-800 mb-6">WORK EXPERIENCE</h2>
<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
<div>
<label class="block mb-2 text-gray-700 font-semibold">Company Name</label>
<input type="text" name="companyName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div>
<label class="block mb-2 text-gray-700 font-semibold">Position</label>
<input type="text" name="position" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
</div>
<div class="mt-4">
<label class="block mb-2 text-gray-700 font-semibold">Start Date</label>
<input type="date" name="startDate" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
<div class="mt-4">
<label class="block mb-2 text-gray-700 font-semibold">End Date</label>
<input type="date" name="endDate" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
</div>
</div>
 
            <div class="mt-8">
<button type="submit" class="px-4 py-2 rounded-md bg-blue-500 text-white hover:bg-blue-600">Save Profile</button>
</div>
 
            <!-- Message Container -->
<div id="messageContainer" class="message" style="display: none;"></div>
</div>
</div>
</div>
 
<!-- Search Jobs Container -->
<div id="searchJobsContainer" class="search-jobs-container" runat="server">
<div class="container mx-auto px-7 py-9">
<h2 class="text-xl font-semibold text-gray-800 mb-6">Available Jobs</h2>
<asp:GridView ID="JobsGridView" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200">
<Columns>
<asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
<asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
<asp:BoundField DataField="Salary" HeaderText="Salary" />
<asp:BoundField DataField="JobDescription" HeaderText="Description" />
<asp:BoundField DataField="JobLocation" HeaderText="Location" />
<asp:TemplateField>
<ItemTemplate>
<button class="mt-2 px-4 py-2 rounded-md bg-blue-500 text-white hover:bg-blue-600">Apply Now</button>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
</div>
    <!-- Right Container -->
<div id="rightContainer" class="right-container">
<div class="flex flex-col items-center">
<img id="profileImage" src="profileimg.jpg" alt="Profile" class="rounded-full w-32 h-32 mb-4 cursor-pointer" onclick="showFileInput()">
<h3 class="text-lg font-semibold text-gray-800">Tushar Girdhar</h3>
<h4 class="text-lg font-semibold text-gray-400">IT Programmer</h4>
 
                    <input type="file" id="profileImageInput" style="display: none;" accept="image/*" onchange="updateProfileImage(event)">
<div id="fileInputContainer" class="mt-2" style="display: none;">
<label class="text-sm text-gray-600">Choose a new profile image</label>
</div>
 
                    <div class="mt-4 w-full">
<h4 class="text-sm font-semibold text-gray-600 mb-2">Connect with me:</h4>
<ul class="space-y-2">
<li>
<label for="linkedin" class="block mb-2 text-gray-700 font-semibold">LinkedIn:</label>
<input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="LinkedIn URL">
</li>
<li>
<label for="twitter" class="block mb-2 text-gray-700 font-semibold">Twitter:</label>
<input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Twitter URL">
</li>
<li>
<label for="github" class="block mb-2 text-gray-700 font-semibold">GitHub:</label>
<input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="GitHub URL">
</li>
<li>
<label for="facebook" class="block mb-2 text-gray-700 font-semibold">Facebook:</label>
<input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Facebook URL">
</li>
<li>
<label for="instagram" class="block mb-2 text-gray-700 font-semibold">Instagram:</label>
<input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Instagram URL">
</li>
</ul>
</div>
</div>
</div>
</div>
 
    </form>
 
    <script>
        function saveProfile(event) {
            event.preventDefault(); // Prevent default form submission

            const formData = new FormData(document.getElementById("form1"));

            fetch("Student_profile.aspx/SaveProfile", {
                method: "POST",
                body: formData,
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json; charset=utf-8'
                }
            })
                .then(response => response.json())
                .then(result => {
                    const messageContainer = document.getElementById("messageContainer");
                    messageContainer.style.display = 'block';
                    if (result.d === "success") {
                        messageContainer.className = 'message success';
                        messageContainer.innerText = 'Profile saved successfully!';
                    } else {
                        messageContainer.className = 'message error';
                        messageContainer.innerText = 'An error occurred: ' + result.d;
                    }
                })
                .catch(error => {
                    const messageContainer = document.getElementById("messageContainer");
                    messageContainer.style.display = 'block';
                    messageContainer.className = 'message error';
                    messageContainer.innerText = 'An unexpected error occurred: ' + error.message;
                });
        }
</script>
</body>
</html>