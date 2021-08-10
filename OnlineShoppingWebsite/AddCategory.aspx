<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="OnlineShoppingWebsite.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <div class="navbar" style="border-width: 3px; border-color: purple;  height:460px; background-image: url('Images/bla.jpg');">
                <table align="center" style="width: 386px; height:410px; border: 1px solid purple; color: #FFFFFF; background-color: #000000; background-image: url('Images/bla.jpg'); font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">
                 <%--Header Text--%>
                  <tr>
                           <td colspan="2" align="center">
                                     <h2>
                                             Add Category</h2>
                                     <br/>
                           </td>
             </tr>

            <%--Category with Required Field Validation--%>
             <tr>
                    <td>
                           <b style="font-size: 21px; font-weight: bold; color: purple;">Category: &nbsp;&nbsp;&nbsp;</b>
                 </td>
                <td>
                          <asp:TextBox ID="TextBox1" runat="server" Height="44px"  width="230px"
                                 CausesValidation="True" placeholder="Category Name" BorderColor="purple"
                                 BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Forecolor="White"
                                 Backcolor="Transparent"></asp:TextBox>
                    <br   />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidation1" runat="server"
                    ControlToValidate="TextBox1"
                    ForeColors="Red" ErrorMessage="Enter Category Name"></asp:RequiredFieldValidator>
   </td>
</tr>

<%--Button to add Category--%>
<tr>
      <td colspan="2"  align="center">
            <asp:Button ID="Button1"  runat="server"  Text="Add" Height="44px" Width="80px"
                      Font-Bold="True" Font-Size="Medium" BackColor="peachpuff" BorderColor="#333333"
                          BorderWidth="2px" onclick="Button1_Click" />
      </td>
</tr>
 
<tr>
   <td colspan="2"><br /></td>
   </tr>

<%--GridView to Display Category as well as can edit & delete--%>
<tr>
     <td colspan="2" align="center">
           <asp:GridView CssClass="button" ID="GridView1"  runat="server" AllowPaging="True"
AutoGenerateColoumns="False" PageSize="4" Width="257px"
DataKeyNames="CategoryId"
onpageindexchanging="GridView1_PageIndexChanging"
onrowcancelingedit="GridView1_RowCancelingEdit"
onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing"
onrowupdating="GridView1_RowUpdating" EmptyDataText="No record to display"
                  BorderColor="purple" BorderWidth="2px" Font-Bold="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
<Columns>
      <asp:TemplateField HeaderText="Category">
            <EditItemTemplate>
                     <asp:TextBox  ID="TextBox2"  runat="server"  Text='<%#  Eval("CategoryName")  %>' Font-Bold="True"></asp:TextBox>
   </EditItemTemplate>
    <ItemTemplate>
           <asp:Label ID="Label2"  runat="server"  Text='<%#  Eval("CategoryName") %>'></asp:Label>
     </ItemTemplate>
           <ItemStyle HorizontalAlign="Center"  />
    </asp:TemplateField>
   <asp:CommandField CausesValidation="False" HeaderText="Operation"
          ShowDeleteButton="True" ShowEditButton="True">
    <ItemStyle HorizontalAlign="Center"  />
   </asp:CommandField>
</Columns>
                  <HeaderStyle BorderColor="#333333" BorderWidth="3px"  Font-Size="Large"  />
   </asp:GridView>
    </td>
   </tr>
 
  </table>
  <br  /><br  />
  </div>
</center>


</asp:Content>


