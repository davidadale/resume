
<%@ page import="resume.Award" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Award</title>
        <resource:dateChooser />
    </head>
    <body>
       
        <div class="body">
            <h2>Add Award</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${awardInstance}">
            <div class="errors">
                <g:renderErrors bean="${awardInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
              <g:hiddenField name="personId" value="${personId}" />

              <div class="dialog">
                    <table>
                        <tbody>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="awardingOrganization">Awarding Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'awardingOrganization','errors')}">
                                    <input type="text" id="awardingOrganization" name="awardingOrganization" value="${fieldValue(bean:awardInstance,field:'awardingOrganization')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="awardName">Award Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'awardName','errors')}">
                                    <input type="text" id="awardName" name="awardName" value="${fieldValue(bean:awardInstance,field:'awardName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAwarded">Date Awarded:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'dateAwarded','errors')}">
                                    <g:datePicker name="dateAwarded" precision="month"  noSelection="['':'-Select-']"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nominatedOnly">Nominated Only:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'nominatedOnly','errors')}">
                                    <g:checkBox name="nominatedOnly" value="${awardInstance?.nominatedOnly}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Add" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
