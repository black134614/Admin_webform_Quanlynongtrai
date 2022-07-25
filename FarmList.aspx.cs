using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FarmList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    public void LoadData()
    {
        if (UserSession.user == null)
        {
            Response.Redirect("~/login.aspx");
        }
        DBEntities db = new DBEntities();
        var loadFram = from d in db.Farms
                       where d.CreateBy == UserSession.user.UserID
                       select new
                       {
                           d.Title,
                           d.Detail,
                           d.Location,
                           d.CreateTime,
                           d.FarmID
                       };
        Repeater_Main.DataSource = loadFram.ToList();
        Repeater_Main.DataBind();
    }

    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        LinkButton  del = sender as LinkButton;
        int farmID = 0;
        int.TryParse(del.CommandArgument, out farmID);
        DBEntities db = new DBEntities();
        var loadFram = (from d in db.Farms
                       where d.FarmID == farmID
                       select d).FirstOrDefault();
        db.Farms.Remove(loadFram);
        try
        {
            db.SaveChanges();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Có lỗi');</script>");
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static string DeleteRow(int id)
    {
        DBEntities db = new DBEntities();
        var deleteProfit = from a in db.DateStatiticProfits
                           join b in db.CropSteps on a.CropStepID equals b.CropStepID
                           join c in db.Crops on b.CropID equals c.CropID
                           where c.FarmID == id
                           select a;
        var deleteWeather = from a in db.WeatherNotes
                           join b in db.CropSteps on a.CropStepID equals b.CropStepID
                           join c in db.Crops on b.CropID equals c.CropID
                           where c.FarmID == id
                           select a;
        var deleteStep = from a in db.Steps
                           join b in db.CropSteps on a.CropStepID equals b.CropStepID
                           join c in db.Crops on b.CropID equals c.CropID
                           where c.FarmID == id
                           select a;
        var deleteSpending = from a in db.Spendings
                           join b in db.CropSteps on a.CropStepID equals b.CropStepID
                           join c in db.Crops on b.CropID equals c.CropID
                           where c.FarmID == id
                           select a;
        var deleteCropStep = from b in db.CropSteps
                           join c in db.Crops on b.CropID equals c.CropID
                           where c.FarmID == id
                           select b;
        var deleteCrop = db.Crops.Where(d => d.FarmID == id);
        foreach (var item in deleteProfit)
        {
            db.DateStatiticProfits.Remove(item);
        }
        foreach (var item in deleteSpending)
        {
            db.Spendings.Remove(item);
        }
        foreach (var item in deleteWeather)
        {
            db.WeatherNotes.Remove(item);
        }
        foreach (var item in deleteStep)
        {
            db.Steps.Remove(item);
        }
        foreach (var item in deleteCropStep)
        {
            db.CropSteps.Remove(item);
        }
        foreach (var item in deleteCrop)
        {
            db.Crops.Remove(item);
        }
        var data = (from d in db.Farms
                    where d.FarmID == id
                    select d).FirstOrDefault();
        string sp = data.Title;
        db.Farms.Remove(data);
        try
        {
            db.SaveChanges();

        }
        catch (Exception)
        {
            return "Thất bại";
        }

        return "Đã xóa thành công" + sp;
    }
}