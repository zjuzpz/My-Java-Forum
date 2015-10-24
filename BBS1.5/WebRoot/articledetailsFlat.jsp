<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, com.ucla.bbs.*, java.util.*"%>

<% 
String strId = request.getParameter("id");

if(strId == null || strId.trim().equals("")) {
	out.println("Please enter this page by using links");
	return;
}
int id = 0;
try {
	id = Integer.parseInt(strId);
} catch (NumberFormatException e) {
	out.println("Please enter this page by using links");
	return;
}

List<Article> articles = new ArrayList<Article>();
Connection conn = DB.getConn();
String sql = "select * from article where rootid = " + id + " order by pdate asc";
Statement stmt = DB.createStmt(conn);
ResultSet rs = DB.executeQuery(stmt, sql);
while(rs.next()) {
	Article a = new Article();
	a.initFromRs(rs);
	articles.add(a);
}

DB.close(rs);
DB.close(stmt);
DB.close(conn);

%>
<!-- The format is copied frmm Java.net forum and then some modifications are applied -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0087)https://www.java.net/forum/topic/jdk/java-se/read-encrypted-msconstxt-outlook-item-java -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr" class="js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Java</title>
<link rel="shortcut icon" href="https://www.java.net/sites/default/files/java_adaptive_favicon_2.png" type="image/x-icon">
<meta name="description" content="Java.net is the source for Java Technology Collaboration.">
<meta name="keywords" content="java,java.net,java technology collaboration,java collaboration,javafx,glassfiish,embedded,netbeans,Java SE">
<link rel="canonical" href="http://www.java.net/forum/topic/jdk/java-se/read-encrypted-msconstxt-outlook-item-java">
<meta name="revisit-after" content="1 day">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/aggregator.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/book.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/node.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/poll.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/defaults.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/system.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/system-menus.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/user.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/content-module.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/ctools.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/date.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/datepicker.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/datetweaks.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/jquery.timepicker.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/filefield.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/fivestar.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/lightbox_alt.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/panels.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/prettify.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/quote.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/simplenews.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/twitter-pull-listing.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/forum.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/farbtastic.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/calendar.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/extlink.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/fieldgroup.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/views.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/advanced_forum-structure.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/advanced_forum.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/comment.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/taxonomy_super_select.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/custom_search.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/base.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/starter.css">
<link type="text/css" rel="stylesheet" media="all" href="./articledetails_files/theme.css">
<style type="text/css">
#container{width:100%;}.two-sidebars .content-inner{margin-left:240px; margin-right:240px;}.sidebar-first .content-inner{margin-left:240px; margin-right:0;}.sidebar-last .content-inner{margin-right:240px; margin-left:0;}#sidebar-first{width:240px;margin-left:-100%;}#sidebar-last{width:240px;margin-left:-240px;}
</style>
</head>
<body class="not-front not-logged-in article-type-forum two-sidebars section-forum page-node-904172  chrome chrome45 win desktop lightbox-processed jsenabled">
<div id="container">

<div id="skip-nav" class="element-invisible">
  <!-- To adjust the display of the skip link see the Advanced theme settings (General settings), and never use display:none! -->
  <a href="https://www.java.net/forum/topic/jdk/java-se/read-encrypted-msconstxt-outlook-item-java#main-content">Skip to main content</a> </div>
<div id="logonboard">
</div>
<!-- /leaderboard -->
<div id="header" class="clearfix">
  <div id="branding">
    <div class="logo-site-name"><strong> <span id="logo"><a href="https://www.java.net/" rel="home"><img src="./articledetails_files/logo.png" alt="Java.net logo" title="Home page"></a></span></strong></div>
  </div>
</div>
<!-- /header -->
<div id="primary" class="nav">
  <div id="primary-inner"> </div>
</div>
<!-- /primary link menu -->
<div id="columns">
<div class="columns-inner clearfix">
<div id="content-column">
  <div class="content-inner">
    <!-- /content-top -->
  		<div id="main-content">
			<div class="jive-buttons">
			    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
			      <tbody>
			        <tr>			          
			          <td class="jive-icon-label"><a id="jive-post-thread" href="articleFlat.jsp"><h5>Return</h5></a> </td>
			          <td class="jive-icon-label"><a id="jive-reply-thread" href="reply.jsp?id=<%=articles.get(0).getId()%>&rootId=<%=articles.get(0).getRootId()%>"><h4>Reply</h4></a> </td>
			        </tr>
			      </tbody>
			    </table>
			    	<div class="post-title"><h2>Topic: <%=articles.get(0).getTitle() %></h2> </div>

			</div>
      
<!--start loop-->
	<%
	for(int i=0; i<articles.size(); i++) {
		Article a = articles.get(i);
	 %>

      <div id="content">

        <div id="node-904172" class="top-post forum-post article clear-block">
          <div class="post-info clear-block">
              <div class="post-title"> <%=a.getTitle() %> </div>
          </div>
          <div class="forum-post-wrapper">
            <div class="forum-post-panel-sub">
              <div class="author-pane">
                <div class="author-pane-inner">
                  <div class="author-pane-section author-pane-general">
                    <div class="author-pane-line author-name"> zpz </div>
                    <div class="author-pane-line author-offline"> Online </div>
                    <div class="author-pane-line author-joined"> <span class="author-pane-label">Joined:</span> 2015-07-25 </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="forum-post-panel-main clear-block">
              <div class="content">
                <%=a.getCont() %>
              </div>
            </div>
          </div>       
        </div>
      </div>
      
      <%
      }
       %>
      
<!--end loop-->

    </div>

<!-- /content-column -->


</body>
</html>
