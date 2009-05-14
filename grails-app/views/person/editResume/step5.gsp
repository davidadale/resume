<html>
  <head>
    <title>Projects</title>
    <meta name="layout" content="main" />
  </head>
  <body>
	
    <g:form action="createResume" method="post">
            <h1>Education List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <g:checkBoxList name="selectedEducationById" from="${education}" value="${resume?.education?.collect{it.education.id }}" optionKey="id" />
			
			<div class="buttons">
               <g:submitButton name="previous" value="Previous"/>
               <g:submitButton name="next" value="Next"/>
			</div>
    </g:form>

  </body>
</html>
