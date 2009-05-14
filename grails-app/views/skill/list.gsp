

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Skill List</title>
		<resource:autoComplete skin="default" />
    </head>
    <body onload="document.getElementById('skill').focus();">
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <h1>Find a skill description</h1>
			<p>
				<richui:autoComplete name="skill" action="${createLinkTo('dir': 'skill/searchAJAX')}" 
				onItemSelect="document.location.href = \'${createLinkTo(dir: 'skill/show')}/\' + id;"
				style="font-size:14pt;"/>
			
			<div style="padding-top:5px;padding-bottom:5px;">
				<g:link class="create" action="create">Add Skill</g:link>  
			</div>
			</p>
        </div>
    </body>
</html>
