<html>
  <head>
    <title>Projects to Highlight</title>
    <meta name="layout" content="main" />
  </head>
  <body>

    <g:form action="editResume" method="post">
            <h1>Select projects to highlight</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <g:checkBoxList name="selectedProjectsById" from="${projects}" value="${resume?.projects?.collect{it.project.id}}" optionKey="id" />

			<div class="buttons">
            <g:submitButton name="previous" value="Previous"/>
            <g:submitButton name="next" value="Next"/>
			</div>
    </g:form>

  </body>
</html>
