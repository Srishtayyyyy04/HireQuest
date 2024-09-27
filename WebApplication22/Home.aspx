<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication22.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HireQuest</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <div class="logo">
            <h1>HireQuest.</h1>
        </div>
        <nav>
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="login.aspx" class="btn">Login</a></li>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <div class="container">
            <div class="hero-text">
                <h2>Finding the <br /> job beyond<br /> borders</h2>
                <p>Discover job you love, research the fastest-growing companies, and start your career journey.</p>
                <div class="search-bar">
    <asp:TextBox ID="searchTextBox" runat="server" Placeholder="Search by company or role..."></asp:TextBox>
    <asp:DropDownList ID="cityDropDownList" runat="server">
        <asp:ListItem Value="">Location</asp:ListItem>
        <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
        <asp:ListItem Value="Bangalore">Bangalore</asp:ListItem>
        <asp:ListItem Value="Delhi">Delhi</asp:ListItem>
        <asp:ListItem Value="Chennai">Chennai</asp:ListItem>
        <asp:ListItem Value="Hyderabad">Hyderabad</asp:ListItem>
        <asp:ListItem Value="Pune">Pune</asp:ListItem>
        <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
        <asp:ListItem Value="Kolkata">Kolkata</asp:ListItem>
        <asp:ListItem Value="Jaipur">Jaipur</asp:ListItem>
        <asp:ListItem Value="Noida">Noida</asp:ListItem>
        <asp:ListItem Value="Gurgaon">Gurgaon</asp:ListItem>
        <asp:ListItem Value="Vadodara">Vadodara</asp:ListItem>
        <asp:ListItem Value="Coimbatore">Coimbatore</asp:ListItem>
        <asp:ListItem Value="Surat">Surat</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" CssClass="btn" />
    
</div>
                <section class="result-message">
    <div id="resultMessage" runat="server"></div>
</section>

            </div>
            <div class="hero-image">
                <img src="didi.png" alt="Hero Image">
            </div>
        </div>
    </section>
    <section class="companies">
        <div class="container">
            <div class="company">
                 <a href="https://stripe.com/in/jobs" target="_blank">
                <img src="stripe.png" alt="Stripe Logo">
                     </a>
            </div>
            <div class="company">
                 <a href="https://careers.adobe.com/us/en" target="_blank">
                <img src="adobe.png" alt="Adobe Logo" class="adobe">
                      </a>
            </div>
            <div class="company">
                 <a href="https://www.google.com/about/careers/applications/" target="_blank">
                <img src="google.png" alt="Google Logo" class="google">
                       </a>
            </div>
            <div class="company">
                 <a href="https://careers.microsoft.com/v2/global/en/home.html" target="_blank">
                <img src="micro.png" alt="Microsoft Logo" class="micro">
                     </a>
            </div>
        </div>
    </section>
    <div class="containerjobsr1">
         <div class="containerjobs-header">
        <h2>Job Categories</h2>
        <p>Get hired as per your convenience</p>
    </div>
        <div class="card">
            <i class="fas fa-home"></i>
            <h3>Remote</h3>
        </div>
        <div class="card">
            <i class="fas fa-building"></i>
            <h3>MNC</h3>
        </div>
        <div class="card">
            <i class="fas fa-desktop"></i>
            <h3>Software &...</h3>
        </div>
        <div class="card">
            <i class="fas fa-box"></i>
            <h3>Supply Chain</h3>
        </div>
        <div class="card">
            <i class="fas fa-chart-line"></i>
            <h3>Data Science</h3>
        </div>
        <div class="card">
            <i class="fas fa-cog"></i>
            <h3>Engineering</h3>
          
        </div>
        <div class="card">
            <i class="fas fa-award"></i>
            <h3>Fortune 500</h3>
            
        </div>


          </div>
      <div class="containerjobsr2">
        <div class="card">
            <i class="fas fa-certificate"></i>
            <h3>Internship</h3>
         
        </div>
        <div class="card">
            <i class="fas fa-briefcase"></i>
            <h3>Sales</h3>
          
        </div>
        <div class="card">
            <i class="fas fa-chart-line"></i>
            <h3>Marketing</h3>
          
        </div>
        <div class="card">
            <i class="fas fa-rocket"></i>
            <h3>Startup</h3>
           
        </div>
           <div class="card">
    <i class="fa-solid fa-book"></i>
     <h3>Data Entry</h3>
    
 </div>
           <div class="card">
    <i class="fa-brands fa-free-code-camp"></i>
     <h3>Freelance</h3>
    
 </div>
           <div class="card">
    <i class="fa-solid fa-signature"></i>
     <h3>Content Writing</h3>
    
 </div>
  </div>
    <section class="trust">
        <h1>Top companies trust us</h1>
        <div class="containertrust">
            <!-- Duplicate the logos to create a seamless loop effect -->
            <div class="logo">
                <img src="nykaa.png" alt="Nykaa Logo">
            </div>
            <div class="logo">
                <img src="decathalon.png" alt="Decathlon Logo">
            </div>
            <div class="logo">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png" alt="Amazon Logo">
            </div>
            <div class="logo">
                <img src="oyo.png" alt="Oyo Logo">
            </div>
            <div class="logo">
                <img src="bookmyshow.png" alt="BookMyShow Logo">
            </div>
            <div class="logo">
                <img src="paytm.png" alt="Paytm Logo">
            </div>
            <div class="logo">
                <img src="swiggy.png" alt="Swiggy Logo">
            </div>
            <!-- Duplicate the logos -->
            <div class="logo">
                <img src="nykaa.png" alt="Nykaa Logo">
            </div>
            <div class="logo">
                <img src="decathalon.png" alt="Decathlon Logo">
            </div>
            <div class="logo">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png" alt="Amazon Logo">
            </div>
            <div class="logo">
                <img src="oyo.png" alt="Oyo Logo">
            </div>
            <div class="logo">
                <img src="bookmyshow.png" alt="BookMyShow Logo">
            </div>
            <div class="logo">
                <img src="paytm.png" alt="Paytm Logo">
            </div>
            <div class="logo">
                <img src="swiggy.png" alt="Swiggy Logo">
            </div>
        </div>
    </section>

    <section class="jobs">
    <div class="container">
        <h2>Latest Jobs Opportunity</h2>
        <p>Find a job you love, research the fastest-growing companies</p>
        <div class="jobs-grid">
            <div class="job-card">
                <div class="job-icon">
                    <img src="googlle.png" alt="Job Icon">
                </div>
                <div class="job-info">
                    <h3>Software Engineer</h3>
                    <p>Google</p>
                    <small>Location: Mountain View, CA</small>
                    <p>Join our team to work on cutting-edge technology.</p>
                </div>
            </div>
            <div class="job-card">
                <div class="job-icon">
                    <img src="adobee.png" alt="Job Icon">
                </div>
                <div class="job-info">
                    <h3>Data Analyst</h3>
                    <p>Adobe</p>
                    <small>Location: San Jose, CA</small>
                    <p>Analyze data trends to drive business decisions.</p>
                </div>
            </div>
            <div class="job-card">
                <div class="job-icon">
                    <img src="strippee.png" alt="Job Icon">
                </div>
                <div class="job-info">
                    <h3>Product Manager</h3>
                    <p>Stripe</p>
                    <small>Location: Dublin, Ireland</small>
                    <p>Lead product development and strategy.</p>
                </div>
            </div>
            <div class="job-card">
                <div class="job-icon">
                    <img src="microsoftt.png" alt="Job Icon">
                </div>
                <div class="job-info">
                    <h3>UX Designer</h3>
                    <p>Microsoft</p>
                    <small>Location: Redmond, WA</small>
                    <p>Create user-centered designs for our products.</p>
                </div>
            </div>
            <div class="job-card">
                <div class="job-icon">
                    <img src="amazzonn.png" alt="Job Icon">
                </div>
                <div class="job-info">
                    <h3>Marketing Specialist</h3>
                    <p>Amazon</p>
                    <small>Location: Seattle, WA</small>
                    <p>Develop and implement marketing strategies.</p>
                </div>
            </div>
            <div class="job-card">
                <div class="job-icon">
                    <img src="paytttmmm.png" alt="Job Icon">
                </div>
                <div class="job-info">
                    <h3>Content Writer</h3>
                    <p>Paytm</p>
                    <small>Location: Noida, India</small>
                    <p>Produce engaging content for our platforms.</p>
                </div>
            </div>
        </div>
    </div>
</section>

         </form>
    <footer>
        <div class="container">
            <p>Copyright © 2024 HireQuest. All rights reserved.</p>
        </div>
    </footer>

  <script>
      document.addEventListener('DOMContentLoaded', function () {
          setTimeout(function () {
              var popupContainer = document.querySelector('.popup-container');
              if (popupContainer) {
                  popupContainer.style.display = 'flex'; // Use 'flex' to match the CSS
              }
          }, 10000); // 5000 milliseconds delay
      });
      document.addEventListener('DOMContentLoaded', function () {
          setTimeout(function () {
              var popupContainer = document.querySelector('.popup-container2');
              if (popupContainer) {
                  popupContainer.style.display = 'flex'; // Use 'flex' to match the CSS
              }
          }, 10000); // 5000 milliseconds delay
      });

      const container = document.querySelector('.containerjobsr1');

      container.addEventListener('click', function () {
          container.classList.add('no-animation');
      });

      container.addEventListener('mouseenter', function () {
          container.classList.add('no-animation');
      });

      container.addEventListener('mouseleave', function () {
          container.classList.remove('no-animation');
      });
      const container2 = document.querySelector('.containerjobsr2');

      container2.addEventListener('click', function () {
          container2.classList.add('no-animation');
      });

      container2.addEventListener('mouseenter', function () {
          container2.classList.add('no-animation');
      });

      container2.addEventListener('mouseleave', function () {
          container2.classList.remove('no-animation');
      });
  </script>

</body>
</html>



