using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class farmEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            page_message.Visible = false;
        }
    }
    public void LoadData()
    {
        var farmID = 0;
        int.TryParse(Request.QueryString["farmID"], out farmID);
        if (farmID > 0)
        {
            DBEntities db = new DBEntities();
            var loadFarm = (from d in db.Farms
                            where d.FarmID == farmID
                            select d).FirstOrDefault();
            if (loadFarm == null)
            {
                input_FarmLocation.Value = "Dữ liệu không tồn tại hoặc đã bị xóa!";
            }
            else
            {
                input_FarmLocation.Value = loadFarm.Location;
                input_TypeOfCrop.Value   = loadFarm.Title;
                textarea_Note.Value      = loadFarm.Note;
                input_Detail.Value       = loadFarm.Detail;
            }
        }
    }

    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        var farmID = 0;
        int.TryParse(Request.QueryString["farmID"], out farmID);
        string location = input_FarmLocation.Value.Trim();
        string title    = input_TypeOfCrop.Value.Trim();
        string note     = textarea_Note.Value.Trim();
        string detail   = input_Detail.Value.Trim();
        DBEntities db = new DBEntities();

        if (farmID > 0)
        {
            var loadFarm = (from d in db.Farms
                            where d.FarmID == farmID
                            select d).FirstOrDefault();
            if (loadFarm == null)
            {
                input_FarmLocation.Value = "Dữ liệu không tồn tại hoặc đã bị xóa!";
            }
            else
            {
                loadFarm.Title = title;
                loadFarm.Location = location;
                loadFarm.Note = note;
                loadFarm.Detail = detail;
                try
                {
                    db.SaveChanges();
                    Response.Redirect("~/FarmList.aspx");
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Có lỗi');</script>");
                }
            }
        }
        else
        {
            var item = new Farm
            {
                Title = title,
                Note = note,
                Location = location,
                CreateBy = UserSession.user.UserID,
                Detail = detail,
                CreateTime = DateTime.Now
            };
            db.Farms.Add(item);
            try
            {
                db.SaveChanges();
                page_message.Visible = true;
                page_message.InnerHtml = "<span class'fa fa-info-circle'></span>Thao tác thành công!";
                input_FarmLocation.Value = "";
                input_TypeOfCrop.Value = "";
                textarea_Note.Value = "";
                input_Detail.Value = "";
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Có lỗi');</script>");
            }
    }
}


}