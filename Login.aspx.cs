using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Register_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();
        var username = input_UserName.Value.Trim();
        var userID = input_UserID.Value.Trim();
        var userPassword = input_Password.Value.Trim();
        var checkUser = (from d in db.Users
                     where d.UserID == userID
                     select d).FirstOrDefault();
        if (checkUser == null)
        {
            var item = new User
            {
                Name = username,
                UserID = userID,
                Password = userPassword,
                UserRole = 2
            };
            db.Users.Add(item);
            try
            {
                db.SaveChanges();
                l_Mesage.InnerText = "Vui lòng đăng nhập tài khoản vừa tạo!";
            }
            catch (Exception)
            {
                l_Mesage.InnerText = "Lỗi !";
                return;
            }
        }
        else
        {
            l_Mesage.InnerText = "Tài khoản đã tồn tại! Vui lòng chọn tên đăng nhập khác";
            return;
        }
    }

    protected void Btn_Login_Click(object sender, EventArgs e)
    {
        var userID = UserID.Value.Trim();
        var password = Password.Value.Trim();
        DBEntities db = new DBEntities();
        var login = (from d in db.Users
                     where d.UserID == userID && d.Password == password
                     select d).FirstOrDefault() ;
        if (login == null)
        {
            l_Mesage.InnerText = "Sai tên đăng nhập hoặc mật khẩu!";
            return;
        }
        else
        {
            UserSession.user = login;
            if (Remember.Checked)
            {
                Session.Timeout = 525600;
            }
            Response.Redirect("~/Default.aspx");
        }
    }
}