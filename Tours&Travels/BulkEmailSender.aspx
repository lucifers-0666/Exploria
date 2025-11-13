<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BulkEmailSender.aspx.cs" Inherits="YourNamespace.BulkEmailSender" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulk Email Sender</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
        }

        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .layout {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 30px;
        }

        .email-list-section {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 20px;
            height: fit-content;
            max-height: 600px;
            overflow-y: auto;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }

        .select-all-btn {
            background: #667eea;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 12px;
            transition: all 0.3s;
        }

        .select-all-btn:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }

        .email-item {
            background: white;
            padding: 12px;
            margin-bottom: 10px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s;
            border: 2px solid transparent;
        }

        .email-item:hover {
            border-color: #667eea;
            transform: translateX(5px);
        }

        .email-item input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #667eea;
        }

        .email-info {
            flex: 1;
        }

        .email-address {
            font-weight: 500;
            color: #333;
            font-size: 14px;
        }

        .email-name {
            font-size: 12px;
            color: #666;
            margin-top: 2px;
        }

        .composer-section {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s;
            font-family: inherit;
        }

        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 200px;
        }

        .format-toggle {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }

        .toggle-btn {
            flex: 1;
            padding: 10px;
            border: 2px solid #e0e0e0;
            background: white;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
        }

        .toggle-btn.active {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }

        .send-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .send-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .send-btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }

        .stats {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .stat-card {
            flex: 1;
            background: white;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
        }

        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #667eea;
        }

        .stat-label {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }

        .message-box {
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: none;
        }

        .message-box.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            display: block;
        }

        .message-box.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            display: block;
        }

        .html-preview {
            background: white;
            padding: 15px;
            border-radius: 10px;
            border: 2px solid #e0e0e0;
            min-height: 200px;
            display: none;
        }

        .html-preview.active {
            display: block;
        }

        @media (max-width: 968px) {
            .layout {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>📧 Bulk Email Sender</h1>
            <p class="subtitle">Compose and send messages to all your users</p>

            <asp:Label ID="lblMessage" runat="server" CssClass="message-box"></asp:Label>

            <div class="stats">
                <div class="stat-card">
                    <div class="stat-number"><asp:Label ID="lblTotalEmails" runat="server">0</asp:Label></div>
                    <div class="stat-label">Total Emails</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number"><span id="selectedCount">0</span></div>
                    <div class="stat-label">Selected</div>
                </div>
            </div>

            <div class="layout">
                <!-- Email List Section -->
                <div class="email-list-section">
                    <div class="section-header">
                        <h3 class="section-title">Recipients</h3>
                        <button type="button" class="select-all-btn" onclick="toggleSelectAll()">Select All</button>
                    </div>
                    <asp:Repeater ID="rptEmails" runat="server">
                        <ItemTemplate>
                            <div class="email-item">
                                <input type="checkbox" class="email-checkbox" 
                                       value='<%# Eval("Email") %>' 
                                       data-name='<%# Eval("Name") %>'
                                       onchange="updateSelectedCount()">
                                <div class="email-info">
                                    <div class="email-address"><%# Eval("Email") %></div>
                                    <div class="email-name"><%# Eval("Name") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Composer Section -->
                <div class="composer-section">
                    <h3 class="section-title" style="margin-bottom: 20px;">Compose Message</h3>

                    <div class="form-group">
                        <label>Subject</label>
                        <asp:TextBox ID="txtSubject" runat="server" placeholder="Enter email subject"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Message Format</label>
                        <div class="format-toggle">
                            <button type="button" class="toggle-btn active" onclick="setFormat('text')">Plain Text</button>
                            <button type="button" class="toggle-btn" onclick="setFormat('html')">HTML</button>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Message Content</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" 
                                    placeholder="Enter your message here..."></asp:TextBox>
                        <div id="htmlPreview" class="html-preview"></div>
                    </div>

                    <asp:HiddenField ID="hdnSelectedEmails" runat="server" />
                    <asp:HiddenField ID="hdnIsHtml" runat="server" Value="false" />

                    <asp:Button ID="btnSend" runat="server" Text="Send Email to Selected Recipients" 
                               CssClass="send-btn" OnClick="btnSend_Click" OnClientClick="return validateForm()" />
                </div>
            </div>
        </div>
    </form>

    <script>
        let isHtmlMode = false;

        function setFormat(format) {
            const buttons = document.querySelectorAll('.toggle-btn');
            buttons.forEach(btn => btn.classList.remove('active'));
            
            if (format === 'html') {
                isHtmlMode = true;
                buttons[1].classList.add('active');
                document.getElementById('hdnIsHtml').value = 'true';
                updateHtmlPreview();
            } else {
                isHtmlMode = false;
                buttons[0].classList.add('active');
                document.getElementById('hdnIsHtml').value = 'false';
                document.getElementById('htmlPreview').classList.remove('active');
            }
        }

        function updateHtmlPreview() {
            const content = document.getElementById('<%= txtMessage.ClientID %>').value;
            const preview = document.getElementById('htmlPreview');
            preview.innerHTML = content;
            preview.classList.add('active');
        }

        document.getElementById('<%= txtMessage.ClientID %>').addEventListener('input', function() {
            if (isHtmlMode) {
                updateHtmlPreview();
            }
        });

        function toggleSelectAll() {
            const checkboxes = document.querySelectorAll('.email-checkbox');
            const allChecked = Array.from(checkboxes).every(cb => cb.checked);
            
            checkboxes.forEach(cb => {
                cb.checked = !allChecked;
            });
            
            updateSelectedCount();
        }

        function updateSelectedCount() {
            const checkboxes = document.querySelectorAll('.email-checkbox:checked');
            document.getElementById('selectedCount').textContent = checkboxes.length;
            
            // Store selected emails in hidden field
            const selectedEmails = Array.from(checkboxes).map(cb => cb.value).join(',');
            document.getElementById('<%= hdnSelectedEmails.ClientID %>').value = selectedEmails;
        }

        function validateForm() {
            const subject = document.getElementById('<%= txtSubject.ClientID %>').value.trim();
            const message = document.getElementById('<%= txtMessage.ClientID %>').value.trim();
            const selectedEmails = document.getElementById('<%= hdnSelectedEmails.ClientID %>').value;

            if (!subject) {
                alert('Please enter a subject');
                return false;
            }

            if (!message) {
                alert('Please enter a message');
                return false;
            }

            if (!selectedEmails) {
                alert('Please select at least one recipient');
                return false;
            }

            return confirm('Are you sure you want to send this email to ' + selectedEmails.split(',').length + ' recipient(s)?');
        }

        // Initialize count on page load
        window.onload = function() {
            updateSelectedCount();
        };
    </script>
</body>
</html>
