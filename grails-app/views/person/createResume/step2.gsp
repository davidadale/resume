<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Resume</title>
    </head>
    <body onload="document.profile.profile.focus();">
    	<h1>Your professional profile</h1>
    	<g:form action="createResume" method="POST" name="profile">
        	<g:textArea name="profile" value="${resume?.profile}" cols="60" rows="10"/><br/>
        	<br/>
        	<div class="buttons">
          		<g:submitButton name="previous" value="Previous"/>
          		<g:submitButton name="next" value="Next"/>
        	</div>
    	</g:form>
  	</body>
</html>
