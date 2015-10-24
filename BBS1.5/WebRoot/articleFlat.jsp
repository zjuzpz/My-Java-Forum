<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, com.ucla.bbs.*, java.util.*"%>

<%
	boolean logined = false;
	String adminLogined = (String) session.getAttribute("adminLogined");
	if (adminLogined != null && adminLogined.equals("true")) {
		logined = true;
	}
%>

<%
	//page
	int pageSize = 3;
	String strPageNo = request.getParameter("pageNo");
	int pageNo;
	if (strPageNo == null || strPageNo.trim().equals("")) {
		pageNo = 1;
	} else {
		try {
			pageNo = Integer.parseInt(strPageNo);
			if (pageNo <= 0)
				pageNo = 1;
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}

// Get connection with database and show the articles
	List<Article> articles = new ArrayList<Article>();
	Connection conn = DB.getConn();

	Statement stmtCount = DB.createStmt(conn);
	ResultSet rsCount = DB.executeQuery(stmtCount,
			"select count(*) from article where pid = 0");
	rsCount.next();

	int totalRecords = rsCount.getInt(1);
	int totalPages = totalRecords % pageSize == 0 ? totalRecords
			/ pageSize : totalRecords / pageSize + 1;
	if (pageNo > totalPages) {
		pageNo = totalPages;
	}

	int startPos = (pageNo - 1) * pageSize;

	Statement stmt = DB.createStmt(conn);
	ResultSet rs = DB.executeQuery(stmt,
			"select * from article where pid = 0 order by pdate desc limit "
					+ startPos + "," + pageSize);
// Get all articles from the database
	while (rs.next()) {
		Article a = new Article();
		a.initFromRs(rs);
		articles.add(a);
	}
	DB.close(conn);
%>

<!--The following css styles are copied from https://www.java.net/forums-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Java</title>
<link rel="alternate" type="application/rss+xml"
	title="RSS - Java SE    "
	href="https://www.java.net/forums/read-only-archived-forums/jdk/java-se/feed">
<link rel="shortcut icon"
	href="https://www.java.net/sites/default/files/java_adaptive_favicon_2.png"
	type="image/x-icon">
<meta name="description"
	content="Java.net is the source for Java Technology Collaboration.">
<meta name="keywords"
	content="java,java.net,java technology collaboration,java collaboration,javafx,glassfiish,embedded,netbeans">
<link rel="canonical"
	href="http://www.java.net/forums/read-only-archived-forums/jdk/java-se">
<meta name="revisit-after" content="1 day">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/aggregator.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/book.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/node.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/poll.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/defaults.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/system.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/system-menus.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/user.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/content-module.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/ctools.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/date.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/datepicker.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/datetweaks.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/jquery.timepicker.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/filefield.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/filefield.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/fivestar.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/lightbox_alt.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/panels.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/prettify.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/quote.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/simplenews.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/twitter-pull-listing.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/forum.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/farbtastic.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/calendar.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/extlink.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/fieldgroup.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/views.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/advanced_forum-structure.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/advanced_forum.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/taxonomy_super_select.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/custom_search.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/base.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/starter.css">
<link type="text/css" rel="stylesheet" media="all"
	href="./article_files/theme.css">


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"
	dir="ltr" class="js">

<body
	class="not-front not-logged-in two-sidebars section-forums page-forum-161  chrome chrome45 win desktop lightbox-processed jsenabled">
	<div id="container">
		<!-- /leaderboard -->
		<div id="header" class="clearfix">
			<div id="branding">
				<div class="logo-site-name">
					<strong> <span id="logo"><a rel="home"><img
								src="./article_files/logo.png" alt="Java.net logo"
								title="Home page"></a></span>
					</strong>
				</div>
			</div>
		</div>
	</div>
		<!-- /header -->
		<div id="primary" class="nav">
			<div id="primary-inner"></div>
		</div>
		<!-- /primary link menu -->

		<div class="content-inner">

			<!--new topic -->

			<table>
				<tbody>
					<tr>
						<td class="jive-icon-label"><a id="jive-post-thread"
							href="post.jsp"><h5>new topic</h5></a>
						</td>
					</tr>
				</tbody>
			</table>

			<div id="content">
				<div id="forum">
					<table id="forum-topic-161" class="forum-topics">
						<thead>
							<tr>
								<th class="topic-icon"></th>
								<th class="topic-topic">Topic</th>
								<th class="topic-replies">Replies</th>
								<th class="topic-views">Views</th>
								<th class="topic-created">Created</th>
								<%
									if (logined) {
								%>
								<th class="topic-delete">Delete</th>
								<th class="topic-modify">Modify</th>
								<%
									}
								%>
							</tr>
						</thead>

						<tbody>
							<!--To show the contents-->
							<%
								for (Iterator<Article> it = articles.iterator(); it.hasNext();) {
									Article a = it.next();
									String preStr = "";
							%>
							<tr class="odd not-sticky">
								<td class="icon"><div class="forum-icon">
										<img src="./article_files/topic-default.png" alt="" title=""
											width="24" height="24">
									</div></td>
								<td class="title"><a
									href="articledetailsFlat.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a>
								</td>
								<td class="replies"><div class="num num-replies">0</div></td>
								<td class="views">0</td>
								<td class="created">by zpz<br> <%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getPdate())%>
								</td>
								<%
									if (logined) {
								%>
								<td class="Delete">
									<%
										//url = request.getRequestURL() + "?" + request.getQueryString();
												String url = request.getScheme() + "://"
														+ request.getServerName() + ":"
														+ request.getServerPort();
												url += request.getContextPath() + request.getServletPath();
												url += request.getQueryString() == null ? ""
														: ("?" + request.getQueryString());
									%> <a
									href="delete.jsp?id=<%=a.getId()%>&isLeaf=<%=a.isLeaf()%>&pid=<%=a.getPid()%>&from=<%=url%>">Delete</a>
								</td>
								<td class="Modify"><a href="modify.jsp?id=<%=a.getId()%>">Modify</a>
								</td>
								<%
									}
								%>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<!--Pages-->
					<h5>
						Page:<%=pageNo%>
						&nbsp&nbsp&nbsp&nbsp Total pages:<%=totalPages%>
					</h5>

					<h5>
						<a href="articleFlat.jsp?pageNo=<%=pageNo - 1%>"> Previous </a>
						&nbsp <a href="articleFlat.jsp?pageNo=<%=pageNo + 1%>"> Next </a>
					</h5>

					<!--  	    	
	    	<form name="form1">
	    		<select name="pageNo" onchange="document.form1.submit()">
	    			<%for (int i = 1; i <= totalPages; i++) {%>
	    			<option value=<%=i%> <%=(pageNo == i) ? "selected" : ""%>> Page:<%=i%>
	    			<%}%>
	    		</select>
	    	</form>
-->

					<form name="form2" action="articleFlat.jsp">
						<input type=text size=3 name="pageNo" value=<%=pageNo%>>
						<input type="submit" value="go">
					</form>

					<!-- end pages -->

				</div>
			</div>

		</div>
</body>
</html>
