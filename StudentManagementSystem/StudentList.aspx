<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StudentList.aspx.cs"
    Inherits="StudentManagementSystem.StudentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Student List</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        h2 {
            text-align: center;
        }

        .add-button {
            display: inline-block;
            padding: 10px 15px;
            background-color: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .grid {
            width: 100%;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="container">

        <h2>Student Management System</h2>

        <a href="AddStudent.aspx" class="add-button">
            + Add Student
        </a>

        <br />
        <br />

        <asp:GridView
            ID="gvStudents"
            runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="StudentId"
            CssClass="grid"
            OnRowCommand="gvStudents_RowCommand">

            <Columns>

                <asp:BoundField
                    DataField="StudentId"
                    HeaderText="Student ID" />

                <asp:BoundField
                    DataField="Name"
                    HeaderText="Name" />

                <asp:BoundField
                    DataField="Age"
                    HeaderText="Age" />

                <asp:BoundField
                    DataField="Class"
                    HeaderText="Class" />

                <asp:BoundField
                    DataField="Email"
                    HeaderText="Email" />

                <asp:TemplateField HeaderText="Actions">

                    <ItemTemplate>

                        <asp:LinkButton
                            ID="btnEdit"
                            runat="server"
                            Text="Edit"
                            CommandName="EditStudent"
                            CommandArgument='<%# Eval("StudentId") %>'>
                        </asp:LinkButton>

                        &nbsp;&nbsp;

                        <asp:LinkButton
                            ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CommandName="DeleteStudent"
                            CommandArgument='<%# Eval("StudentId") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this student?');">
                        </asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

</form>

</body>

</html>
