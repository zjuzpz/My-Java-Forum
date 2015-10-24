<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, com.ucla.bbs.*, java.util.*"%>

<%
String strId = request.getParameter("id");
String strRid = request.getParameter("rootId");
if(strId == null || strId.trim().equals("")) {
	out.println("Please do not refresh the page!");
	return;
}
int id = 0;
int rootId = 0;
try {
	id = Integer.parseInt(strId);
	rootId = Integer.parseInt(strRid);
} catch (NumberFormatException e) {
	out.println("Please do not refresh the page!");
	return;
}

 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0065)https://www.java.net/forums/read-only-archived-forums/jdk/java-se -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr" class="js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reply     | Java.net</title>
<link rel="alternate" type="application/rss+xml" title="RSS - Java SE    " href="https://www.java.net/forums/read-only-archived-forums/jdk/java-se/feed">
<link rel="shortcut icon" href="https://www.java.net/sites/default/files/java_adaptive_favicon_2.png" type="image/x-icon">
<meta name="description" content="Java.net is the source for Java Technology Collaboration.">
<meta name="keywords" content="java,java.net,java technology collaboration,java collaboration,javafx,glassfiish,embedded,netbeans">
<link rel="canonical" href="http://www.java.net/forums/read-only-archived-forums/jdk/java-se">
<meta name="revisit-after" content="1 day">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/aggregator.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/book.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/node.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/poll.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/defaults.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/system.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/system-menus.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/user.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/content-module.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/ctools.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/date.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/datepicker.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/datetweaks.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/jquery.timepicker.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/filefield.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/fivestar.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/lightbox_alt.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/panels.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/prettify.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/quote.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/simplenews.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/twitter-pull-listing.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/forum.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/farbtastic.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/calendar.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/extlink.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/fieldgroup.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/views.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/advanced_forum-structure.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/advanced_forum.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/taxonomy_super_select.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/custom_search.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/base.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/starter.css">
<link type="text/css" rel="stylesheet" media="all" href="./article_files/theme.css">
<style type="text/css">
#container{width:100%;}.two-sidebars .content-inner{margin-left:240px; margin-right:240px;}.sidebar-first .content-inner{margin-left:240px; margin-right:0;}.sidebar-last .content-inner{margin-right:240px; margin-left:0;}#sidebar-first{width:240px;margin-left:-100%;}#sidebar-last{width:240px;margin-left:-240px;}
</style>
<!--[if lte IE 6]><style type="text/css" media="all">@import "/sites/all/themes/java_adaptive/css/ie6.css";</style><![endif]-->
<!--[if IE 7]><style type="text/css" media="all">@import "/sites/all/themes/java_adaptive/css/ie7.css";</style><![endif]-->
<!--[if IE 8]><style type="text/css" media="all">@import "/sites/all/themes/java_adaptive/css/ie8.css";</style><![endif]-->


<!--Load FCKeditor-->
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
	<script type="text/javascript">
	
// There are some bugs with fck editor, thus it is not enabled now!


window.onload = function()
{
	// Automatically calculates the editor base path based on the _samples directory.
	// This is usefull only for these samples. A real application should use something like this:
	// oFCKeditor.BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.
	//var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('_samples')) ;
	var sBasePath = "<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/fckeditor/" %>"
//alert(sBasePath);
	var oFCKeditor = new FCKeditor( 'cont' ) ;
	oFCKeditor.BasePath	= sBasePath ;
	oFCKeditor.ReplaceTextarea() ;
}

</script>
<!-- end of FCKeditor -->
</head>
<body class="not-front not-logged-in two-sidebars section-forums page-forum-161  chrome chrome45 win desktop lightbox-processed jsenabled">
<div id="container"> </div>
<!-- /leaderboard -->
<div id="header" class="clearfix">
  <div id="branding">
    <div class="logo-site-name"><strong> <span id="logo"><a href="https://www.java.net/" rel="home"><img src="./article_files/logo.png" alt="Java.net logo" title="Home page"></a></span> </strong></div>
    <!-- /logo/site name -->
    <!-- /slogan -->
  </div>
  <!-- /branding -->
  <!-- /search box -->
</div>
<!-- /header -->
<div id="primary" class="nav">
  <div id="primary-inner"></div>
</div>
<!-- /primary link menu -->
<div id="columns"></div>
<div class="columns-inner clearfix"></div>
<div id="content-column">
  <div class="content-inner">
    <!-- /content-top -->
    <div id="main-content">
      <div id="main-content-header">
        <h1 id="page-title">Reply </h1>
        <!-- /breadcrumb -->
      </div>
      <div id="content">
        <div id="content-main-top">
          <!-- /block -->
        </div>
        <div id="forum">
          <div class="forum-top-links"></div>
            <tbody>         
              <div class="jive-messagebox">
                 <form action="replyDeal.jsp" method="post">
                 		<input type="hidden" name="pid" value="<%=id %>"/>
                 		<input type="hidden" name="rootId" value="<%=rootId%>"/>
                 		title:<input type="text" name="title"><br/>
                 		content:<textarea name="cont" rows="15" cols="80"></textarea>
                	 	<br>
                	 	<input type="submit" value="submit"/>
                 </form>             	
              </div>
            </tbody>
          <div class="forum-topic-legend forum-smalltext clear-block">
          </div>
        </div>
      </div>
    </div>
    <!-- /main-content -->
  </div>
</div>
<!-- /content-column -->
</body>
</html>
