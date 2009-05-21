<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'lefty-style.css')}" />
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'resumeapp.css')}" />
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="prototype/prototype" />
    <g:javascript library="prototype/scriptaculous" />
    
	<resource:tagCloud />
  </head>
  <body onload="${pageProperty(name:'body.onload')}" >
    <div id="wrapper">

    <div id="header">
        <g:link url="/resume" title="(It's all about ME... ok, and you too)"><span id="headerTitle">ResuMe</span></g:link>
        <span id="headerRight">
          Welcome ${person?.firstName} |
		  <g:link controller="auth" action="signOut">logout</g:link>
        </span>
	
    </div>
	<jsec:isLoggedIn>

          <!-- Menu section -->
      <div id="nav1">
		<ul id="menus">
		   <li class="current"><g:link action="home" controller="person">Home</g:link></li>
		   <li><g:link action="list" controller="skill">Skills</g:link></li>
			<jsec:hasRole name="Administrator">
		   	<li><g:link action="show" controller="admin">Admin</g:link></li>
			</jsec:hasRole>
		   <li><a href="#">About us</a></li>
		</ul>
		<g:if test="${false}">
		<div style="text-align:right;padding-right:10px;">
			<g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
			 	<g:textField name="q"/>&nbsp;<input type="submit" value="find" />
			</g:form>
		</div>
		</g:if>
      </div><div class="clear"></div>
      
	</jsec:isLoggedIn>
	
    <div id="content-wrapper">
      <div id="main">
        <g:layoutBody/>
      </div>
	  <jsec:isLoggedIn>

      <div id="sidebar">
		 
		 
		 <!--<g:if test="${showMyResumes}">-->
         <h3>My Resumes</h3> 
			<div style="text-align:left">
 			  <g:link controller="person" action="createResume">Add Resume</g:link>
			</div>

		   <ul class="sidemenu">
	           <g:each var="r" in="${resume.Resume.findAllByPerson(person)}">
	             <li>
				    <g:link action="show" controller="resume" id="${r.id}" target="_blank">${r.name}</g:link>
					<a class="menu" href='/resume/pdf/show?url=/resume/show/${r.id}'>PDF</a>
				    <g:link class="menu" action="editResume" controller="person" id="${r.id}">edit</g:link>				
					<g:link class="menu" onclick="return confirm('Are you sure?');" action="delete" controller="resume" id="${r.id}">delete</g:link>				
				  </li>
	           </g:each>
         	</ul>
		  <!-- </g:if> -->

      </div>
      </jsec:isLoggedIn>
    </div>

	<br/>
    <div id="footer">
      <p>Copyright &copy; 2009 <a href="http://www.centricconsulting.com">Centric Consulting</a></p>
    </div>
    </div>
  </body>
</html>
