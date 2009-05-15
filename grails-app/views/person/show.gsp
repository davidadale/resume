<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show Person</title>
  <resource:tabView />
  <resource:carousel />
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
          <richui:tabLabel selected="${overviewTabSelected}" title="Overview" />
          <richui:tabLabel selected="${skillTabSelected}" title="Skills" />
          <richui:tabLabel selected="${projectTabSelected}" title="Experience" />
          <richui:tabLabel selected="${educationTabSelected}" title="Education" />
          <richui:tabLabel selected="${qualificationsTabSelected}" title="Qualifications" />
          <richui:tabLabel selected="${referencesTabSelected}" title="References" />
        </richui:tabLabels>
        <richui:tabContents>


          <!-- Overview Tab -->
          <richui:tabContent>
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
          </richui:tabContent>  <!-- overview -->

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


          <!-- Experience Tab  -->
          <richui:tabContent>
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
                    <ul>
                      <g:each in="${experience.highlights}" var="hlt">
                        <li> ${fieldValue(bean:hlt, field:'text')}</li>
                      </g:each>
                    </ul>

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

          </richui:tabContent>

          <!-- Education Tab  -->
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

        <richui:tabContent>
            <!-- <richui:carousel direction="horizontal">

<richui:carouselItem> <img src="/richuitest/images/imgs/1.jpg" alt="One"/><br/>One </richui:carouselItem>

<richui:carouselItem> <img src="/richuitest/images/imgs/2.jpg" alt="Two"/><br/>Two </richui:carouselItem>

<richui:carouselItem> <img src="/richuitest/images/imgs/3.jpg" alt="Three"/><br/>Three </richui:carouselItem>

<richui:carouselItem> <img src="/richuitest/images/imgs/4.jpg" alt="Four"/><br/>Four </richui:carouselItem>

</richui:carousel> -->
        </richui:tabContent>
        </richui:tabContents>
      </richui:tabView>
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
    </script>
</body>
</html>
