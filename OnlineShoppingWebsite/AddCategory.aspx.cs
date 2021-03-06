using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoppingWebsite
{
    public partial class AddCategory : System.Web.UI.Page
    {
        string str = "Data Source =.;Initial Catalog=ShoppingDB;Integrated Security=True;";
                  protected void Page_Load(object sender, EventArgs e)
                 {
                        if  ( !IsPostBack)
                     {
                         // check whether Admin is logged in or not 
                           if (Session["admin"] == null)
                            {
                                 Response.Redirect("Login.aspx");
                             }
                             ShowGrid();
                       }
               }
              // will Add Category into table
             protected void Button1_Click(object sender, EventArgs e)
               {
                   SqlConnection con1 = new SqlConnection(str);
                    SqlDataAdapter sda = new SqlDataAdapter("Select * from Category where CategoryName='" + TextBox1.Text.ToString() + "' ", con1);
                    DataTable dt = new DataTable();
                   sda.Fill(dt);

// check whether the added Category is already present or not
if (dt.Rows.Count == 1)
{
    Response.Write("<script>alert('This Category is Already Present');</script>");
}
else
{
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Category" + "(CategoryName) values (@CategoryName)", con);
            cmd.Parameters.AddWithValue("@CategoryName", TextBox1.Text);
            cmd.ExecuteNonQuery();
           con.Close();
           Response.Write("<script>alert('One Record added');</script>");
           TextBox1.Text = "";
           ShowGrid();
        }
}

//Display Category in GridView
public void ShowGrid()
{
                SqlConnection conn = new SqlConnection(str);
               SqlDataAdapter  sda = new SqlDataAdapter("Select * from Category", conn);
              
               DataTable dt = new DataTable();
               sda.Fill(dt);
               GridView1.DataSource = dt;
               GridView1.DataBind();
}


// Cancelling GridView Row Edit
protected void GridView1_RowCancelingEdit(object sender , GridViewCancelEditEventArgs e)
{
    GridView1.EditIndex = -1;
    ShowGrid();
}

// Deleting Category
protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
{
    GridViewRow row = GridView1.Rows[e.RowIndex];
    int CategoryId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
          SqlConnection con1 = new SqlConnection(str);
         con1.Open();
         SqlCommand cmd1 = new SqlCommand("Delete from Category where CategoryId=@1", con1);
         cmd1.Parameters.AddWithValue("@1", CategoryId);
         cmd1.ExecuteNonQuery();
         con1.Close();
         Response.Write("<script>alert('Category Deleted Successful');</script>");
         ShowGrid();
}

protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
{
    GridView1.EditIndex = e.NewEditIndex;
         ShowGrid();
}


// Updating Category
protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
{
          GridViewRow row = GridView1.Rows[e.RowIndex];
          int CategoryId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
         string CategoryName = (row.FindControl("TextBox2") as TextBox).Text;
         SqlConnection con2 = new SqlConnection(str);
         con2.Open();
         SqlCommand cmd1 = new SqlCommand("Update Category set CategoryName=@1 where CategoryId=@2" , con2);
         cmd1.Parameters.AddWithValue("@1", CategoryName);
         cmd1.Parameters.AddWithValue("@2", CategoryId);
        cmd1.ExecuteNonQuery();
        con2.Close();
       Response.Write("<script>alert('Category Updated Successful')</script>");
       GridView1.EditIndex = -1;
}

// calls when GridView page changes
protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
{
        GridView1.PageIndex = e.NewPageIndex;
        ShowGrid();
}

protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
{

}

    }
}