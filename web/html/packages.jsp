<%@ page import="java.util.List" %>
<%@ page import="com.htransplant.beans.HairPackage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">



    <title>Packages</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for carousel -->
    <link href="../css/carousel.css" rel="stylesheet">

    <!-- Custom styles for menu products -->
    <link href="../css/product.css" rel="stylesheet">
  </head>
  <body>


  <nav class="site-header sticky-top py-1">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
      <a class="py-2" href="#">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
      </a>
      <a class="py-2 d-none d-md-inline-block" href="/home">Home</a>
      <a class="py-2 d-none d-md-inline-block" href="/packages">Packages</a>
      <a class="py-2 d-none d-md-inline-block" href="#">
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 19.25 19.25" style="enable-background:new 0 0 19.25 19.25;" xml:space="preserve" width="24px" height="24px"><g>	<g id="Layer_1_107_">		<g>			<path d="M19.006,2.97c-0.191-0.219-0.466-0.345-0.756-0.345H4.431L4.236,1.461     C4.156,0.979,3.739,0.625,3.25,0.625H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h1.403l1.86,11.164c0.008,0.045,0.031,0.082,0.045,0.124     c0.016,0.053,0.029,0.103,0.054,0.151c0.032,0.066,0.075,0.122,0.12,0.179c0.031,0.039,0.059,0.078,0.095,0.112     c0.058,0.054,0.125,0.092,0.193,0.13c0.038,0.021,0.071,0.049,0.112,0.065c0.116,0.047,0.238,0.075,0.367,0.075     c0.001,0,11.001,0,11.001,0c0.553,0,1-0.447,1-1s-0.447-1-1-1H6.097l-0.166-1H17.25c0.498,0,0.92-0.366,0.99-0.858l1-7     C19.281,3.479,19.195,3.188,19.006,2.97z M17.097,4.625l-0.285,2H13.25v-2H17.097z M12.25,4.625v2h-3v-2H12.25z M12.25,7.625v2     h-3v-2H12.25z M8.25,4.625v2h-3c-0.053,0-0.101,0.015-0.148,0.03l-0.338-2.03H8.25z M5.264,7.625H8.25v2H5.597L5.264,7.625z      M13.25,9.625v-2h3.418l-0.285,2H13.25z" fill="#FFFFFF"/><circle cx="6.75" cy="17.125" r="1.5" fill="#FFFFFF"/><circle cx="15.75" cy="17.125" r="1.5" fill="#FFFFFF"/></g></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
      </a>
      <div class="btn-toolbar" role="toolbar" id="btn-toolbar-login-signup">
        <div class="btn-group" role="group">
          <a href="Login.html" type="button" class="btn btn-default">Login</a>
        </div>
        <div class="btn-group" role="group">
          <a href="SignUp.html"  type="button" class="btn btn-primary">Sign Up</a>
        </div>
      </div>
    </div>
  </nav>



    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Packages</h1>
          <p class="lead text-muted">You want  partial, complete, or even book an hotel in the beatiful Bangkov? Because we think in our customers, we offer amazing packages, select one of them and ask for a quotation.</p>
        </div>
      </section>


      <!-- Packages code
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->
      <div class="album py-5 bg-light">
        <div class="container">

          <div class="row">
            <div class="col-md-4 ">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="../Resources/partial.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">Partial hair transplant are between 500 to 2000 hair transplant. Book it today!.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-primary">Book</button>

                    </div>
                    <small class="text-muted">From $1000</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="../Resources/complete.png" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">Complete hair transplant are between 5000 to 10000 hairs. Book it today!</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-primary">Book</button>

                    </div>
                    <small class="text-muted">From $4000</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="../Resources/full_package.png" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">This is a full package. Including hair transplant + Hotel + Flight. We help you to have a pleasant experience and save money.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-primary">Book</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>
            <!-- Display packages using scriplets and expressions
             ================================================== -->
            <%
              List<HairPackage> hairPackages = (ArrayList)request.getAttribute("packages");
              Iterator<HairPackage> iterator = hairPackages.iterator();

              while(iterator.hasNext()){
                  HairPackage hairPackage = iterator.next();
                  %>
              <!-- Code for get========= -->
              <div class="col-md-4">
                <form>
                  <div class="card mb-4 box-shadow">
                    <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                    <div class="card-body">
                      <p class="card-text"><%=hairPackage.getPackageDescription()%></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-primary">Book</button>
                        </div>
                        <small class="text-muted">From $<%=hairPackage.getPackagePrice()%></small>
                      </div>
                    </div>
                  </div>
                </form>
              </div>

            <% }

            %>

          </div>
        </div>
      </div>

      <!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../js/jquery-slim.min.js"><\/script>')</script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../js/holder.min.js"></script>

  </body>
</html>
