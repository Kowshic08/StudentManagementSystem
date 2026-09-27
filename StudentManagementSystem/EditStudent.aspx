<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditStudent.aspx.cs"
    Inherits="StudentManagementSystem.EditStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Edit Student</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        .input-box {
            width: 100%;
            padding: 10px;
            margin-bottom: 5px;
            box-sizing: border-box;
        }

        .button {
            padding: 10px 20px;
        }

        .error {
            color: red;
            font-size: 13px;
            display: block;
            margin-bottom: 10px;
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="container">

            <h2>Edit Student</h2>

            <asp:HiddenField
                ID="hfStudentId"
                runat="server" />


            <asp:Label
                ID="lblName"
                runat="server"
                Text="Name">
            </asp:Label>

            <asp:TextBox
                ID="txtName"
                runat="server"
                CssClass="input-box">
            </asp:TextBox>

            <asp:RequiredFieldValidator
                ID="rfvName"
                runat="server"
                ControlToValidate="txtName"
                ErrorMessage="Name is required"
                CssClass="error">
            </asp:RequiredFieldValidator>


            <asp:Label
                ID="lblAge"
                runat="server"
                Text="Age">
            </asp:Label>

            <asp:TextBox
                ID="txtAge"
                runat="server"
                CssClass="input-box">
            </asp:TextBox>

            <asp:RequiredFieldValidator
                ID="rfvAge"
                runat="server"
                ControlToValidate="txtAge"
                ErrorMessage="Age is required"
                CssClass="error">
            </asp:RequiredFieldValidator>

            <asp:RangeValidator
                ID="rvAge"
                runat="server"
                ControlToValidate="txtAge"
                MinimumValue="1"
                MaximumValue="100"
                Type="Integer"
                ErrorMessage="Age must be between 1 and 100"
                CssClass="error">
            </asp:RangeValidator>


            <asp:Label
                ID="lblClass"
                runat="server"
                Text="Class">
            </asp:Label>

            <asp:TextBox
                ID="txtClass"
                runat="server"
                CssClass="input-box">
            </asp:TextBox>

            <asp:RequiredFieldValidator
                ID="rfvClass"
                runat="server"
                ControlToValidate="txtClass"
                ErrorMessage="Class is required"
                CssClass="error">
            </asp:RequiredFieldValidator>


            <asp:Label
                ID="lblEmail"
                runat="server"
                Text="Email">
            </asp:Label>

            <asp:TextBox
                ID="txtEmail"
                runat="server"
                CssClass="input-box">
            </asp:TextBox>

            <asp:RequiredFieldValidator
                ID="rfvEmail"
                runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Email is required"
                CssClass="error">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator
                ID="revEmail"
                runat="server"
                ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ErrorMessage="Enter a valid email"
                CssClass="error">
            </asp:RegularExpressionValidator>


            <asp:Button
                ID="btnUpdate"
                runat="server"
                Text="Update"
                CssClass="button"
                OnClick="btnUpdate_Click" />

            &nbsp;

            <a href="StudentList.aspx">
                Back
            </a>

        </div>

    </form>

</body>

</html>