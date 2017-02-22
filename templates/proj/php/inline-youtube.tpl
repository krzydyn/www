<h2>Put a YouTube player into your web page</h2>
<%code_start("html")%>
<iframe src="http://www.youtube.com/embed/ID"
frameborder="0" width="420" height="315"></iframe>
<%code_stop()%>
where ID is the film ID<br>
<br>
An example to show http://www.youtube.com/watch?v=kie2oa7hcx4 (ID=kie2oa7hcx4)<br>
<iframe src="http://www.youtube.com/embed/kie2oa7hcx4" frameborder="0" width="420" height="315">
</iframe><br>
<br>
Put a YouTube player into your web page (playlist)<br>
<%code_start("html")%>
<iframe src="http://www.youtube.com/embed/videoseries?list=ID" 
width="420" height="315" frameborder="0"></iframe>
<%code_stop()%>
where ID is the playlist ID<br>
<br>
An example to show playlist ID=PL91235D5414A575AA<br>
<iframe src="http://www.youtube.com/embed/videoseries?list=PL91235D5414A575AA" 
width="420" height="315" frameborder="0"></iframe>
