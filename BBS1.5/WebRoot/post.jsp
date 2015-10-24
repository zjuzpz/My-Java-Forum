<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, com.ucla.bbs.*, java.util.*"%>

<%
//request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
if(action != null && action.trim().equals("post")) {
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	Connection conn = DB.getConn();
	
	boolean autoCommit = conn.getAutoCommit();
	conn.setAutoCommit(false);
	
	int rootId = -1;
	
	String sql = "insert into article values (null, ?, ?, ?, ?, now(), ?)";
//After execute sql, it will autogenerate a new KEY
	PreparedStatement pstmt = DB.prepareStmt(conn, sql, Statement.RETURN_GENERATED_KEYS);
//Get the new KEY
	pstmt.setInt(1, 0);
	pstmt.setInt(2, rootId);
	pstmt.setString(3, title);
	pstmt.setString(4, cont);
	pstmt.setInt(5, 0);
	pstmt.executeUpdate();

//Set the KEY	
	ResultSet rsKey = pstmt.getGeneratedKeys();
	rsKey.next();
	rootId = rsKey.getInt(1);
	
	
	Statement stmt = DB.createStmt(conn);
	stmt.executeUpdate("Update article set rootid = " + rootId + " where id = " + rootId);
	
	conn.commit();
	conn.setAutoCommit(autoCommit);
	DB.close(pstmt);
	DB.close(stmt);
	DB.close(conn);
	
	response.sendRedirect("articleFlat.jsp");
}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0065)https://www.java.net/forums/read-only-archived-forums/jdk/java-se -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reply     | Java.net</title>
<style type="text/css">
#container{width:100%;}.two-sidebars .content-inner{margin-left:240px; margin-right:240px;}.sidebar-first .content-inner{margin-left:240px; margin-right:0;}.sidebar-last .content-inner{margin-right:240px; margin-left:0;}#sidebar-first{width:240px;margin-left:-100%;}#sidebar-last{width:240px;margin-left:-240px;}
</style>
<!--[if lte IE 6]><style type="text/css" media="all">@import "/sites/all/themes/java_adaptive/css/ie6.css";</style><![endif]-->
<!--[if IE 7]><style type="text/css" media="all">@import "/sites/all/themes/java_adaptive/css/ie7.css";</style><![endif]-->
<!--[if IE 8]><style type="text/css" media="all">@import "/sites/all/themes/java_adaptive/css/ie8.css";</style><![endif]-->

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


<div id="content-column">
  <div class="content-inner">
    <!-- /content-top -->
    <div id="main-content">
      <div id="main-content-header">
        <h1 id="page-title">New Topic </h1>
        <!-- /breadcrumb -->
      </div>
      <div id="content">
        
        <div id="forum" style="height: 434px; ">
          
            <tbody>         
              <div class="jive-messagebox">
                 <form action="post.jsp" method="post">   
                 		<input type="hidden" name="action" value="post"/>          		
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
