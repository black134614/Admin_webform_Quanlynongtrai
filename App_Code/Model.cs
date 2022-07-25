﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Crop
{
    public Crop()
    {
        this.CropSteps = new HashSet<CropStep>();
    }

    public int CropID { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public Nullable<int> FarmID { get; set; }
    public Nullable<System.DateTime> UpdateTime { get; set; }

    public virtual Farm Farm { get; set; }
    public virtual ICollection<CropStep> CropSteps { get; set; }
}

public partial class CropStep
{
    public CropStep()
    {
        this.DateStatiticProfits = new HashSet<DateStatiticProfit>();
        this.Spendings = new HashSet<Spending>();
        this.WeatherNotes = new HashSet<WeatherNote>();
        this.Steps = new HashSet<Step>();
    }

    public int CropStepID { get; set; }
    public string Title { get; set; }
    public string Detail { get; set; }
    public string Evaluate { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public Nullable<System.DateTime> UpdateTime { get; set; }
    public Nullable<int> CropID { get; set; }
    public Nullable<bool> IsActive { get; set; }
    public Nullable<int> SeedID { get; set; }
    public Nullable<bool> IsDelete { get; set; }

    public virtual Crop Crop { get; set; }
    public virtual Seed Seed { get; set; }
    public virtual ICollection<DateStatiticProfit> DateStatiticProfits { get; set; }
    public virtual ICollection<Spending> Spendings { get; set; }
    public virtual ICollection<WeatherNote> WeatherNotes { get; set; }
    public virtual ICollection<Step> Steps { get; set; }
}

public partial class DateStatiticProfit
{
    public int ProfitID { get; set; }
    public string Title { get; set; }
    public Nullable<int> CropStepID { get; set; }
    public Nullable<int> Quantity { get; set; }
    public Nullable<int> Profit { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public string Note { get; set; }

    public virtual CropStep CropStep { get; set; }
}

public partial class Farm
{
    public Farm()
    {
        this.Crops = new HashSet<Crop>();
    }

    public int FarmID { get; set; }
    public string Title { get; set; }
    public string Detail { get; set; }
    public string Location { get; set; }
    public Nullable<bool> isActive { get; set; }
    public string CreateBy { get; set; }
    public string Note { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }

    public virtual ICollection<Crop> Crops { get; set; }
    public virtual User User { get; set; }
}

public partial class Role
{
    public Role()
    {
        this.Users = new HashSet<User>();
    }

    public int RoleID { get; set; }
    public string Name { get; set; }

    public virtual ICollection<User> Users { get; set; }
}

public partial class Seed
{
    public Seed()
    {
        this.CropSteps = new HashSet<CropStep>();
    }

    public int SeedID { get; set; }
    public string SeedName { get; set; }
    public string SeedType { get; set; }
    public string Evaluate { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public string CreateBy { get; set; }
    public Nullable<int> PlantingMonth { get; set; }

    public virtual ICollection<CropStep> CropSteps { get; set; }
    public virtual User User { get; set; }
}

public partial class Spending
{
    public int SpendingID { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public Nullable<int> CropStepID { get; set; }
    public Nullable<int> Amount { get; set; }

    public virtual CropStep CropStep { get; set; }
}

public partial class Step
{
    public int StepID { get; set; }
    public string StepName { get; set; }
    public string Description { get; set; }
    public Nullable<int> Oder { get; set; }
    public Nullable<System.DateTime> CreateDate { get; set; }
    public Nullable<System.DateTime> UpdateDate { get; set; }
    public Nullable<int> CropStepID { get; set; }
    public Nullable<bool> isActive { get; set; }

    public virtual CropStep CropStep { get; set; }
}

public partial class sysdiagram
{
    public string name { get; set; }
    public int principal_id { get; set; }
    public int diagram_id { get; set; }
    public Nullable<int> version { get; set; }
    public byte[] definition { get; set; }
}

public partial class User
{
    public User()
    {
        this.Farms = new HashSet<Farm>();
        this.Seeds = new HashSet<Seed>();
    }

    public string UserID { get; set; }
    public string Password { get; set; }
    public string Name { get; set; }
    public string Address { get; set; }
    public string Email { get; set; }
    public string PhoneNumber { get; set; }
    public string Avatar { get; set; }
    public Nullable<int> UserRole { get; set; }
    public Nullable<bool> IsActive { get; set; }

    public virtual ICollection<Farm> Farms { get; set; }
    public virtual Role Role { get; set; }
    public virtual ICollection<Seed> Seeds { get; set; }
}

public partial class WeatherNote
{
    public int WeatherID { get; set; }
    public string CreatTime { get; set; }
    public Nullable<int> CreateBy { get; set; }
    public string Evaluate { get; set; }
    public Nullable<bool> isDelete { get; set; }
    public Nullable<int> CropStepID { get; set; }

    public virtual CropStep CropStep { get; set; }
}

public partial class sp_helpdiagramdefinition_Result
{
    public Nullable<int> version { get; set; }
    public byte[] definition { get; set; }
}

public partial class sp_helpdiagrams_Result
{
    public string Database { get; set; }
    public string Name { get; set; }
    public int ID { get; set; }
    public string Owner { get; set; }
    public int OwnerID { get; set; }
}