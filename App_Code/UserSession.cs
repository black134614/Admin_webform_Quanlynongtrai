using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserSession
/// </summary>
public class UserSession
{
    public static User user
    {
        get
        {
            return HttpContext.Current.Session["User"] as User;
        }
        set
        {
            HttpContext.Current.Session["User"] = value;
        }
    }
}