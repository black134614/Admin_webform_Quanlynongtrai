using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class farmDetail : System.Web.UI.Page
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
            Response.Redirect("~/Login.aspx");
        }
        int farmID = 0;
        int.TryParse(Request.QueryString["farmID"], out farmID);
        if (farmID == 0)
        {
            Response.Redirect("~/FarmList.aspx");
        }
        getIdToCropStep.HRef = "CropStepEdit.aspx?farmID=" + farmID;
        DBEntities db = new DBEntities();
        var loadCropStep = from a in db.CropSteps
                           from b in db.Crops
                           where b.FarmID == farmID && b.CropID == a.CropID && a.IsActive == true
                           orderby a.CreateTime descending
                           select new
                           {
                               CropTitle = b.Title,
                               a.Title,
                               a.Detail,
                               a.CreateTime,
                               a.UpdateTime,
                               a.Seed.SeedName,
                               a.Evaluate,
                               a.CropStepID
                           };
        Repeater_CropStep.DataSource = loadCropStep.ToList();
        Repeater_CropStep.DataBind();
        dropdown_CropStep.DataSource = loadCropStep.ToList();
        dropdown_CropStep.DataTextField = "Title";
        dropdown_CropStep.DataValueField = "CropStepID";
        dropdown_CropStep.DataBind();
        DropDownList1.DataSource = loadCropStep.ToList();
        DropDownList1.DataTextField = "Title";
        DropDownList1.DataValueField = "CropStepID";
        DropDownList1.DataBind();


        var loadAllCrop = from a in db.CropSteps
                          join b in db.Crops on a.CropID equals b.CropID
                          join c in db.Seeds on a.SeedID equals c.SeedID
                          where b.FarmID == farmID
                          select new
                          {
                              a.Title,
                              c.SeedName,
                              a.CropStepID,
                              a.Evaluate,
                              a.UpdateTime,
                              c.PlantingMonth,
                              c.SeedType,
                              a.CreateTime
                          };
        Repeater_Main.DataSource = loadAllCrop.ToList();
        Repeater_Main.DataBind();

        var loadSpending = db.Spendings.Where(d => d.CropStep.Crop.FarmID == farmID);
        Repeater_Spending.DataSource = loadSpending.ToList();
        Repeater_Spending.DataBind();

        var loadProfit = db.DateStatiticProfits.Where(d => d.CropStep.Crop.FarmID == farmID);
        Repeater_Profit.DataSource = loadProfit.ToList();
        Repeater_Profit.DataBind();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string DeleteRow(int id)
    {
        DBEntities db = new DBEntities();
        var deleteStep = db.Steps.Where(d => d.CropStepID == id);
        var deleteSpending = db.Spendings.Where(d => d.CropStepID == id);
        var deleteWeatherNote = db.WeatherNotes.Where(d => d.CropStepID == id);
        var deleteDateProfit = db.DateStatiticProfits.Where(d => d.CropStepID == id);
        foreach (var item in deleteStep)
        {
            db.Steps.Remove(item);
        }
        foreach (var item in deleteSpending)
        {
            db.Spendings.Remove(item);
        }
        foreach (var item in deleteDateProfit)
        {
            db.DateStatiticProfits.Remove(item);
        }
        foreach (var item in deleteWeatherNote)
        {
            db.WeatherNotes.Remove(item);
        }

        var data = (from d in db.CropSteps
                    where d.CropStepID == id
                    select d).FirstOrDefault();
        string sp = data.Title;
        db.CropSteps.Remove(data);
        try
        {
            db.SaveChanges();

        }
        catch (Exception)
        {
            return "Thất bại";
        }

        return "Đã xóa thành công: " + sp + "và tất cả dữ liệu liên quan!";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string DeleteCropStep(int id)
    {
        DBEntities db = new DBEntities();
        var deleteStep = db.Steps.Where(d => d.CropStepID == id);
        var deleteSpending = db.Spendings.Where(d => d.CropStepID == id);
        var deleteWeatherNote = db.WeatherNotes.Where(d => d.CropStepID == id);
        var deleteDateProfit = db.DateStatiticProfits.Where(d => d.CropStepID == id);
        foreach (var item in deleteStep)
        {
            db.Steps.Remove(item);
        }
        foreach (var item in deleteSpending)
        {
            db.Spendings.Remove(item);
        }
        foreach (var item in deleteDateProfit)
        {
            db.DateStatiticProfits.Remove(item);
        }
        foreach (var item in deleteWeatherNote)
        {
            db.WeatherNotes.Remove(item);
        }

        var data = (from d in db.CropSteps
                    where d.CropStepID == id
                    select d).FirstOrDefault();
        string sp = data.Title;
        db.CropSteps.Remove(data);
        try
        {
            db.SaveChanges();

        }
        catch (Exception)
        {
            return "Thất bại";
        }

        return "Đã xóa thành công: " + sp + "và tất cả dữ liệu liên quan!";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddCropStep(int id)
    {
        DBEntities db = new DBEntities();
        var data = (from d in db.CropSteps
                    where d.CropStepID == id
                    select d).FirstOrDefault();
        string sp = data.Title;
        var newItem = new CropStep()
        {
            Title = data.Title,
            Detail = data.Detail,
            Evaluate = "Chưa có đánh giá cho mùa này! Hãy cập nhật nhé. ",
            CreateTime = DateTime.Now,
            UpdateTime = DateTime.Now,
            CropID = data.CropID,
            IsActive = true,
            SeedID = data.SeedID
        };
        db.CropSteps.Add(newItem);
        try
        {
            db.SaveChanges();

        }
        catch (Exception)
        {
            return "Thêm thất bại";
        }

        return "Đã thêm : " + sp + " thành công!";
    }

    protected void btn_delete_spending_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        int id = 0;
        int.TryParse(btn.CommandArgument, out id);
        DBEntities db = new DBEntities();
        var item = db.Spendings.Where(s => s.SpendingID == id).FirstOrDefault();
        db.Spendings.Remove(item);
        try
        {
            db.SaveChanges();
            LoadData();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đã xóa thành công!')", true);
        }
        catch (Exception)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thất bại!')", true);
        }
    }

    protected void btn_AddSpending_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();

        int amount = 0;
        int.TryParse(Spending_Amount.Value, out amount);
        if (amount == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập số!')", true);
            return;
        }
        int cropstepID = 0;
        int.TryParse(dropdown_CropStep.SelectedValue, out cropstepID);
        var newitem = new Spending
        {
            Title = Spending_Title.Value.Trim(),
            Description = Spending_Detail.Value.Trim(),
            Amount = amount,
            CreateTime = DateTime.Now,
            CropStepID = cropstepID
        };
        db.Spendings.Add(newitem);
        try
        {
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm thành công!')", true);
            LoadData();
        }
        catch (Exception)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thất bại!')", true);
        }

    }

    protected void btn_delete_profit_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        int id = 0;
        int.TryParse(btn.CommandArgument, out id);
        DBEntities db = new DBEntities();
        var item = db.DateStatiticProfits.Where(d => d.ProfitID == id).FirstOrDefault();
        db.DateStatiticProfits.Remove(item);
        try
        {
            db.SaveChanges();
            LoadData();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đã xóa thành công!')", true);
        }
        catch (Exception)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thất bại!')", true);
        }
    }

    protected void btn_AddProfit_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();

        int amount = 0;
        int.TryParse(Profit_Amount.Value, out amount);
        if (amount == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập số!')", true);
            return;
        }
        int cropstepID = 0;
        int.TryParse(DropDownList1.SelectedValue, out cropstepID);
        var newitem = new DateStatiticProfit
        {
            Title = Profit_Title.Value.Trim(),
            Note = Profit_Detail.Value.Trim(),
            Profit = amount,
            CreateTime = DateTime.Now,
            CropStepID = cropstepID
        };
        db.DateStatiticProfits.Add(newitem);
        try
        {
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thêm thành công!')", true);
            LoadData();
        }
        catch (Exception)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thất bại!')", true);
        }

    }


}