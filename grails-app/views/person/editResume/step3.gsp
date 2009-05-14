
<html>
<head>
  <title>Highlight Skills for Resume</title>
  <meta name="layout" content="main" />
</head>
<body>
  <h1>Select skills to highlight</h1>
  </br>  
  <g:form action="editResume" method="post">
  		<g:checkBoxList name="selectedSkillsById" 
     		from="${skills}" 
			value="${resume?.skills?.collect{ it.skill.id } }" optionKey="id" />

 		<div class="buttons">
  			<g:submitButton name="previous" value="Previous"/>
  			<g:submitButton name="next" value="Next"/>
		</div>
  </g:form>
</body>
</html>
