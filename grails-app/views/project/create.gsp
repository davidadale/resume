<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create Project</title>
	<resource:dateChooser />
  </head>
  <body>
    <div class="body">
      <h2>Create Project</h2>
      <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${project}">
      <div class="errors">
        <g:renderErrors bean="${project}" as="list" />
      </div>
      </g:hasErrors>
      <g:form controller="project" action="save" method="post" >
      <g:hiddenField name="expid" value="${expid}"/>

      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="titleLine">Project Name:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'titleLine','errors')}">
                <input type="text" id="titleLine" name="titleLine" value="${fieldValue(bean:project,field:'titleLine')}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="titleLine">Company Name:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'companyName','errors')}">
                <input type="text" id="companyName" name="companyName" value="${fieldValue(bean:project,field:'companyName')}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="dateStarted">Started / Completed:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'dateStarted','errors')}">
				<richui:dateChooser name="dateStarted"  format="MM/yyyy" />
                                <span id="dateComp"><richui:dateChooser name="dateCompleted" format="MM/yyyy" /></span>
                                <g:checkBox id="ongoing" class="value"  name="ongoing" value="${experience?.ongoing}"
						onclick="Effect.toggle('dateComp','appear')"></g:checkBox>
				<label for="ongoing">Ongoing</label>	
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="role">Role:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'role','errors')}">
                <g:select id="role" name="role" from="${project.constraints.role.inList}" value="${project.role}" ></g:select>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="description">Description:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'description','errors')}">
                <g:textArea name="description" value="${fieldValue(bean:project,field:'description')}" cols="40" rows="15"/>
              </td>
            </tr>


          </tbody>
        </table>

      </div>
      <div class="buttons">
        <span class="button"><input class="save" type="submit" value="Create" /></span>
      </div>
      </g:form>
    </div>

  </body>


</html>
