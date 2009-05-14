<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show Person</title>
	<resource:tabView />
  </head>
  <body>
    <div class="body">
      <h1>Welcome ${person.firstName}</h1><br/>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>

      <div class="dialog">


        <table>
          <tbody>
            <tr class="prop">
              <td valign="top" class="name"><b>Full Name:</b></td>
              <td valign="top" class="value">${person.fullName}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><b>Email:</b></td>
              <td valign="top" class="value">${fieldValue(bean:person, field:'email')}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><b>Phone Number:</b></td>
              <td valign="top" class="value">${fieldValue(bean:person, field:'phoneNumber')}</td>
            </tr>
			<tr>
				<td align="right" colspan="2"><g:link id="${person.id}" action="edit" controller="person">Edit</g:link></td>
			</tr>
          </tbody>
        </table>
        <br/><br/>
		<richui:tabView id="tabView">
			<richui:tabLabels>
        		<richui:tabLabel selected="${skillTabSelected}" title="Skills" />
        		<richui:tabLabel selected="${projectTabSelected}" title="Projects" />
        		<richui:tabLabel selected="${educationTabSelected}" title="Education" />
    		</richui:tabLabels>
			<richui:tabContents>
				<richui:tabContent>
					<div align="right">
                		<g:link class="edit" action="editSkills" id="${person.id}">Select Skills</g:link><br/>
					</div>
					<div style="height:200px;">
                	<ul style="list-style-type:none;">
                  		<g:each var="s" in="${skills}">
                  			<li style="padding-bottom:5px;"><b>${s.name}</b> - ${s.description}</li>
                  		</g:each>
                	</ul>
					</div>
				</richui:tabContent>
				<richui:tabContent>
              		<div align="right">
                		<g:link controller="project" action="create" params="['person.id':person.id]">Add Project</g:link>
              		</div>
					<div style="height:200px;">
	              		<table>
	                		<thead>
	                  			<tr>
	                    			<g:sortableColumn property="titleLine" title="Title" />
									<g:sortableColumn property="dateStarted" title="Started" />	
	                    			<g:sortableColumn property="dateCompleted" title="Completed" />
	                  			</tr>
	                		</thead>
	                		<tbody>
	                  			<g:each in="${projects}" status="i" var="project">
	                  				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                    				<td>
											<g:link controller="project" action="show" 
											id="${project.id}">${fieldValue(bean:project, field:'titleLine')}</g:link>
										</td>
	                    				<td><g:formatDate format="yyyy-MM-dd" date="${project?.dateStarted}"/></td>
	                    				<td><g:formatDate format="yyyy-MM-dd" date="${project?.dateCompleted}"/></td>
	                  				</tr>
	                  			</g:each>
	                		</tbody>
	              		</table>
					</div>
				</richui:tabContent>
				<richui:tabContent>
                	<div style="padding-bottom:5px;" align="right">
                  		<g:link controller="education" action="create" params="['person.id':person.id]">Add Education</g:link>
                	</div>
              		<div style="height:200px;">
					<table>
                		<thead>
                  			<tr>
                    			<g:sortableColumn property="what" title="Education" />
                    			<g:sortableColumn property="date" title="Competed" />
                  			</tr>
                		</thead>
                		<tbody>
                  			<g:each var="education" in="${education}" status="i">
                  			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    			<td><g:link controller="education" action="show" id="${education.id}">${education?.organization}</g:link></td>
                    			<td><g:formatDate format="yyyy-MM-dd" date="${education?.completed}"/></td>
                  			</tr>
                  			</g:each>
                		</tbody>
              		</table>
					</div>
				</richui:tabContent>
			</richui:tabContents>
		</richui:tabView>
		</div>
    </div>
  </body>
</html>
