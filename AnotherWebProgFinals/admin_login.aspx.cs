﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnotherWebProgFinals
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string queryString = "SELECT strLogoPath FROM dbo.LogoBanner";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["webprog"].ConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        string cityLogo = (String)reader["strLogoPath"];
                        CityLogo.ImageUrl = cityLogo;
                        //CityLogo.ImageUrl = cityLogo;
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}