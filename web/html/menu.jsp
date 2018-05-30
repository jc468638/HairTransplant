<%@ page import="com.htransplant.dao.ApplicationDao" %>
<%@ page import="com.htransplant.beans.User" %>
<%@ page import="java.util.ArrayList" %>
<nav class="site-header sticky-top py-1">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
        <a class="py-2" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="d-block mx-auto"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
        </a>
        <a class="py-2 d-none d-md-inline-block" href="/home">Home</a>
        <a class="py-2 d-none d-md-inline-block" href="/packages">Packages</a>
        <a class="py-2 d-none d-md-inline-block" href="/cartCheckout">
            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 19.25 19.25" style="enable-background:new 0 0 19.25 19.25;" xml:space="preserve" width="24px" height="24px"><g>	<g id="Layer_1_107_">		<g>			<path d="M19.006,2.97c-0.191-0.219-0.466-0.345-0.756-0.345H4.431L4.236,1.461     C4.156,0.979,3.739,0.625,3.25,0.625H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h1.403l1.86,11.164c0.008,0.045,0.031,0.082,0.045,0.124     c0.016,0.053,0.029,0.103,0.054,0.151c0.032,0.066,0.075,0.122,0.12,0.179c0.031,0.039,0.059,0.078,0.095,0.112     c0.058,0.054,0.125,0.092,0.193,0.13c0.038,0.021,0.071,0.049,0.112,0.065c0.116,0.047,0.238,0.075,0.367,0.075     c0.001,0,11.001,0,11.001,0c0.553,0,1-0.447,1-1s-0.447-1-1-1H6.097l-0.166-1H17.25c0.498,0,0.92-0.366,0.99-0.858l1-7     C19.281,3.479,19.195,3.188,19.006,2.97z M17.097,4.625l-0.285,2H13.25v-2H17.097z M12.25,4.625v2h-3v-2H12.25z M12.25,7.625v2     h-3v-2H12.25z M8.25,4.625v2h-3c-0.053,0-0.101,0.015-0.148,0.03l-0.338-2.03H8.25z M5.264,7.625H8.25v2H5.597L5.264,7.625z      M13.25,9.625v-2h3.418l-0.285,2H13.25z" fill="#FFFFFF"/><circle cx="6.75" cy="17.125" r="1.5" fill="#FFFFFF"/><circle cx="15.75" cy="17.125" r="1.5" fill="#FFFFFF"/></g></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
            <%
                if (session.getAttribute("cart") != null) {
            %>
                     <%=((ArrayList) session.getAttribute("cart")).size()%>
            <%
            }

            %>
        </a>
        <%
            if (session.getAttribute("username") == null) {
        %>
                <div class="btn-toolbar" role="toolbar" id="btn-toolbar-login-signup">
                    <div class="btn-group" role="group">
                        <a href="/login" type="button" class="btn btn-default">Login</a>
                    </div>
                    <div class="btn-group" role="group">
                        <a href="/signup"  type="button" class="btn btn-primary">Sign Up</a>
                    </div>
                </div>
        <%
        } else {
            ApplicationDao dao = new ApplicationDao();
            User user = dao.getProfileDetails((String)session.getAttribute("username"));
        %>
                <div class="btn-toolbar" role="toolbar" id="btn-toolbar-login-signup">
                    <div class="btn-group" role="group">
                        <a href="#" type="button" class="btn btn-default">Hi <%= user.getUserFirstName()%> </a>
                    </div>
                    <div class="btn-group" role="group">
                        <a href="logout" type="button" class="btn btn-default">Logout</a>
                    </div>
                </div>
        <%
            }
        %>
    </div>
</nav>