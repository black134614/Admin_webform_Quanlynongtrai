using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CropStepEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            page_mesage.Visible = false;
        }
    }


    static string NullToString(object Value)
    {

        // Value.ToString() allows for Value being DBNull, but will also convert int, double, etc.
        return Value == null ? "" : Value.ToString();

        // If this is not what you want then this form may suit you better, handles 'Null' and DBNull otherwise tries a straight cast
        // which will throw if Value isn't actually a string object.
        //return Value == null || Value == DBNull.Value ? "" : (string)Value;


    }
    public void LoadData()
    {
        if (UserSession.user == null)
        {
            Response.Redirect("~/login.aspx");
        }
        int cropStepID = 0;
        int.TryParse(Request.QueryString["cropStepID"], out cropStepID);
        int farmID = 0;
        int.TryParse(Request.QueryString["farmID"], out farmID);
        DBEntities db = new DBEntities();
        var loadSeed = db.Seeds.Where(d=>d.CreateBy == UserSession.user.UserID);
        var loadCrop = db.Crops.Where(d => d.Farm.CreateBy == UserSession.user.UserID);
        dropdown_Seed.DataSource = loadSeed.ToList();
        dropdown_Seed.DataValueField = "SeedID";
        dropdown_Seed.DataTextField = "SeedName";
        dropdown_Seed.DataBind();
        dropdown_Crop.DataSource = loadCrop.Where(d => d.FarmID == farmID).ToList();
        dropdown_Crop.DataValueField = "CropID";
        dropdown_Crop.DataTextField = "Title";
        dropdown_Crop.DataBind();
        var get = db.CropSteps.Where(d => d.CropStepID == cropStepID).Select(d => d.Crop.FarmID).FirstOrDefault();

        if (cropStepID > 0)
        {
            farmID = get.Value;
            getId.HRef = "farmDetail.aspx?farmID=" + farmID;
            var query = db.CropSteps.Where(d => d.CropStepID == cropStepID).FirstOrDefault();
            if (query != null)
            {
                input_Title.Value = NullToString(query.Title);
                input_Detail.Value = NullToString(query.Detail);
                textarea_Evalute.Value = NullToString(query.Evaluate);
                checkbox_Active.Checked = false;
                if ((bool)query.IsActive)
                {
                    checkbox_Active.Checked = true;
                }
                string seedID = NullToString(query.SeedID);
                string cropID = NullToString(query.CropID);
                dropdown_Seed.SelectedIndex = dropdown_Seed.Items.IndexOf(dropdown_Seed.Items.FindByValue(seedID));
                dropdown_Crop.SelectedIndex = dropdown_Crop.Items.IndexOf(dropdown_Crop.Items.FindByValue(cropID));
            }
        }
        getId.HRef = "farmDetail.aspx?farmID=" + farmID;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int cropStepID = 0;
        int.TryParse(Request.QueryString["cropStepID"], out cropStepID);
        int cropID = 0;
        int.TryParse(dropdown_Crop.SelectedValue, out cropID);
        int seedID = 0;
        int.TryParse(dropdown_Seed.SelectedValue, out seedID);

        DBEntities db = new DBEntities();

        if (cropStepID > 0)
        {
            var query = db.CropSteps.Where(d => d.CropStepID == cropStepID).FirstOrDefault();
            query.Title = input_Title.Value.Trim();
            query.Detail = input_Detail.Value.Trim();
            query.Evaluate = textarea_Evalute.Value;
            query.CropID = cropID;
            query.SeedID = seedID;
            query.UpdateTime = DateTime.Now;
            if (checkbox_Active.Checked)
            {
                query.IsActive = true;
            }
            else query.IsActive = false;
            try
            {
                db.SaveChanges();
                LoadData();
                page_mesage.Visible = true;
                page_mesage.InnerText = "Lưu thay đổi thành công";
            }
            catch (Exception)
            {
                page_mesage.InnerText = "Lưu thay đổi không thành công";
            }
        }
        else
        {
            bool isActive = false;
            if (checkbox_Active.Checked)
            {
                isActive = true;
            }
            var newIem = new CropStep()
            {
                Title = input_Title.Value.Trim(),
                Detail = input_Detail.Value.Trim(),
                Evaluate = textarea_Evalute.Value,
                CropID = cropID,
                SeedID = seedID,
                UpdateTime = DateTime.Now,
                IsActive = isActive
            };
            db.CropSteps.Add(newIem);
            try
            {
                db.SaveChanges();
                LoadData();
                page_mesage.Visible = true;
                page_mesage.InnerText = "Thêm mới thành công";
            }
            catch (Exception)
            {
                page_mesage.InnerText = "Thêm mới không thành công";
            }
        }
    }
}