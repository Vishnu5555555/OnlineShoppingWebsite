<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineShoppingWebsite.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style=" width:1150px; height=30px">
        <tr style=" background-color:peachpuff">
         <%--Login & Logout Button--%>
            <td colspan="2" style=" text-align: right" class="auto-style4">
                <asp:Label ID="Label4" runat="server" style=" text-align:left" Font-Bold="True"
                    Font-Italic="True" Font-Names="Bahnscrift SemiBold"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true"
                    Font-Names="Arial Rounded MT Bold" NavigateUrl="~/Login.aspx">Click To Login</asp:HyperLink>
                <asp:Button ID="Button1" runat="server" Text="Log Out" BackColor="purple"
                    BorderColor="purple" Font-Bold="true" Font-Names="Comic Sans MS"
                    ForeColor="Aqua" Height="27px" Width="105px" onclick="Button1_Click" />
            </td>
             <%--Product Category DropDownlist & TextBox For Searching Products by name as well as by Category of product--%>
            <td style=" text-align:right" class="auto-style5">
                <asp:DropDownList ID="ProductCategories" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ProductCategories_SelectedIndexChanged" BackColor="purple" Font-Bold="true" Font-Size="Medium" ForeColor="White">
                </asp:DropDownList>&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="24px"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="23px"
                    ImageUrl="~/Images/Searching.jpg" Width="25px"
                    onclick="ImageButton2_Click" />
            </td>
        </tr>
    </table>


    <%-- Displaying Products start here--%>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId"
        DataSourceID="SqlDataSource1" Height="293px" Width="310px"
        RepeatColumns="4" RepeatDirection="Horizontal"
        onitemcommand="DataList1_ItemCommand"
        onitemdatabound="DataList1_ItemBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        
    
           <ItemTemplate>
        <table>
            <%--Product Name--%>
            <tr>
                <td style="text-align: center; background-color: purple">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>' Font-Bold="true"
                        Font-Names="Open Sans Extrabold" ForeColor="White"></asp:Label>
               </td>
            </tr>

            <%--Product Image & Stock of Product--%>
            <tr>
                <td style="text-align: center">
                    <asp:Image CssClass="All" ID="Image1" runat="server" BorderColor="purple" BorderWidth="1px"
                        Height="279px" Width="278px" BackColor="PeachPuff" ImageUrl='<%# Eval("Pimage") %>' />
                    <div class="all">
                        &nbsp;Stock:&nbsp;
                        <asp:Label CssClass="txtStock" ID="Label5" runat="server" Text='<%# Eval("Pquantity") %>' 
                              BackColor='<%# (int)Eval("Pquantity") <= 10 ? System.Drawing.Color.Red : System.Drawing.Color.Green %>' >
                        </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProductId") %>'
                        visible="False"></asp:Label>
                </td>
            </tr>
            <%--Product Price--%>
            <tr>
                <td style="text-align: center; background-color: purple">
                    <asp:Label ID="Label2" runat="server" Text="Price: ₹" Font-Bold="True" Font-Names="Arial"
                        ForeColor="White" Style="text-align: center"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pprice") %>' Font-Bold="true"
                        Font-Names="Arial" ForeColor="White" Style="text-align: center"></asp:Label> 
                </td>
            </tr>
            <%--Product Quantity to buy--%>
            <tr>
                <td align="centre">
                    Quantity
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <%--Button to add Product into Cart--%>
            <tr>
                <td style="text-align: center">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="60px" ImageUrl="~/Images/AddCart2.jpg"
                        width="130px" CommandArgument='<%# Eval("ProductId") %>' CommandName="AddToCart" />
                </td>
            </tr>
        </table>
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <%--Displaying Products Ends Here--%>
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShoppingDBConnectionString %>"

        SelectCommand="SELECT [ProductId], [Pname], [Pimage], [Pprice], [Pquantity] FROM [Product1]" ProviderName="System.Data.SqlClient">
    </asp:SqlDataSource>--%>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDBConnectionString %>" SelectCommand="SELECT [ProductId], [Pname], [Pimage], [Pprice], [Pquantity], [Pcategory] FROM [Product1]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
   
    <%--Data To Display Products--%>
    
</asp:Content>
