<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create Resume</title>
  </head>
  <body onload="document.title.name.focus();">
    <h1>Title of Resume</h1>
    <g:form action="createResume" method="POST" name="title">
    <div class="dialog">

        <label for="name">Name:</label>
        <g:textField name="name" value="${resume?.name}"/>
		   <p>(i.e. Project Manager, Designer, Developer )</p>

		<div class="buttons">
	    	<g:submitButton name="next" value="Next"/>
		</div>
    </div>
    </g:form>
  </body>
</html>
