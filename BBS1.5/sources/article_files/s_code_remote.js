/* SiteCatalyst code version: H.19.BUILD DATE: 25-APR-2014 COPYRIGHT ORACLE CORP 2014 [UNLESS STATED OTHERWISE] */
/* Removed sungloal suite, added few more java.net domain to track those domain in pagename 05-MAY-14 */
/************************** CONFIG SECTION ****************************************/
/* Specify the Report Suite(s) */
var s_account="sunjnetdev";
var sun_dynamicAccountSelection=true;
var sun_dynamicAccountList="sunjnet=java.net;sunjnetdev=."
/* Specify the Report Suite ID */
var s_siteid="jnet-other:";
if(window.location.hostname == "www.java.net") {var s_siteid="jnet-editorial:";}
if(window.location.hostname == "java.net") {var s_siteid="jnet-editorial:";}
if(window.location.hostname == "home.java.net") {var s_siteid="jnet-editorial:";}
if(window.location.hostname == "glassfish.java.net") {var s_siteid="jnet-glassfish:";}
if(window.location.hostname == "today.java.net") {var s_siteid="jnet-editorial:";}
if(window.location.hostname == "community.java.net") {var s_siteid="jnet-community:";}
if(window.location.hostname == "weblogs.java.net") {var s_siteid="jnet-weblogs:";}
if(window.location.hostname == "forums.java.net") {var s_siteid="jnet-forums:";}
if(window.location.hostname == "wiki.java.net") {var s_siteid="jnet-wiki:";}
if(window.location.hostname == "partners.java.net") {var s_siteid="jnet-partners:";}
if(window.location.hostname == "sun.java.net") {var s_siteid="jnet-partners:";}
if(window.location.hostname == "openjdk.java.net") {var s_siteid="jnet-openjdk:";}
if(window.location.hostname == "jdk6.java.net") {var s_siteid="jnet-jdk6:";}
if(window.location.hostname == "jdk7.java.net") {var s_siteid="jnet-jdk7:";}
if(window.location.hostname == "jdk8.java.net") {var s_siteid="jnet-jdk8:";}
if(window.location.hostname == "jdk9.java.net") {var s_siteid="jnet-jdk9:";}
if(window.location.hostname == "home.stagejava.net") {var s_siteid="jnet-stagejava:";}
if(window.location.hostname == "www.stagejava.net") {var s_siteid="jnet-stagejava:";}
if(window.location.hostname == "javaserverfaces.java.net") {var s_siteid="jnet-javaserverfaces:";}
if(window.location.hostname == "visualvm.java.net") {var s_siteid="jnet-visualvm:";}
if(window.location.hostname == "wadl.java.net") {var s_siteid="jnet-wadl:";}
if(window.location.hostname == "jaxb.java.net") {var s_siteid="jnet-jaxb:";}
if(window.location.hostname == "jaxp.java.net") {var s_siteid="jnet-jaxp:";}
if(window.location.hostname == "jax-ws.java.net") {var s_siteid="jnet-jax-ws:";}
if(window.location.hostname == "jax-ws-commons.java.net") {var s_siteid="jax-ws-commons:";}
if(window.location.hostname == "metro.java.net") {var s_siteid="jnet-metro:";}
if(window.location.hostname == "mq.java.net") {var s_siteid="jnet-mq:";}
if(window.location.hostname == "download.java.net") {var s_siteid="jnet-downloads:";}
if(typeof s_siteid=='undefined') {var s_siteid="suncom-error:";}
/* Remote Omniture JS call  */
var sun_ssl=(window.location.protocol.toLowerCase().indexOf("https")!=-1);
	if(sun_ssl == true) { var fullURL = "https://www.java.net/images/metrics_group1.js"; }
		else { var fullURL= "http://www.java.net/images/metrics_group1.js"; }
document.write("<sc" + "ript type=\"text/javascript\" src=\""+fullURL+"\"></sc" + "ript>");
/************************** END CONFIG SECTION **************************************/