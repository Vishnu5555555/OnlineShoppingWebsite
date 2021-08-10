using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoppingWebsite
{
    public partial class Add_Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check whether Admin is logged in or not
                if (Session["admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        // Will Add all Product Details in Table
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=ShoppingDB; Integrated Security= True;");
            if (Pimage.HasFile)
            {
                string filename = Pimage.PostedFile.FileName;
                string filepath = "Images/" + Pimage.FileName;
                Pimage.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Product1" +
                    "(Pname,Pdesc,Pimage,Pprice,Pquantity,Pcategory) values (@Pname,@Pdesc,@Pimage,@Pprice,@Pquantity,@Pcategory)", con);
                cmd.Parameters.AddWithValue("@Pname", Pname.Text.Trim());
                cmd.Parameters.AddWithValue("@Pdesc", Pdesc.Text.Trim());
                cmd.Parameters.AddWithValue("@Pimage", filepath);
                cmd.Parameters.AddWithValue("@Pprice", Pprice.Text.Trim());
                cmd.Parameters.AddWithValue("@Pquantity", Pquantity.Text.Trim());
                cmd.Parameters.AddWithValue("@Pcategory", Pcategory.SelectedItem.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx");
            }
        }
    }
}
