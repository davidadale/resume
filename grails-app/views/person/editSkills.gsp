<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<html>
  <head>
    <title>Sample title</title>
    <meta name="layout" content="main" />
  	<resource:autoComplete skin="default" />
  </head>
  <body>

    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link  action="show" id="${person.id}">Profile</g:link></span>
    </div>
    <div class="body">

      <h1>Editing Skills for ${person?.firstName}</h1>
      <div class="dialog">

        <g:form action="updateSkills">
        <g:hiddenField name="id" value="${person.id}"/>
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name"><b>Available Skills:</b></td>

              <td valign="top" class="value">
	
				<richui:autoComplete name="skill" action="${createLinkTo('dir': 'skill/searchAJAX')}" 
				onItemSelect="document.location.href = \'${createLinkTo(dir: 'person/addSkill')}/\' + id;"
				style="font-size:14pt;"/>	
	

              </td>
            </tr>
          </tbody>
        </table>
		
		<div class="buttons">
        <g:submitButton name="updateSkills" value="Save"/>
		</div>
        </g:form>
      </div>
    </div>


  </body>
</html>
