<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="OnlineShoppingWebsite.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .table
        {
            border-radius:5%;
        }
        #Button1
        {
            border-radius:11% 11% 11% 11% / 61% 64% 64% 66%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="table" align="center" style=" margin-top:50px; width:531px; height: 563px;" bgcolor="DarkCyan">
            <%--Header Text--%>
            <tr>
                <td colspan="2" align="center" style=" vertical-align:top">
                    <asp:Label ID="Label1" runat="server" Text="Card Details" Font-Bold="True"
                        Font-Size="XX-Large" ForeColor="White"></asp:Label>
                </td>
            </tr>

            <tr>
                <%--First Name with Required & Regular Expression Validation--%>
                <td align="center" style=" vertical-align:top">
                    <asp:TextBox ID="TextBox1" runat="server" BackColor="White" BorderWidth="2px"
                        Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="First Name is Empty" ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage="First Name must be in characters" ControlToValidate="TextBox1"
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                    </td>
                <%--Last Name with Required & Regular Expression Validation--%>
                <td align="center" style=" vertical-align:top">
                    <asp:TextBox ID="TextBox2" runat="server" BorderColor="Black" BorderWidth="2px"
                        Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" placeholder="Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="Last Name is Empty" ControlToValidate="TextBox2"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ErrorMessage="Last Name must be in characters" ControlToValidate="TextBox2"
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                </td>
            </tr>

            <%--Payment Card Logo Image--%>
            <tr>
                <td colspan="2" align="center">
                    <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderWidth="2px"
                        ImageUrl="~/Images/cards.png" Width="438px" />
                </td>
            </tr>

            <%-- 16 digits card number--%>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label2" runat="server" Text="Card Number" Font-Bold="True"
                        Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
            </tr>

            <%-- 16 digits card number with required Expression Validation--%>
            <tr>
                <td colspan="2" align="center" style=" vertical-align:top"> 
                    <asp:TextBox ID="TextBox3" runat="server" BorderColor="Black" BorderWidth="2px"
                        Font-Bold="true" Font-Size="Medium" Height="44px" Width="442px" placeholder="16 Digits"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Card Number is Empty" ControlToValidate="TextBox3"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ErrorMessage="Card Number must be of 16 digits" ControlToValidate="TextBox3"
                        ForeColor="Red" ValidationExpression="[0-9]{16}">*</asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <%--Expiry Date of Card--%>
                <td align="center">
                    <asp:Label ID="Label3" runat="server" Text="Expiry Date" Font-Bold="true"
                        Font-Size="Large" ForeColor="White"></asp:Label>
                </td>

                <%--CVV number of card--%>
                <td align="center">
                    <asp:Label ID="Label4" runat="server" Text="CVV" Font-Bold="true"
                        Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
            </tr>

            <tr>
                <%--Expiry Date of Card with Required Field Validation--%>
                <td align="center" style=" vertical-align:top">
                    <asp:TextBox ID="TextBox4" runat="server" BorderColor="Black" BorderWidth="2px"
                        Font-Bold="true" Font-Size="Medium" Height="44px" Width="188px" placeholder="MM/YY(Eg:061996)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="Expiry date is empty" ControlToValidate="TextBox4"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>

                <%--CVV number of card with required & regular Expression Validation--%>

            <td align="center" style=" vertical-align:top">
                <asp:TextBox ID="TextBox5" runat="server" BorderColor="Black" BorderWidth="2px"
                    Font-Bold="true" Font-Size="Medium" Height="44px" Width="188px" placeholder="3 Digits"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage ="CVV is Empty" ControlToValidate="TextBox5"
                    ForeColor="Red" ValidationExpression="[0-9]{3}">*</asp:RequiredFieldValidator>
            </td>
            </tr>

            <%--Billing Address of the user with Required Field validation--%>
            <tr>
                <td colspan="2" align="center" style=" vertical-align:top">
                    <asp:TextBox ID="TextBox6" runat="server" BorderColor="Black" BorderWidth="2px"
                        Font-Bold="true" Font-Size="X-Large" Height="50px" Width="442px" placeholder="Billing Address" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ErrorMessage="Address is Empty" ControlToValidate="TextBox6"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <%--Submit button to save payment details in table--%>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="Black"
                        BorderColor="White" BorderWidth="2px" Font-Bold="true" Font-Size="Large"
                        ForeColor="White" Height="44px" Width="188px" onclick="Button1_Click" />
                </td>
            </tr>

            <%--Validation Summary For displaying all error Message--%>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true"
                        ForeColor="Red" HeaderText="Fix the Following errors" />
                </td>
            </tr>

            <tr>
                <%--Goes to previous page AddToCart page &Goes to home page i.e Default page--%>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true"
                        NavigateUrl="~/AddtoCart.aspx">Previous Page</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="true"
                        NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>