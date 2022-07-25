using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
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
        UserName.InnerText = UserSession.user.Name;
        DBEntities db = new DBEntities();
        var loadfarm = db.Farms.Where(d => d.CreateBy == UserSession.user.UserID);
        Repeater_LoadFarm.DataSource = loadfarm.ToList();
        Repeater_LoadFarm.DataBind();
        var loadCropStep = from d in db.CropSteps
                           where d.IsActive == true && d.Crop.Farm.CreateBy == UserSession.user.UserID
                           select new
                           {
                               d.Title,
                               d.CropStepID
                           };
        Repeater_LoadCropStep.DataSource = loadCropStep.ToList();
        Repeater_LoadCropStep.DataBind();
    }


    protected void Btn_Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Login.aspx");
    }
}
