<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, com.ucla.bbs.*, java.util.*"%>

<%@ include file="_SessionCheck.jsp" %>

<%!
private void delete(Connection conn, int id, boolean isLeaf) {
	//delete all children
	//delete self
	if(!isLeaf) {
		String sql = "Select * from article where pid = " + id;
		Statement stmt =DB.createStmt(conn);
		ResultSet rs = DB.executeQuery(stmt, sql);
		try {
			while(rs.next()) {
					delete(conn, rs.getInt("id"), rs.getInt("isLeaf") == 0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
		}
	}
	
	DB.executeUpdate(conn, "delete from article where id = " + id);
}
%>

<% 
	String strId = request.getParameter("id");
	String strPid = request.getParameter("pid");
	String strIsLeaf = request.getParameter("isLeaf");
	if(strId == null || strPid == null || strIsLeaf == null) {
		out.println("Error! Please access the page from the link!");
		return;
	}
	
	String url = request.getParameter("from");

	int id = Integer.parseInt(strId);
	int pid = Integer.parseInt(strPid);
	boolean isLeaf = Boolean.parseBoolean(strIsLeaf);
	Connection conn = null;
	boolean autoCommit = true;
	Statement stmt = null;
	ResultSet rs = null;
	
try {
	conn = DB.getConn();
	autoCommit = conn.getAutoCommit();
	conn.setAutoCommit(false);
	
	delete(conn, id, isLeaf);
	
	stmt = DB.createStmt(conn);
	rs = DB.executeQuery(stmt, "select count(*) from article where pid = " + pid);
	rs.next();
	int count = rs.getInt(1);
	
	if(count <= 0) {
		DB.executeUpdate(conn, "update article set isLeaf = 0 where id = " + pid);
	}
	
	conn.commit();
} finally {
	conn.setAutoCommit(autoCommit);
	DB.close(rs);
	DB.close(stmt);
	DB.close(conn);
}
response.sendRedirect(url);
%>

