using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
            return;
        }
        DBEntities db = new DBEntities();
        var loadFarm = from d in db.Farms
                       where d.CreateBy == UserSession.user.UserID
                       select new
                       {
                           d.Title,
                           d.Detail,
                           d.FarmID
                       };
        if (loadFarm != null)
        {
            var getUpdateDateFarm = (from d in db.Farms
                                     orderby d.CreateTime descending
                                     select d).FirstOrDefault();
            DateTime date = Convert.ToDateTime(getUpdateDateFarm.CreateTime);

            dateUpdateFarm.InnerText = date.Day.ToString() + "/" + date.Month.ToString() + "/" + date.Year.ToString();

            Repeater_Farm.DataSource = loadFarm.ToList();
            Repeater_Farm.DataBind();

        }

        DropdownList_LoadFarm_AddCrop.DataSource = loadFarm.ToList();
        DropdownList_LoadFarm_AddCrop.DataTextField = "Title";
        DropdownList_LoadFarm_AddCrop.DataValueField = "FarmID";
        DropdownList_LoadFarm_AddCrop.DataBind();
        var loadCrop = from d in db.Crops
                       where d.Farm.CreateBy == UserSession.user.UserID
                       select new {
                       d.Title,
                       d.Description,
                       d.CropID,
                       d.CreateTime,
                       d.UpdateTime,
                       Farm = d.Farm.Title
                       };
        Repeater_Crop.DataSource = loadCrop.ToList();
        Repeater_Crop.DataBind();


        var loadSeed = from d in db.Seeds
                       where d.CreateBy == UserSession.user.UserID
                       select new
                       {
                           d.SeedName,
                           d.SeedType,
                           d.SeedID
                       };
        if (loadSeed != null)
        {
            Repeater_Seed.DataSource = loadSeed.ToList();
            Repeater_Seed.DataBind();
            var getUpdateDateSeed = (from d in db.Farms
                                     orderby d.CreateTime descending
                                     select d).FirstOrDefault();
            DateTime dateSeed = Convert.ToDateTime(getUpdateDateSeed.CreateTime);

            dateUpdateSeed.InnerText = dateSeed.Day.ToString() + "/" + dateSeed.Month.ToString() + "/" + dateSeed.Year.ToString();
        }
        var loadWork = from d in db.Steps
                       where d.isActive == false && d.CropStep.Crop.Farm.CreateBy == UserSession.user.UserID
                       select new
                       {
                           d.CropStep.Title,
                           d.StepName
                       };
        Repeater_Work.DataSource = loadWork.ToList();
        Repeater_Work.DataBind();

        var loadProfits = from d in db.DateStatiticProfits
                         where d.CropStep.Crop.Farm.CreateBy == UserSession.user.UserID
                         select d.Profit;
        var loadSpend = from d in db.Spendings
                         where d.CropStep.Crop.Farm.CreateBy == UserSession.user.UserID
                         select d.Amount;
        var loadCropCount = db.CropSteps.Where(d => d.Crop.Farm.CreateBy == UserSession.user.UserID);
        var loadCropActiveCount = from d in db.CropSteps
                                  where d.Crop.Farm.CreateBy == UserSession.user.UserID  && d.IsActive == true
                                  select d;
        int y = DateTime.Now.Year;
        DateTime fromd = new DateTime(y, 1, 1);
        var loadCropYearCount = from d in db.CropSteps
                                  where d.Crop.Farm.CreateBy == UserSession.user.UserID && d.CreateTime >= fromd
                                select d;
        int SumAmount = 0;
        foreach (var item in loadProfits)
        {
            SumAmount += item.Value;
        }
        Sum_Amount.InnerText = SumAmount.ToString();

        int SumSpend = 0;
        foreach (var item in loadSpend)
        {
            SumSpend += item.Value;
        }
        Sum_Spend.InnerText = SumSpend.ToString();
        Sum_CropStep.InnerText = loadCropCount.Count().ToString();
        Sum_CropStepYear.InnerText = loadCropYearCount.Count().ToString();
        CropActive.InnerText = loadCropActiveCount.Count().ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object[] GetSpendingChart(DateTime fromdate, DateTime todate)
    {

        DBEntities db = new DBEntities();
        //var data = (from o in db.Orders
        //            join d in db.OrderDetails on o.OrderID equals d.OrderID
        //            join p in db.Products on d.ProductID equals p.ProductID
        //            where o.CreateTime >= fromDate && o.CreateTime <= toDate
        //            select new
        //            {
        //                d.Quantity,
        //                p.Name
        //            }
        //         ).ToList();
        var data = (from d in db.Spendings
                    where d.Amount != null && d.CropStep.Crop.Farm.CreateBy == UserSession.user.UserID && d.CreateTime >= fromdate && d.CreateTime <= todate
                    orderby d.CreateTime descending
                    select new
                    {
                        d.Title,
                        d.Amount
                    }).Take(20).ToList();
        var chartdata = new object[data.Count() + 1];
        chartdata[0] = new object[]
        {
            "Title",
            "Amount"
        };
        int j = 0;
        foreach (var item in data)
        {
            j++;
            chartdata[j] = new object[] { item.Title, item.Amount };
        }
        return chartdata;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object[] GetProfitChart(DateTime fromdate, DateTime todate)
    {

        DBEntities db = new DBEntities();
        //var data = (from o in db.Orders
        //            join d in db.OrderDetails on o.OrderID equals d.OrderID
        //            join p in db.Products on d.ProductID equals p.ProductID
        //            where o.CreateTime >= fromDate && o.CreateTime <= toDate
        //            select new
        //            {
        //                d.Quantity,
        //                p.Name
        //            }
        //         ).ToList();
        var data = (from d in db.DateStatiticProfits
                    where d.Profit != null && d.CropStep.Crop.Farm.CreateBy == UserSession.user.UserID && d.CreateTime >= fromdate && d.CreateTime <= todate
                    orderby d.CreateTime descending
                    select new
                    {
                        d.Title,
                        d.Profit
                    }).Take(20).ToList();
        var chartdata = new object[data.Count() + 1];
        chartdata[0] = new object[]
        {
            "Title",
            "Profit"
        };
        int j = 0;
        foreach (var item in data)
        {
            j++;
            chartdata[j] = new object[] { item.Title, item.Profit };
        }
        return chartdata;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addSeedRow(int id, string SeedName, string SeedType, int PlantingMonth, string Evaluate)
    {
        var userID = UserSession.user.UserID;
        DBEntities db = new DBEntities();
        if (id == 0)
        {
            var newitem = new Seed
            {
                SeedName = SeedName,
                SeedType = SeedType,
                PlantingMonth = PlantingMonth,
                Evaluate = Evaluate,
                CreateTime = DateTime.Now,
                CreateBy = userID
            };
            db.Seeds.Add(newitem);
            try
            {
                db.SaveChanges();
                return "Bạn đã thêm thành công: " + SeedName + " !";

            }
            catch (Exception)
            {
                return "Thất bại";
            }

        }
        else
        {
            var item = db.Seeds.Where(d => d.SeedID == id).FirstOrDefault();
            item.SeedName = SeedName;
            item.SeedType = SeedType;
            item.PlantingMonth = PlantingMonth;
            item.Evaluate = Evaluate;
            try
            {
                db.SaveChanges();
                return "Bạn đã sửa thành công: " + SeedName + " !";

            }
            catch (Exception)
            {
                return "Thất bại";
            }
        }
    }

    protected void btn_AddCrop_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();

        int farmID = 0;
        int.TryParse(DropdownList_LoadFarm_AddCrop.SelectedValue, out farmID);
        var newitem = new Crop
        {
            Title = Crop_Title.Value.Trim(),
            Description = Crop_Detail.Value.Trim(),
            CreateTime = DateTime.Now,
            FarmID = farmID
        };
        db.Crops.Add(newitem);
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

    protected void btn_delete_Crop_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        int id = 0;
        int.TryParse(btn.CommandArgument, out id);
        DBEntities db = new DBEntities();
        var step = db.Steps.Where(d => d.CropStep.CropID == id);
        var spend = db.Spendings.Where(d => d.CropStep.CropID == id);
        var weather = db.WeatherNotes.Where(d => d.CropStep.CropID == id);
        var cropstep = db.CropSteps.Where(d => d.CropID == id);
        var crop = db.Crops.Where(d => d.CropID == id).FirstOrDefault();

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


        db.Crops.Remove(crop);
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


}