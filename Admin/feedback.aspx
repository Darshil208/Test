﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Admin_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageheader">
        <div class="pageicon"><span class="iconfa-pencil"></span></div>
        <div class="pagetitle">
            <h1>Feedback</h1>
        </div>
    </div>
    <div class="maincontent">
        <div class="maincontentinner">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <h4 class="widgettitle">Feedback Grid</h4>
                    <table class="table">
                        <tr>
                            <td>
                                <%--<asp:Button ID="btnaddnew" runat="server" Text="Add New" OnClick="btnaddnew_Click" CssClass="btn btn-primary" />--%>
                                <asp:Button ID="btnselectall" runat="server" Text="Select All" OnClick="btnselectall_Click" CssClass="btn btn-primary" />
                                <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" CssClass="btn btn-primary" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-bordered table-hover">
                                    <Columns>
                                        <asp:TemplateField ControlStyle-Width="30" ItemStyle-Width="30">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowSelectButton="True" ItemStyle-Width="30"   SelectImageUrl="../Images/edit.png" ButtonType="Image" ControlStyle-Width="30" ControlStyle-Height="30" />
                                        <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="30"  DeleteImageUrl="../Images/drop.png" ButtonType="Image" ControlStyle-Width="30" ControlStyle-Height="30" />
                                        <asp:BoundField HeaderText="ID" DataField="feedbackid" />
                                        <asp:BoundField HeaderText="First Name" DataField="firstname" />
                                        <asp:BoundField HeaderText="Last Name" DataField="lastname" />
                                        <asp:BoundField HeaderText="Mobile" DataField="mobile" />
                                        <asp:BoundField HeaderText="Email" DataField="email" />
                                        <asp:BoundField HeaderText="Service Provider" DataField="serviceprovidername" />
                                        <asp:BoundField HeaderText="Feedback Date" DataField="feedbackdate" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>



                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="widget">
                        <h4 class="widgettitle">Feedback Detail</h4>
                        <div class="widgetcontent">

                            <div class="stdform">
                                <p>
                                    <label>Feedback Content</label>
                                    <span class="field">
                                        <asp:TextBox ID="txtfeedbackcontent" runat="server"></asp:TextBox>
                                    </span>
                                    <%--<small class="desc">Small description of this field.</small>--%>
                                </p>
                                <p>
                                    <label>Customer name</label>
                                    <span class="field">
                                        <asp:DropDownList ID="drpcustomerid" runat="server"></asp:DropDownList>
                                    </span>
                                    <%--<small class="desc">Small description of this field.</small>--%>
                                </p>
                                <p>
                                    <label>Service Provider Name</label>
                                    <span class="field">
                                        <asp:DropDownList ID="drpserviceproviderid" runat="server"></asp:DropDownList>
                                    </span>
                                    <%--<small class="desc">Small description of this field.</small>--%>
                                </p>
                                <p>
                                    <label>Feedback Date</label>
                                    <span class="field">
                                        <asp:TextBox ID="txtfeedbackdate" runat="server"></asp:TextBox>
                                    </span>
                                    <%--<small class="desc">Small description of this field.</small>--%>
                                </p>
 <p class="stdformbutton">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnsubmit_Click" />
                                    <asp:Button ID="btnreset" runat="server" Text="Reset" class="btn btn-primary" OnClick="btnreset_Click"/>
                                    <asp:Button ID="btncancle" runat="server" Text="Cancle" class="btn btn-primary" OnClick="btncancel_Click"/>
                                </p>>
                            </div>
                        </div>
                        <!--widgetcontent-->
                    </div>
                    <!--widget-->




                </asp:View>
            </asp:MultiView>

                        <div class="footer">
                <div class="footer-left">
                    <span>Copyright &copy; Majesty IT Services 2015-2016. All Rights Reserved.</span>
                </div>
                <div class="footer-right">
                    <span>Developed by: <a href="http://majestyservices.in/">Darshil, Jashna, Dhara - LJ CE Trainee</a></span>
                </div>
            </div>
            <!--footer-->

        </div>
        <!--maincontentinner-->
    </div>


</asp:Content>

