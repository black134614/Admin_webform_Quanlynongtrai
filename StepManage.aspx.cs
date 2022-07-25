using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StepManage : System.Web.UI.Page
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
        int CropStepID = 0;
        int.TryParse(Request.QueryString["CropStepID"], out CropStepID);
        DBEntities db = new DBEntities();
        var get = db.CropSteps.Where(d => d.CropStepID == CropStepID).Select(d => d.Crop.FarmID).FirstOrDefault();
        int farmID = get.Value;
        getId.HRef = "farmDetail.aspx?farmID=" + farmID;
        LoadContent(CropStepID);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object[] LoadContent(int id)
    {
        DBEntities db = new DBEntities();
        var data = (from d in db.Steps
                    where d.CropStepID == id
                    select new
                    {
                        d.StepName,
                        d.Description,
                        d.StepID,
                        d.isActive,
                        d.UpdateDate
                    }).ToList();
        var sdata = new object[data.Count()];
        int j = 0;
        foreach (var item in data)
        {
            sdata[j] = new object[] { item.StepID, item.StepName, item.Description, item.isActive, item.UpdateDate };
            j++;
        }
        return sdata;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string DeleteRow(int id)
    {
        DBEntities db = new DBEntities();
        var deleteStep = db.Steps.Where(d => d.StepID == id).FirstOrDefault();
        string sp = deleteStep.StepName;
        db.Steps.Remove(deleteStep);
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
    public static string activeRow(int id)
    {
        DBEntities db = new DBEntities();
        var item = db.Steps.Where(d => d.StepID == id).FirstOrDefault();
        string sp = item.StepName;
        if (item.isActive == null)
        {
            item.isActive = false;
        }
        item.isActive = !item.isActive;
        try
        {
            db.SaveChanges();

        }
        catch (Exception)
        {
            return "Thất bại";
        }

        return "Bạn đã hoàn thành công đoạn: " + sp + " !";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object[] LoadEditRow(int id)
    {
        DBEntities db = new DBEntities();
        var data = (from d in db.Steps
                    where d.StepID == id
                    select new
                    {
                        d.StepName,
                        d.Description,
                        d.StepID,
                        d.isActive,
                    }).ToList();
        var sdata = new object[data.Count()];
        int j = 0;
        foreach (var item in data)
        {
            sdata[j] = new object[] { item.StepName, item.Description, item.isActive };
            j++;
        }
        return sdata;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addRow(int id, int cropStepID, string name, string description, bool isActive)
    {
        DBEntities db = new DBEntities();
        if (id == 0)
        {
            var newitem = new Step
            {
                StepName = name,
                Description = description,
                isActive = isActive,
                CreateDate = DateTime.Now,
                UpdateDate = DateTime.Now,
                CropStepID = cropStepID
            };
            db.Steps.Add(newitem);
            try
            {
                db.SaveChanges();
                return "Bạn đã thêm thành công: " + name + " !";

            }
            catch (Exception)
            {
                return "Thất bại";
            }

        }
        else
        {
            var item = db.Steps.Where(d => d.StepID == id).FirstOrDefault();
            if (item.isActive == null)
            {
                item.isActive = false;
            }
            item.StepName = name;
            item.Description = description;
            item.isActive = !item.isActive;
            item.UpdateDate = DateTime.Now;
            try
            {
                db.SaveChanges();
                return "Bạn đã sửa thành công: " + name + " !";

            }
            catch (Exception)
            {
                return "Thất bại";
            }
        }
    }
}