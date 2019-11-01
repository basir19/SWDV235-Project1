<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>



<!doctype html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            //    // Code that uses the data entered by the user
            //    // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "bq_business"].ConnectionString;
            //// Initialize connection
            conn = new SqlConnection(connectionString);
            //// Create command 
            comm = new SqlCommand("EXEC InsertVisitor @fnameTextBox, @lnameTextBox, @countryTextBox, @msgTextBox", conn);
            comm.Parameters.Add("@fnameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@fnameTextBox"].Value = fname.Text;
            comm.Parameters.Add("@lnameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@lnameTextBox"].Value = lname.Text;
            comm.Parameters.Add("@countryTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@countryTextBox"].Value = country.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html"); // should be created
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8"/>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet"/>
<%--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/styles-contact.css"/>
<%--    <script src="js/contact.js" async> </script>--%>

    <style type="text/css">
        .auto-style1 {
            position: absolute;
            color: blue;
            font-size: 2.5em;
            font-weight: bold;
            left: 0px;
            top: 22px;
            padding-left: 10px;
            padding-right: 0;
            padding-top: 40px;
            padding-bottom: 0;
        }
    </style>

</head>
<!--------------------------->

<body>
    <header>
        <div class="logo"><span>Galaxy</span> Drone</div>
        <label class="toggle" for="toggle">&#9776</label>
    </header>

    <nav class="nav">
        <input type="checkbox" id="toggle"/>
        <ul class="menu">
            <li><a href="home.html"><span class="fa fa-home"></span>Home</a></li>
            <li><a href="undercons.html"><span class="fa fa-users"></span>Forum</a></li>
            <li><a href="products.html"><span class="fa fa-list"></span>Our Prodcucts</a></li>
            <li><a href="undercons.html"><span class="fa fa-video"></span>Videos</a></li>
            <li><a href="contact.aspx"><span class="fa fa-info"></span>Contact Us</a></li>
        </ul>
    </nav>
    <hr />

    <!--------------------------->
    
    
    <div class="container">
       <h3>Share your comment with us!</h3>
        <form runat="server">
            <label for="fname">First Name</label>
            <asp:TextBox ID="fname" runat="server" />

            <label for="lname">Last Name</label>
            <asp:TextBox ID="lname" runat="server" />

            <label for="country">Country</label>
            <asp:TextBox ID="country" runat="server" />
      
            <label for="message">Comment:</label>
            <asp:TextBox ID="message" runat="server" />

            <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
                <br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
        </form>
    </div>
    <!--------------------------->

    <footer>
        <hr />
        <p><span>Galaxy</span> <u>Drone</u> &#8226; Software development class, CWI | Copyright &copy; 2019</p><br>

        <section class="footerIcons">
            <a href="https://www.plus.google.com" target="_blank"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
            <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            <a href="https://www.youtube.com" target="_blank"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
        </section>
    </footer>

</body>
</html>