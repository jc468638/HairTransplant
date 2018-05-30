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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for carousel -->
    <link href="css/carousel.css" rel="stylesheet">

    <!-- Custom styles for menu products -->
    <link href="css/product.css" rel="stylesheet">
  </head>
  <body>

    <%@include file="menu.jsp" %>

    <%@include file="menu.jsp" %>



    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Packages</h1>
          <p class="lead text-muted">You want  partial, complete, or even book an hotel in the beatiful Bangkov? Because we think in our customers, we offer amazing packages, select one of them and ask for a quotation.</p>
            <%
                if (session.getAttribute("cart") != null) {
            %>
            <p>
				<span id="size"
                      title="<%=((ArrayList) session.getAttribute("cart"))%>">Items
					in Cart: <%=((ArrayList) session.getAttribute("cart")).size()%></span>
            </p>
            <%
            } else {
            %>
            <span id="size">Items in Cart :0</span>
            <%
                }
            %>


        </div>
      </section>

      <!-- Packages code
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->
      <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
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
                <form action="addPackage" method="get">

                  <div class="card mb-4 box-shadow">
                    <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                    <div class="card-body">
                      <p class="card-text"><%=hairPackage.getPackageDescription()%></p>
                        <input type="text" name="hairPackagesString" value="<%=hairPackage.getPackageName()%>">
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                          <button type="submit" class="btn btn-sm btn-primary">Add</button>
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
    <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="js/holder.min.js"></script>

  </body>
</html>
