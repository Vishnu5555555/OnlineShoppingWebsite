<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineShoppingWebsite.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title></title>
       <style type="text/css">
           .auto-style1 {
               width: 50%;
               height: 102px;
           }
           .auto-style2 {
               height: 102px;
               color: #FFFFFF;
           }
           .auto-style3 {
               width: 50%;
               height: 101px;
           }
           .auto-style4 {
               height: 101px;
           }
       </style>
</head>
<body>
       <form id="form1" runat="server">
       <div style=" height: 450px;">
             <table style="width: 565px; height: 421px; background-color:forestgreen; margin:0 auto; background-image: url('Images/bla.jpg'); color: #FFFFFF;">
                           <%--Display Login Image--%>
                           <tr>
                                 <td colspan="2" align="center">
                                      <img id="Img1" src="Images/Login.png" alt=" " runat="server"
                                             style="height: 190px; width: 199px"/>
                                </td>
                            </tr>

                            <%--Email ID with Required Field Validation--%>
                            <tr>
                                   <td align="center" style="color: #FFFFFF;" class="auto-style3">
                                         <b>Email Id:</b>
                                   </td>
                                   <td class="auto-style4">
                                         <asp:TextBox ID="TextBox1" runat="server" Backcolor="white" Height="29px"
                                               Width="166px" Font-Bold="True" ></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                               ControlToValidate="TextBox1" ErrorMessage="Enter Email-Id" ForeColor="Red"></asp:RequiredFieldValidator>
                                   </td>
                              </tr>

                              <%--Password with Required Field Validation--%>
                              <tr>
                                    <td align="center" style="color: #FFFFFF;" class="auto-style3">
                                         <b>Password:</b>
                                    </td>
                                    <td class="auto-style4">
                                          <asp:TextBox ID="TextBox2" runat="server" Backcolor="white" Height="29px"
                                                Width="166px" TextMode="Password" Font-Bold="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                 ControlToValidate="TextBox2" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </td>
                                </tr>

                                <%--Button for Login & redirect to Default page--%>
                                <tr>
                                     <td colspan="2" align="center" >
                                           <asp:ImageButton ID="ImageButton1" runat="server" Height="103px"
                                                  ImageUrl="~/Images/LoginButton2.png" Width="142px"
                                                  onclick="ImageButton1_Click"  /><hr  />
                                     </td>
                               </tr>

                               <tr>
                                     <%--Label for displaying Error message--%>
                                     <td>
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                     </td>

                                     <%--Link Button for Redirecting to Register page--%>
                                     <td align="right">
                                          <asp:LinkButton ID="LinkButton1"
                                                 runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red"
                                                 onclick="LinkButton1_Click" CausesValidation="False">Register Here...</asp:LinkButton>
                                     </td>
                                </tr>

                          </table>
                    </div>
                    </form>
            </body>
            </html>








