<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="WebApplication22.Messages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Applications</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .gridViewContainer {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden; /* Ensures child elements are contained */
            margin-top: 20px; /* Space above the grid */
        }
        .gridHeader {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 10px;
        }
        .gridRow {
            text-align: center;
        }
        .messageRow {
            margin-top: 10px;
        }
        .messageBox {
            display: none;
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #007BFF;
            border-radius: 5px;
            background-color: #e7f3ff;
        }
        .txtMessage {
            width: calc(100% - 20px);
            padding: 5px;
            border: 1px solid #007BFF;
            border-radius: 3px;
        }
        .btn {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 5px; /* Adds spacing above buttons */
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function toggleMessageBox(button) {
            var messageBox = button.closest('.messageRow').querySelector('.messageBox');
            messageBox.style.display = messageBox.style.display === 'block' ? 'none' : 'block';
        }

        function sendMessage(button) {
            var messageBox = button.closest('.messageRow').querySelector('.txtMessage');
            var studentName = button.dataset.studentName;
            var message = messageBox.value;

            // Use AJAX to send the message to the server
            $.post('StudentList.aspx/SaveMessage', { studentName: studentName, message: message }, function (response) {
                messageBox.value = ''; // Clear the text box after sending
                alert('Message sent!'); // Feedback for the user
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
           <i class="fa-solid fa-bars-progress header-icon fa-2x"></i>
        <h1>Student Applications</h1>
        <div class="gridViewContainer">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="gridRow" HeaderStyle-CssClass="gridHeader" />
                    <asp:BoundField DataField="Qualification" HeaderText="Qualification" ItemStyle-CssClass="gridRow" HeaderStyle-CssClass="gridHeader" />
                    <asp:BoundField DataField="Skillset" HeaderText="Skillset" ItemStyle-CssClass="gridRow" HeaderStyle-CssClass="gridHeader" />
                    <asp:BoundField DataField="Experience" HeaderText="Experience" ItemStyle-CssClass="gridRow" HeaderStyle-CssClass="gridHeader" />
                    <asp:BoundField DataField="PostAppliedFor" HeaderText="Post Applied For" ItemStyle-CssClass="gridRow" HeaderStyle-CssClass="gridHeader" />
                    <asp:TemplateField HeaderText="Message" HeaderStyle-CssClass="gridHeader" HeaderStyle-BackColor="#007BFF" HeaderStyle-ForeColor="white">
                        <ItemTemplate>
                            <div class="messageRow">
                                <asp:Button ID="btnMessage" runat="server" Text="Send Message" CssClass="btn" OnClientClick="toggleMessageBox(this); return false;" />
                                <div class="messageBox">
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="txtMessage" placeholder="Type your message here..." />
                                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn" OnClientClick="sendMessage(this); return false;" data-student-name='<%# Eval("Name") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
