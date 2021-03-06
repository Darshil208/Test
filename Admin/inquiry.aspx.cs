﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
public partial class Admin_inquiry : System.Web.UI.Page
{
    BALInquiry objinquirybal = new BALInquiry();
    DALInquiry objinquirydal = new DALInquiry();
    public void resetconrol()
    {
        btnsubmit.Text = "Submit";
    }
    public void bindgrid()
    {
        GridView1.DataSource = objinquirydal.selectInquiry();
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userrole"] == null || Session["userrole"].ToString() != "Admin" || Session["username"] == null || Session["username"].ToString() == "")
        {
            Response.Redirect("../Login.aspx");
        }
        if (!IsPostBack)
        {
            bindgrid();
        }
    }
    protected void btnaddnew_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnselectall_Click(object sender, EventArgs e)
    {
        CheckBox cb = new CheckBox();
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");

            if (!cb.Checked)
            {
                cb.Checked = true;
            }
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        CheckBox cb = new CheckBox();
        bool flag = false;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");

            if (cb.Checked)
            {
                int id = Convert.ToInt32(GridView1.Rows[i].Cells[3].Text);
                objinquirydal.deleteInquiry(id);
                flag = false;
            }
        }
        if (flag)
        {
            Response.Write("<script>alert('Record deleted');</script>");
            bindgrid();
        }
        else
        {
            Response.Write("<script>alert('Please select record to delete');</script>");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (btnsubmit.Text == "Submit")
        {
            objinquirydal.insertInquiry(objinquirybal);
            Response.Write("<script>alert('Record inseted');</script>");
        }
        else
        {
            objinquirybal.inquiryID = Convert.ToInt32(GridView1.SelectedRow.Cells[3].Text);
            objinquirydal.updateInquiry(objinquirybal);
            Response.Write("<script>alert('Record updated');</script>");
        }
        bindgrid();
        resetconrol();
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        resetconrol();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        resetconrol();
        MultiView1.ActiveViewIndex = 0;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(GridView1.SelectedRow.Cells[3].Text);

        DataSet ds = new DataSet();
        ds = objinquirydal.selectInquiryID(id);

        if (ds.Tables[0].Rows.Count > 0)
        {
            btnsubmit.Text = "Update";
            MultiView1.ActiveViewIndex = 1;
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[3].Text);
        objinquirydal.deleteInquiry(id);
        bindgrid();
        Response.Write("<script>alert('Record deleted');</script>");
    }
}