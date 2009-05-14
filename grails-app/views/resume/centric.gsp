<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
  
  <style type="text/css">
    div.fullname{
      font: 12px verdana, arial, helvetica, sans-serif;
      font-weight: bold;
    }

    div.profile{
      font: 12px verdana, arial, helvetica, sans-serif;
      font-weight: bold;
      border-top: solid #000000;
      border-top-width: 1px;
      padding-top: 5px;
      padding-bottom: 50px;
      width: 600px;
    }

    p.profile{
	  margin-left: 20px;	
      font: 11px verdana, arial, helvetica, sans-serif;
    }

    div.experience{
      font: 12px verdana, arial, helvetica, sans-serif;
      font-weight: bold;
      border-top: solid #000000;
      border-top-width: 1px;
      padding-top: 5px;
      padding-bottom: 10px;
      width: 600px;
    }

    div.skills{
      font: 12px verdana, arial, helvetica, sans-serif;
      border-top: solid #000000;
      border-top-width: 1px;
      padding-top: 5px;
      padding-bottom: 50px;
      width: 600px;
    }

    table.experience{
      font: 11px verdana, arial, helvetica, sans-serif;
      width: 97%;
      padding: 2px;
      margin-left: 20px;
    }

    div.education{
      font: 12px verdana, arial, helvetica, sans-serif;
      border-top: solid #000000;
      border-top-width: 1px;
      padding-top: 5px;
      padding-bottom: 50px;
      width: 600px;
    }

	table.education{
      font: 11px verdana, arial, helvetica, sans-serif;
      width: 97%;
      padding: 2px;
      margin-left: 20px;			
	}

  </style>
 
  <gui:resources components="dialog,autoComplete"/>	

  <script>
	var sendHandler = function(o){
		document.forms[0].reset();
	}
  </script>

</head>
  <body style="margin-left:30px;" class="yui-skin-sam">
	
	<g:if test="${params.print!='true'}">
	<div style="font-face:verdana;width:600px;text-align:right;">
		<gui:dialog
		     title="Email Resume"
			 form="true"
			 controller="resume" action="email"
			 update="responseDiv"
			 modal="true"
			 triggers="[show:[type:'link',text:'email',on:'click']]"
			 buttons = "[
				[text:"Send", handler: 'sendHandler', isDefault:true ],
				[text:"Cancel", handler: 'function(){this.cancel();}', isDefault:false] ]">
			
		   	<input type="hidden" name="id" value="${resume.id}"/>
			
			<table>
			
				<tr>
					<td valign="top"><lable for="emailTo">Email To: </label></td>
					<td>
						<gui:autoComplete
						        id="emailTo"
						        options="['red','blue','yellow','orange','purple']"/>
					</td>
				</tr>
			
				<tr>
					<td valign="top"><lable for="subject">Subject: </label></td>
					<td><input type="text" name="subject" size="42"/></td>
				</tr>
				
				<tr>
					<td valign="top"><label for="message">Message:</label></td>
					<td><textarea name="message" cols="40" rows="10"></textarea></td>
				</tr>	
				
			</table>	
			<br/>
		</gui:dialog>
		&nbsp; <a href="#">download</a>
	
	</div>
	</g:if>

    <div width="600px;" class="fullname">
      <table width="600px">
        <tr height="80px;">
          <td>${resume.person.fullName}</td>
          <td valign="bottom" style="padding-left:100px;"><img src="${createLinkTo(dir:'images',file:'centric_logo.jpg')}" height="50px" align="center" valign="center"/></td>
        </tr>
      </table>
    </div>

    <div class="profile">
      <b>Associate Profile</b>
      <p class="profile">${resume.profile}</p>
    </div>

    <div class="skills">
      <b>Technical Skills</b>
      <p><ul>
          <g:each in="${resume?.skills}" var="skill">
			<li>${skill}</li>
          </g:each>
      </ul></p>
    </div>


    <div class="experience">
      Project Experience<br/><br/>
      <g:each in="${resume.projects}" var="project">

      <table class="experience">
        <tr><td><b>${project.project.titleLine}</b></td><td align="right">
            <g:formatDate format="MMM yyyy" date="${project.project.dateStarted}"/> -
            <g:formatDate format="MMM yyyy" date="${project.project.dateCompleted}"/></td></tr>
        <tr><td colspan="2"><i>${project.project.role}</i></td></tr>
        <tr><td colspan="2">${project.project.description}</td></tr>
      </table><br/><br/>

      </g:each>
    </div>

    <div class="education">
      <b>Education</b> <br/><br/>
      <g:each in="${resume?.education}" var="education">

	  <table class="education">
		<tr><td>${education.education.organization}</td>
		<td align="right"><g:formatDate format="MMM-yyyy" date="${education.education.completed}"/></td></tr>
		<tr><td colspan="2">${education.education.courseCompleted}</td></tr>
	  </table>
	  </g:each>

    </div>




  </body>
</html>


