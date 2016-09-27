﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebAdminMaster.Master" AutoEventWireup="true" CodeBehind="historymaintenance.aspx.cs" Inherits="AnotherWebProgFinals.Administrator.historymaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- OLD DESIGN FOR HISTORY MAINTE -->
    <div class="container">
        <h1 class="center" style="font-weight: 600; color: #388E3C">CITY HISTORY</h1>
    </div>

    <asp:SqlDataSource ID="CityHistoryDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:webprog %>"
        InsertCommand="INSERT INTO [CityHistory] ([txtHistory]) VALUES (@txtHistory)" OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [CityHistory]" UpdateCommand="UPDATE [CityHistory] SET [txtHistory] = @txtHistory WHERE [HistoryID] = @original_HistoryID">
        <UpdateParameters>
            <asp:Parameter Name="HistoryID" Type="Int32" />
            <asp:Parameter Name="txtHistory" Type="String" />
            <asp:Parameter Name="original_HistoryID" Type="Int32" />
            <asp:Parameter Name="original_txtHistory" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div id="HistoryItemPlaceholderContainer" runat="server" class="center">
        <div class="container">
            <div class="col-md-2"></div>
            <div class="">
                <asp:ListView ID="CityHistoryListView" runat="server" DataKeyNames="HistoryID" DataSourceID="CityHistoryDataSource">
                    <ItemTemplate>
                        <div class="">
                            <div class="form-group">
                                <asp:Label ID="lblPrevCityHistory" runat="server" CssClass="control-label col-md-12 col-sm-12" AssociatedControlID="txtCityHistoryPrev">City History: </asp:Label><br />
                                <div class="col-md-12 col-sm-12" style="text-align: justify; padding-left: 5%; padding-right: 5%">
                                    <asp:Label ID="txtCityHistoryPrev" CssClass="materialize-textarea" runat="server" Text='<%# Eval("txtHistory").ToString().Replace(Environment.NewLine,"<br />") %>' /><br />
                                </div>
                            </div>
                            <br /><br />
                            <asp:Button ID="EditButton" class="waves-effect green btn center-align" runat="server" CommandName="Edit" Text="Edit" />
                        </div>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <div class="center">
                            <asp:Label ID="lblEditCityHistory" runat="server" CssClass="control-label col-md-12 col-sm-12" AssociatedControlID="txtEditCityHistory">City History: </asp:Label><br />
                            <div class="col-md-12 col-sm-12" style="text-align: center;">
                                <asp:TextBox ID="txtEditCityHistory" TextMode="MultiLine" CssClass="materialize-textarea" runat="server" Text='<%# Bind("txtHistory") %>' /><br />
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <asp:Button ID="UpdateButton" runat="server" class="waves-effect green btn center-align" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" class="waves-effect green btn center-align" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </EditItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <br />
    <br />
    <!-- END FOR OLD DESIGN HISTORY MAINTE -->
</asp:Content>
