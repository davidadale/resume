<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>ResuME Application</title>
</head>
<body>
  <div class="body">
    <div id="leftnav">
        <ul>
          <li><a href="" onclick="javascript:return toggleDiv('indCI','contactInfo');">Contact Info <span id="indCI" class="ind">&#x2734</span></a>
                </li>
          <li><a href="" onclick="javascript:return toggleDiv('indOV','overview');">Overview <span class="ind" id="indOV">&#x2734</span></a></li>

                <li><a href="" onclick="javascript:return toggleDiv('indSk', 'skills');">Skills </a><span class="ind" id="indSk"></span></li>
                <li><a href="" onclick="javascript:return toggleDiv('indXp', 'experience');">Experience <span class="ind" id="indXp">&#x2734</span></a></li>
                <li><a href="" onclick="javascript:return toggleDiv('indEd', 'education');">Education <span class="ind" id="indEd">&#x2734</span></a></li>
                <li><a href="" onclick="javascript:return toggleDiv('indRef', 'references');">References <span class="ind" id="indRef">&#x2734</span></a></li>
                <li><a href="" onclick="javascript:return toggleQualsLink();">
                    <span id="quals_header">&#x25B6;</span>&nbsp;Qualifications </a>
                  <ul id="quals" style="display:none;">
                    <li>Publications</li>
                    <li>Certifications</li>
                    <li>Licenses</li>
                    <li>Memberships</li>
                    <li>Awards</li>
                    <li>Patens</li>
                    <li>Community Involvement</li>
                    <li>Interests/Sites</li>
                  </ul>
                </li>
        </ul>
      </div>
    
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>

    <div class="dialog flL">



        <div id="contactInfo" class="section">
          <h3>Contact Information</h3>
          <div class="expsm">
            <span class="expsm-lt">
              <table><tbody>
                <tr><td ><label>Full Name:</label></td><td>${person.fullName}</td></tr>
                <tr><td ><label>Email:</label></td><td> ${fieldValue(bean:person, field:'email')}</td></tr>
                <tr><td ><label>Phone Number:</label></td><td> ${fieldValue(bean:person, field:'phoneNumber')}</td></tr>
                </tbody>
              </table>
            </span>
              <span class="expsm-rt"  style="vertical-align:bottom;">
                 <g:link id="${person.id}" action="edit" controller="person">Edit</g:link>
              </span>
            <div class="clear"></div>
          </div>
        </div>
  
          <!-- Overview  -->
          <div id="overview" class="section">
            <h3>Overview</h3>
            <g:if test="${overview == null}">
              <div align="right">
                <g:link controller="person" action="addOverview" params="['id':person.id]">Add Overview</g:link>
              </div>
            </g:if>
            <g:if test="${overview != null}">
              <div class="expsm">
                <span class="expsm-lt">

                  ${overview?.summary}
                  <g:if test="${overview?.highlights?.size() > 0}">
                    <p>
                    <a href="" class="decN"
                       id="overview_detail_link"
                       title="Show/Hide Details"
                       onclick="javascript:return toggleOverviewDetails();">&#x25BC;</a>
                    </p>
                  </g:if>

                  <div id="overview_details" class="expdet" style="display:none;">
                    <ul>
                      <g:each in="${overview?.highlights}" var="hlt">
                        <li> ${fieldValue(bean:hlt, field:'text')}</li>
                      </g:each>
                    </ul>                                        </div>
                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;"></span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="resumeOverview" action="edit" id="${overview?.id}">Edit</g:link>
                </span>
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:if>
          </div>  <!-- overview -->

          <div id="skills" class="section" style="display:none;">
            <h3>Skills</h3>
            <div align="right">
              <g:link class="edit" action="editSkills" id="${person.id}">Select Skills</g:link><br/>
            </div>
            <div style="height:200px;">
              <ul style="list-style:none;">
                <g:each var="s" in="${skills}">
                  <li style="padding-bottom:5px;"><b>${s.name}</b> - ${s.description}</li>
                </g:each>
              </ul>
            </div>
          </div>


          <!-- Experience Tab  -->
          <div id="experience" class="section">
            <h3>Experience</h3>
            <div align="right">
              <g:link controller="experience" action="create" params="['person.id':person.id]">Add Experience</g:link>
            </div>

            <g:each in="${experiences}" status="i" var="experience">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="experience" action="edit"
                          id="${experience.id}">${fieldValue(bean:experience, field:'companyName')}
                  </g:link>

                  <p>${fieldValue(bean:experience, field:'titleLine')}</p>

                  <a href="" class="decN" id="details_${experience.id}" title="Show/Hide Details"
                     onclick="Effect.toggle('detail_${experience.id}','appear');invertTriangle($('details_${experience.id}'));return false;">&#x25B6;</a>

                  <div id="detail_${experience.id}" class="expdet" style="display:none;">
                    <p>${fieldValue(bean:experience, field:'summary')}</p>
                   
                  </div>
                </span>
                <span class="expsm-rt">
                  ${fieldValue(bean:experience, field:'formattedStartDate')}
                                    &nbsp; - &nbsp;
                  ${fieldValue(bean:experience, field:'formattedCompletionDate')}
                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;"></span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="experience" action="edit" id="${experience.id}">Edit</g:link>
                </span>
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>

          </div>

          <!-- Education Tab  -->
          <div id="education" class="section">
            <h3>Education</h3>
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
                    <tr>
                      <td><g:link controller="education" action="show" id="${education.id}">${education?.organization}</g:link></td>
                      <td><g:formatDate format="yyyy-MM-dd" date="${education?.completed}" /></td>
                    </tr>
                  </g:each>
                </tbody>
              </table>
          </div>
        </div>

        <div id="references" class="section">
          <h3>References</h3>

        </div>

      </div>
    </div>

    <script type="text/javascript">
      function invertTriangle(elm) {
      if (elm.innerHTML == "\u25B6")
      elm.innerHTML = "&#x25BC"
      else
      elm.innerHTML = "&#x25B6"
      }

      function toggleOverviewDetails() {
        Effect.toggle('overview_details','appear')
        invertTriangle($('overview_detail_link'))
        return false
      }

      function toggleQualsLink() {
        Effect.toggle('quals','appear')
        invertTriangle($('quals_header'))
        return false
      }

      function a() {}

      function toggleDiv(indicator, theDiv) {
        Effect.toggle(theDiv,'appear')
        var ind = document.getElementById(indicator)
        if (ind.innerHTML == '\u2734')
          ind.innerHTML = ""
        else
          ind.innerHTML = "&#x2734"
        return false
      }
      
    </script>
</body>
</html>
