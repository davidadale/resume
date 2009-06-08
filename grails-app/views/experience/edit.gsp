
<%@ page import="resume.Experience" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Experience</title>
        <resource:dateChooser />
    </head>
    <body>
        <div class="body">
            <h2>Experience</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${experience}">
            <div class="errors">
                <g:renderErrors bean="${experience}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="experience_form" action="save" >
                <input type="hidden" name="id" id="id" value="${experience?.id}" />
                <input type="hidden" name="personid" id="personid" value="${experience?.person?.id}" />
                <div class="dialog">
                   <div class="entryfield">
			   <label class="entryLabel" for="companyName">Company Name:</label>
			   <span class="fieldVal value ${hasErrors(bean:experience,field:'companyName','errors')}">
			       <input type="text" id="companyName" name="companyName" value="${fieldValue(bean:experience,field:'companyName')}"/>
			   </span>
                   </div>
		   <div class="clear" ></div>
		   
		   <div class="entryfield">
			   <label class="entryLabel" for="dateStarted">Date Started:</label>
			   <span class="fieldVal value ${hasErrors(bean:experience,field:'dateStarted','errors')}">
                                <g:datePicker name="dateStarted" precision="month"  noSelection="['':'-Select-']"  />
				 <span style="margin-left:5px;">
				<g:checkBox id="ongoing" class="value"  name="ongoing" value="${experience?.ongoing}" 
						onclick="Effect.toggle('dateComp','appear')"></g:checkBox>
				<label for="ongoing">Ongoing</label>	
			   </span>
			   </span>
			  
		   </div>
		   <div class="clear" ></div>
		   
		 		    
		   <div id="dateComp" class="entryfield">				
		   	<span class="entryLabel">
				Date Completed:
			</span>
		   	<span class="fieldVal value ${hasErrors(bean:experience,field:'dateCompleted','errors')}">
                          <g:datePicker name="dateCompleted" precision="month"  noSelection="['':'-Select-']" />
			</span>								                   
									
		   </div>
		   <div class="clear" ></div>
		   
		   <div class="entryfield">
                   	<label class="entryLabel" for="role">Role:</label>
			<span class="fieldVal value ${hasErrors(bean:experience,field:'role','errors')}">
                        	<input type="text" id="role" name="role" value="${fieldValue(bean:experience,field:'role')}"/>
		        </span>
		   </div>
		   <div class="clear" ></div>
		   
		   <div class="entryfield">
		   	<label class="entryLabel" for="titleLine">Title Line:</label>
			   <span class="fieldVal value ${hasErrors(bean:experience,field:'titleLine','errors')}">
			   	<input type="text" id="titleLine" name="titleLine" 
					value="${fieldValue(bean:experience,field:'titleLine')}"/>
			   </span>
		   </div>
		   <div class="clear" ></div>
		   
		   <div class="entryfield">
			   <label class="entryLabel" for="summary">Summary:</label>
			   <span class="fieldVal value ${hasErrors(bean:experience,field:'summary','errors')}">
			   	<textarea class="txtValue" id="summary" name="summary">${fieldValue(bean:experience,field:'summary')}</textarea>
			   </span>     
                   </div>  
		   <div class="clear" ></div>
		   <h2>Higphlights</h2>
                   <p id="new_highlight_lnk"><g:link action="addHighlight" onclick="Effect.Appear('newValueBlock');Effect.Fade('new_highlight_lnk');return false;">New</g:link></p>
                  
		  
                   <g:each in="${experience.highlights}" status="i" var="item">
                      <div class="entryfield value">
                        <div style="float:right">
                            <g:link action="delete" controller="highlight" params="[expid:experience.id]" id="${fieldValue(bean:item, field:'id')}" >delete</g:link>
                        </div>
                        <textarea class="txtValue" id="highlight_${fieldValue(bean:item, field:'id')}" name="highlight_${fieldValue(bean:item, field:'id')}" >${fieldValue(bean:item, field:'text')}</textarea>
                      </div>
                   </g:each>

                            <%/* this newValueBlock only works if javascript enabled.  if javascript is disabled,
                                 then the 'New' hyperlink above does HTTP GET, resulting in page reload with the new highlight already
                                 added to the experience.  Non-javascript user would then be using the 'Save' link above.
                                 But if javascript is enabled, we do the save with an ajax call below.
                            */%>
                            <div id="ajaxmsg" style="display:none;"></div>

			   <div id="newValueBlock" style="display:none;">
                               <div class="entryfield value">
			   	   <span id="hlpMsg1" class="ctxhlp">Enter text for new item below and click save</span>
				   <div style="float:right">
                                     <g:actionSubmit class="link" value="Save" action="save" />
                                     <input type="button" class="link" onclick="$('newValueBlock').hide();$('new_hightlight').value='';return false;" value="Cancel"></input>
				   </div>
				   <textarea class="txtValue" id="new_highlight" name="new_hightlight" onfocus="Effect.BlindUp('hlpMsg1');" ></textarea>
                               </div>                      
                                   
		           </div>
		   

                  <div class="clear" ></div>

                     <h2>Sub Projects</h2>
                     

                  
                  <div class="buttons">
                      <span class="button"><g:actionSubmit class="save" value="Save" /></span>
                      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                  </div>
                </div>
		<div class="clear" style="height:5em;"> </div>
            </g:form>
        </div>

                      <script type="text/javascript" language="javascript">
                                      function saveNewHighlight() {
                                        try {
                                          $('ajaxmsg').innerHTML = "Saving..."
                                          $('ajaxmsg').style.backgroundColor = '#f00'
                                          $('ajaxmsg').style.color = '#fff'
                                          $('ajaxmsg').appear()
                                          var uri = '/resume/experience/saveAjax/' + $('id').value
                                          alert (uri)
                                          new Ajax.Request(uri,
                                                {parameters: $('experience_form').serialize(true)},
                                                {onSuccess: function(transport){
                                                  $('ajaxmsg').innerHTML = "Saved."
                                                  $('ajaxmsg').style.backgroundColor = '#999'
                                                  $('ajaxmsg').style.color = '#000'
                                                  Effect.Shake('ajaxmsg')
                                                  //$('ajaxmsg').toggle('appear')
                                                  alert('success')
                                                },
                                                onFailure: function(){
                                                   $('ajaxmsg').innerHTML = "Save failed"
                                                   Effect.Shake('ajaxmsg')
                                                   alert('fail')
                                                },
                                                onException: function(){
                                                   alert('something went wrong in callbacks')
                                                }

                                              })

                                         } catch (ex) {
                                            $('ajaxmsg').appear()
                                            $('ajaxmsg').innerHTML = "Unable to contact server"
                                            Effect.Shake('ajaxmsg')
                                            alert(ex)

                                         }
                                         return false;
                                      }
                                   </script>
    </body>
</html>
