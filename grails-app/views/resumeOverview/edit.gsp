
<%@ page import="resume.ResumeOverview" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Resume - Overview</title>
    </head>
    <body>
        <div class="body">
            <div class="dialog">
            <h1>Overview</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${overview}">
            <div class="errors">
                <g:renderErrors bean="${overview}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="overview_form" action="save" >
                <input type="hidden" name="id" id="id" value="${overview?.id}" />
                                 
		   <div class="clear" ></div>		   
		   <div class="entryfield">
			   <label class="entryLabel" for="summary">Summary:</label>
			   <span class="fieldVal value ${hasErrors(bean:overview,field:'summary','errors')}">
			   	<textarea class="txtValue" id="summary" name="summary">${overview?.summary}</textarea>
			   </span>     
                   </div>  
		   <div class="clear" ></div>
		   <h2>Highlights</h2>
                   <p><g:link action="addHighlight" onclick="Effect.Appear('newValueBlock');return false;">New</g:link></p>
                  
                     <g:each in="${overview?.highlights}" status="i" var="item">
                        <div class="entryfield value">
                          <div style="float:right">
                              <g:link action="delete" controller="highlight" params="[expid:item?.id,from:'overview']" id="${fieldValue(bean:item, field:'id')}" >delete</g:link>
                          </div>
                          <textarea class="txtValue" id="highlight_${fieldValue(bean:item, field:'id')}" name="highlight_${fieldValue(bean:item, field:'id')}" >${fieldValue(bean:item, field:'text')}</textarea>
                        </div>
                     </g:each>
                  
                       
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
		   
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Save" /></span>
                </div>
		<div class="clear" style="height:5em;"> </div>
            </g:form>
        </div> <!-- dialog -->
      </div>  <!--body -->
                      <script type="text/javascript" language="javascript">
                                      
                                   </script>
    </body>
</html>
