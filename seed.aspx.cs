using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            page_message.Visible = false;
            LoadData();
        }
    }
    public void LoadData() {
        if (UserSession.user == null)
        {
            Response.Redirect("~/login.aspx");
        }
        DBEntities db = new DBEntities();
        var loadSeed = db.Seeds.OrderByDescending(d => d.CreateTime);
        Repeater_Main.DataSource = loadSeed.ToList();
        Repeater_Main.DataBind();
    }

    protected void btn_Edit_Click(object sender, EventArgs e)
    {

    }

    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        LinkButton btn_Delete = sender as LinkButton;
        int id = 0;
        int.TryParse(btn_Delete.CommandArgument, out id);
        DBEntities db = new DBEntities();
        var step = db.Steps.Where(d => d.CropStep.SeedID == id);
        var spend = db.Spendings.Where(d => d.CropStep.SeedID == id);
        var weather = db.WeatherNotes.Where(d => d.CropStep.SeedID == id);
        var cropstep = db.CropSteps.Where(d => d.SeedID == id);
        var seed = db.Seeds.Where(d => d.SeedID == id).FirstOrDefault();
        foreach (var item in step)
        {
            db.Steps.Remove(item);
        }
        foreach (var item in spend)
        {
            db.Spendings.Remove(item);
        }
        foreach (var item in weather)
        {
            db.WeatherNotes.Remove(item);
        }
        foreach (var item in cropstep)
        {
            db.CropSteps.Remove(item);
        }
        db.Seeds.Remove(seed);
        try
        {
            db.SaveChanges();
            LoadData();
            page_message.Visible = true;
            page_message.InnerHtml = "Xóa thành công";
        }
        catch (Exception)
        {
            page_message.Visible = true;
            page_message.InnerHtml = "Thao tác thất bại!";
        }
    }
}