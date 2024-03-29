<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="en" />
    <link rel="stylesheet" href="${resource(dir:'css', file:'style.css')}" />
    <title>VoiceH20 : Bring out your water issues</title>

    <g:layoutHead/>
</head>

<body>


<%@ page import="complaintsystem.SecurityService" %>
<%
    def securityService = grailsApplication.classLoader.loadClass('complaintsystem.SecurityService').newInstance()
%>

<div id="main">
    <!-- Header -->
    <div id="header">

        <img src="${resource(dir:'images', file: 'logo.jpg')}" />
        <hr class="noscreen" />

        <!-- Navigation -->
        <div id="nav">
            <g:link controller="home">Home</g:link> <span>|</span>
            %{--<a href="#">About us</a> <span>|</span>--}%
            %{--<a href="#"></a> <span>|</span>--}%
            %{--<a href="#">Contact</a>--}%
            <g:if test="${securityService.isLoggedIn()}">
                <g:link controller="auth" action="signOut">Logout</g:link>
            </g:if>
            <g:else>
                <g:link controller="auth">Login</g:link>
            </g:else>
        </div> <!-- /nav -->

    </div> <!-- /header -->

    <!-- Tray -->
  <div id="tray">

        <ul>
            <li><g:link controller="home">Home</g:link> </li> <!-- Active page -->
            %{--<li><a href="#">Live demo</a></li>--}%
            %{--<li><a href="#">About product</a></li>--}%
            %{--<li><a href="#">Testimonials</a></li>--}%
            %{--<li><a href="#">Download</a></li>--}%
            %{--<li><a href="#">Purchase</a></li>--}%
            <g:if test="${securityService.isWasrebUser()}">
                <li><g:link controller="utility">Utilities</g:link></li>
            </g:if>
        </ul>

        <!-- Search -->
        <div id="search" class="box">
            <form action="#" method="get">
                <div class="box">
                    <div id="search-input"><span class="noscreen">Search:</span><input type="text" size="30" name="" value="Search" /></div>
                    <div id="search-submit"><input type="image" src="${resource(dir:'images', file: 'search-submit.gif')}" value="OK" /></div>
                </div>
            </form>

        </div> <!-- /search -->

    <hr class="noscreen" />
    </div>
    <p>
      <!-- /tray -->

      <!-- Promo --><!-- /col -->
    </p>

<hr class="noscreen" />

    <g:layoutBody/>

    <!-- Footer -->
    <div id="footer">

      %{--<div id="col" class="box">--}%
          %{--<!-- /ribbon (design/ribbon.gif) -->--}%
          %{--<!-- Screenshot in browser (replace tmp/browser.gif) -->--}%
          %{--<div id="col-text">--}%
            %{--<h2 id="slogan"><span></span>Place for your slogan.</h2>--}%
            %{--<p>Lorem ipsum dolor sit amet, <strong>consectetuer adipiscing</strong> elit. Nunc feugiat. In a massa. In feugiat pharetra lacus.--}%
              %{--In non arcu nec libero pharetra rutrum. Curabitur hendrerit <a href="#">elementum diam</a>. Vestibulum mattistae sapien eu <a href="#">vehicula accumsan</a>,--}%
              %{--erat quam porttitor orci, id ornare est eros et arcu. In odio. Morbi eu nisia et dolor dictum elementum. Vivamus commodo sodales felis.--}%
              %{--Nulla gravida tristique metus.</p>--}%
            %{--<p id="btns"> <a href="#"><img src="images/btn-tell.gif" alt="" /></a></p>--}%
        %{--</div>--}%
          %{--<!-- /col-text -->--}%
      %{--</div>--}%
      <p>&nbsp;</p>
      <p>Copyright &copy;&nbsp;2011 <strong><a href="#">VoiceH20</a></strong></p>

    </div> <!-- /footer -->

</div> <!-- /main -->

</body>
</html>
