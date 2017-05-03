<link rel="stylesheet" href="event.css">

- Lived in Rila hotel, Fehér Holló ucta<br>
- Univercity of Science, Pázmány Péter sétány<br>
- Wigner Research Centre for Physics, Konkoly-Thege Miklós<br>
<br>
<div class="eventWrapper" itemscope="" itemtype="http://schema.org/Event">
    <div class="meetingEventHeader">
        

        <h1 itemprop="name">NA49/NA61 Collaboration Meeting</h1>


        <div class="details">
            
    
        from 
      <time itemprop="startDate" datetime="2012-05-14T08:00:00+02:00">Monday, May 14, 2012 at <strong>08:00</strong></time>

        to 
      <time itemprop="endDate" datetime="2012-05-19T18:00:00+02:00">Saturday, May 19, 2012 at <strong>18:00</strong></time>

    (Europe/Zurich)


                <br>at <strong>
    
         Budapest
</strong>
                <div class="address"></div>
        </div>
        



    </div>

    
        

<script type="text/javascript">
var videoServiceInfo = {};
</script>

<div class="meetingEventSubHeader">
    <table class="eventDetails">
        <tbody>
            


</tbody></table><table class="eventDetails" id="eventDetails">
<tbody>



<tr id="materialList">
    <td class="leftCol">Material</td>
    <td>
        <div class="materialList clearfix">
            

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?materialId=0&amp;confId=181349" class="material materialGroup">
        
        hyperlink to Budapest collaboration meeting
    </a>

        
        
        
        
        
        
        
        
        
        
            <a href="http://na61.inf.elte.hu" class="material">
            <img src="https://indico.cern.ch/images/link.png" alt="link}" border="0"></a>
        
        
        
</span>
        </div>
    </td>
</tr>








</tbody>
</table>
<script type="text/javascript">
    $(function(){
        var onSuccess = function(result){
            if(result.msg){
                (new AlertPopup($T("Success"),result.msg)).open();
            }
            if (result.listParticipants){
                if( $("#eventParticipants").length==0){
                    var trParticipants=$(Html.tr({id:"eventParticipants"},
                                                 Html.td({className:"leftCol"},$T("Participants")),
                                                 Html.td({id:"eventListParticipants"},"")).dom);
                    if ($("#eventDescription").length==0){
                        $("#eventDetails").prepend(trParticipants);
                    }else{
                        $("#eventDescription").after(trParticipants);
                    }
                }
                $("#eventListParticipants").text(result.listParticipants).effect("highlight",{},3000);
            }
        };

        var allowEdit = true;
           var userData = {};
            $('#applyLink').click(function(){new ApplyForParticipationPopup('181349','event.participation.applyParticipant',
                    $T('Apply for participation'), userData, onSuccess, allowEdit);});
    });
</script>

        
    
</div>

<div class="meetingEventBody">
    <div style="position: absolute; right: 50px; top: 3px;"><span class="fakeLink dropDownMenu" id="goToDayLink"><strong>Go to day</strong></span></div>
    <script type="text/javascript">
        var goToDayMenuDays = $D({"2012-05-17": "Thursday, May 17, 2012", "2012-05-16": "Wednesday, May 16, 2012", "2012-05-15": "Tuesday, May 15, 2012", "2012-05-14": "Monday, May 14, 2012", "2012-05-19": "Saturday, May 19, 2012", "2012-05-18": "Friday, May 18, 2012"});

        var goToDayMenuDaysKeys = [];
        for(var key in goToDayMenuDays.getAll()) {
            goToDayMenuDaysKeys.push(key);
        }
        goToDayMenuDaysKeys.sort();

        var goToDayMenuItems = {};
        for(i in goToDayMenuDaysKeys){
            goToDayMenuItems[goToDayMenuDaysKeys[i]] = {action:"#"+goToDayMenuDaysKeys[i] , display:goToDayMenuDays.get(goToDayMenuDaysKeys[i])};
        }

        var goToDayLink = $E('goToDayLink');
        var goToDayMenu = null;
        if (keys(goToDayMenuItems).length < 2) {
            goToDayLink.dom.style.display = 'none';
        }
        goToDayLink.observeClick(function(e) {
            // Close the menu if clicking the link when menu is open
            if (goToDayMenu != null && goToDayMenu.isOpen()) {
                goToDayMenu.close();
                goToDayMenu = null;
                return;
            }
            // build a dictionary that represents the menu
            goToDayMenu = new PopupMenu(goToDayMenuItems, [goToDayLink], null, true, true);
            var pos = goToDayLink.getAbsolutePosition();
            goToDayMenu.open(pos.x + goToDayLink.dom.offsetWidth + 10, pos.y + goToDayLink.dom.offsetHeight + 3);
            return false;
        });
    </script>

    <ul class="dayList">
        
            


                <li>
                <div style="width: 100%;">
                    <a name="2012-05-14"></a>
                    <span class="day">Monday, May 14, 2012</span>
                </div>
                <ul class="meetingTimetable">

            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        09:30
            - 10:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">welcome, logistics -  local organizers</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        10:00
            - 10:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">NA61 news</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Marek</span> <span itemprop="lastName">Gazdzicki</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=1&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=1&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=1&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        10:30
        - 11:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:00
            - 11:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Software: status and plans</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Marek</span> <span itemprop="lastName">Szuba</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=2&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=2&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:30
            - 11:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Preservation of the NA49 software and data</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Greg</span> <span itemprop="lastName">Stefanek</span> (Jan Kochanowski University (PL))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Seweryn</span> <span itemprop="lastName">Kowalski</span> (University of Silesia (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=3&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=3&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:50
            - 12:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">conversion of NA49 data to Shoe</span>

            <em>10'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Michael</span> <span itemprop="lastName">Unger</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=4&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=4&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:00
            - 12:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Virtualization: status and plans (transfer to NA61)</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Dag</span> <span itemprop="lastName">Larsen</span> (University of Bergen (NO))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=5&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=5&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=5&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=5&amp;resId=3&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:30
            - 13:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Shine: status and plans</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Andras</span> <span itemprop="lastName">Laszlo</span> (Hungarian Academy of Sciences (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=6&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=6&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=6&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        13:00
        - 14:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">lunch break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:30
            - 15:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Shine: legacy reconstruction chain</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Oskar</span> <span itemprop="lastName">Wyszynski</span> (Jagiellonian University (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=7&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=7&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:00
            - 15:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Shine: simulation chain</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Marek</span> <span itemprop="lastName">Szuba</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=8&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=8&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:30
            - 16:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Legacy simulation chain/MC productions</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Marek</span> <span itemprop="lastName">Szuba</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=9&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=9&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        16:00
        - 16:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:30
            - 17:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Database</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Seweryn</span> <span itemprop="lastName">Kowalski</span> (University of Silesia (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=10&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=10&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:00
            - 17:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Castor issues: NA61 resources and usage</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Marek</span> <span itemprop="lastName">Szuba</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=11&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=11&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:30
            - 18:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">reserve</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>


    </tbody></table>


</li>

            
            

                </ul>
                </li>

                <li>
                <div style="width: 100%;">
                    <a name="2012-05-15"></a>
                    <span class="day">Tuesday, May 15, 2012</span>
                </div>
                <ul class="meetingTimetable">

            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        09:30
            - 10:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">High Energy Physics at Wigner Research Center</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Peter</span> <span itemprop="lastName">Levai</span> (Hungarian Academy of Sciences (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=13&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=13&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        10:00
            - 10:45
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">The Ion acceleration complex at CERN</span>

            <em>45'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Django</span> <span itemprop="lastName">Manglunki</span> (CERN)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=14&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=14&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=14&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        10:45
        - 11:05
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:05
            - 11:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Some recent CMS results on particle spectra</span>

            <em>45'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Ferenc</span> <span itemprop="lastName">Sikler</span> (Hungarian Academy of Sciences (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=15&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=15&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:50
            - 12:25
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Non-extensive and super-statistical models</span>

            <em>35'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Tamas</span> <span itemprop="lastName">Biro</span> (KFKI RMKI)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=16&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=16&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        12:25
        - 14:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">lunch break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:00
            - 15:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">detector status/2012 run</span>

            <em>1h0'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Zoltan</span> <span itemprop="lastName">Fodor</span> (Hungarian Academy of Sciences (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=17&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=17&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=17&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:00
            - 15:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">PSD status</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Alesandr</span> <span itemprop="lastName">Ivashkin</span> (Russian Academy of Sciences (RU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=18&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=18&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=18&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:30
            - 16:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">ToF HV upgrade</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Jovan</span> <span itemprop="lastName">Puzovic</span> (University of Belgrade (RS))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=19&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=19&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=19&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        16:00
        - 16:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:30
            - 17:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">trigger, ToF read-out upgardes and forward tracking</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Prof. <span itemprop="givenName">Alessandro</span> <span itemprop="lastName">Bravar</span> (University of Geneva)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=77&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=77&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=77&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:00
            - 17:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Towards final version of the DCS for NA61 experiment</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Krzysztof</span> <span itemprop="lastName">Dynowski</span> (Warsaw University of Technology (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=20&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=20&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:30
            - 17:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">news on vertex detector for NA61</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Tome</span> <span itemprop="lastName">Anticic</span> (Institute Rudjer Boskovic  (HR))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=21&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=21&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=21&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:50
            - 18:10
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Feasibility of the detection of D<sup>0</sup> mesons in NA61/SHINE experiment</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Pawel Piotr</span> <span itemprop="lastName">Staszel</span> (Jagiellonian University (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=22&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=22&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=22&amp;resId=2&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            
            <a class="material dropDownMaterialMenu" id="materialMenuslidespdf22">
                <img class="resourceIcon" src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file" border="0"><img class="arrow" src="images/menu_arrow_black.png" alt="down arrow" border="0">
            </a>
            <script type="text/javascript">
                $E('materialMenuslidespdf22').observeClick(function() {
                    var elem = $E('materialMenuslidespdf22');
                        materialMenuslidespdf22.open(elem.getAbsolutePosition().x, elem.getAbsolutePosition().y + elem.dom.offsetHeight);
                    }
                );
                var menuItems = {};
                    menuItems["D0Ana_Budapest2012_v1.0.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=22&resId=1&materialId=slides&confId=181349", display: "D0Ana_Budapest2012_v1.0.pdf"}
                    menuItems["D0Ana_Budapest2012_v1.1.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=22&resId=3&materialId=slides&confId=181349", display: "D0Ana_Budapest2012_v1.1.pdf"}
                var materialMenuslidespdf22 = new PopupMenu(menuItems, [$E("materialMenuslidespdf22")], 'materialMenuPopupList', false, false);
            </script>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            

                </ul>
                </li>

                <li>
                <div style="width: 100%;">
                    <a name="2012-05-16"></a>
                    <span class="day">Wednesday, May 16, 2012</span>
                </div>
                <ul class="meetingTimetable">

            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        09:30
            - 10:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">The Digital Universe  - Scientific Data; Science of Data  (Algorithmic Information Theoretical Analyses)</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">András</span> <span itemprop="lastName">Benczúr</span> (ELTE, Faculty of Informatics)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=24&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=24&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=24&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        10:00
            - 10:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Calibration: status and plans</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Greg</span> <span itemprop="lastName">Stefanek</span> (Jan Kochanowski University (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=25&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=25&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        10:30
        - 11:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:00
            - 11:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Migration of calibration to Shine and authomatization</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Roland</span> <span itemprop="lastName">Sipos</span> (Eotvos Lorand University (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=26&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=26&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:30
            - 11:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Mass data reconstruction</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Maja Katarzyna</span> <span itemprop="lastName">Mackowiak-Pawlowska</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Dimitrije</span> <span itemprop="lastName">Maletic</span> (University of Belgrade (RS))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=27&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=27&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:50
            - 12:20
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">dE/dx calibration</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Antoni Jerzy</span> <span itemprop="lastName">Marcinek</span> (Jagiellonian University (PL))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Zoltan</span> <span itemprop="lastName">Fodor</span> (Hungarian Academy of Sciences (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=28&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=28&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:20
            - 12:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">2011 PSD calibration and software</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Alesandr</span> <span itemprop="lastName">Ivashkin</span> (Russian Academy of Sciences (RU))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Marina</span> <span itemprop="lastName">Golubeva</span> (Russian Academy of Sciences (RU))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Oleg</span> <span itemprop="lastName">Petukhov</span> (Russian Academy of Sciences (RU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=29&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=29&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        13:00
        - 14:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">lunch break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:30
            - 14:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">2010/2011 BPD calibration</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Antoni Jerzy</span> <span itemprop="lastName">Marcinek</span> (Jagiellonian University (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=30&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            
            <a class="material dropDownMaterialMenu" id="materialMenuslidespdf30">
                <img class="resourceIcon" src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file" border="0"><img class="arrow" src="images/menu_arrow_black.png" alt="down arrow" border="0">
            </a>
            <script type="text/javascript">
                $E('materialMenuslidespdf30').observeClick(function() {
                    var elem = $E('materialMenuslidespdf30');
                        materialMenuslidespdf30.open(elem.getAbsolutePosition().x, elem.getAbsolutePosition().y + elem.dom.offsetHeight);
                    }
                );
                var menuItems = {};
                    menuItems["bpd_budapest.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=30&resId=0&materialId=slides&confId=181349", display: "bpd_budapest.pdf"}
                    menuItems["noBPD1test.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=30&resId=1&materialId=slides&confId=181349", display: "noBPD1test.pdf"}
                var materialMenuslidespdf30 = new PopupMenu(menuItems, [$E("materialMenuslidespdf30")], 'materialMenuPopupList', false, false);
            </script>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:50
            - 15:10
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">2010/2011 drift velocity calibration</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Antoni</span> <span itemprop="lastName">Aduszkiewicz</span> (University of Warsaw (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=31&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=31&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:10
            - 15:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">ToF-L/R calibration and software</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Mihailo</span> <span itemprop="lastName">Savic</span> (University of Belgrade (RS))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=32&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            
            <a class="material dropDownMaterialMenu" id="materialMenuslidespdf32">
                <img class="resourceIcon" src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file" border="0"><img class="arrow" src="images/menu_arrow_black.png" alt="down arrow" border="0">
            </a>
            <script type="text/javascript">
                $E('materialMenuslidespdf32').observeClick(function() {
                    var elem = $E('materialMenuslidespdf32');
                        materialMenuslidespdf32.open(elem.getAbsolutePosition().x, elem.getAbsolutePosition().y + elem.dom.offsetHeight);
                    }
                );
                var menuItems = {};
                    menuItems["ToF_LR_Calibration_long.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=32&resId=0&materialId=slides&confId=181349", display: "ToF_LR_Calibration_long.pdf"}
                    menuItems["ToF_LR_Calibration_short.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=32&resId=4&materialId=slides&confId=181349", display: "ToF_LR_Calibration_short.pdf"}
                var materialMenuslidespdf32 = new PopupMenu(menuItems, [$E("materialMenuslidespdf32")], 'materialMenuPopupList', false, false);
            </script>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:30
            - 16:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Legacy reconstruction chain</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Boris</span> <span itemprop="lastName">Popov</span> (Joint Inst. for Nuclear Research (RU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=33&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=33&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        16:00
        - 16:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:30
            - 17:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">particle spectra in p+p interactions via dE/dx analysis</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Szymon Mateusz</span> <span itemprop="lastName">Pulawski</span> (University of Silesia (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=38&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=38&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:00
            - 17:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">particle spectra in p+C at 31 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Alexander</span> <span itemprop="lastName">Korzenev</span> (Universite de Geneve (CH))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=39&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=39&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        18:00
            - 20:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">NA61 Collaboration Board</span>

            <em>2h0'</em>    </span>


    <table class="sessionDetails">
        <tbody>


    </tbody></table>


</li>

            
            

                </ul>
                </li>

                <li>
                <div style="width: 100%;">
                    <a name="2012-05-17"></a>
                    <span class="day">Thursday, May 17, 2012</span>
                </div>
                <ul class="meetingTimetable">

            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        09:30
            - 10:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Fermilab neutrino program</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Karol</span> <span itemprop="lastName">Lang</span></span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Karol</span> <span itemprop="lastName">Lang</span> (University of Texas at Austin)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=34&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=34&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        10:00
            - 10:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">US NA61 plans for possible measurements in NA61</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Alysia</span> <span itemprop="lastName">Marino</span> (University of Colorado)</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Alysia</span> <span itemprop="lastName">Marino</span> (University of Colorado Boulder)</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Prof. <span itemprop="givenName">Eric D.</span> <span itemprop="lastName">Zimmerman</span> (University of Colorado)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=35&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            
            <a class="material dropDownMaterialMenu" id="materialMenuslidespdf35">
                <img class="resourceIcon" src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file" border="0"><img class="arrow" src="images/menu_arrow_black.png" alt="down arrow" border="0">
            </a>
            <script type="text/javascript">
                $E('materialMenuslidespdf35').observeClick(function() {
                    var elem = $E('materialMenuslidespdf35');
                        materialMenuslidespdf35.open(elem.getAbsolutePosition().x, elem.getAbsolutePosition().y + elem.dom.offsetHeight);
                    }
                );
                var menuItems = {};
                    menuItems["FermilabNus-May-2012-v1.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=35&resId=1&materialId=slides&confId=181349", display: "FermilabNus-May-2012-v1.pdf"}
                    menuItems["NA61_plans.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=35&resId=0&materialId=slides&confId=181349", display: "NA61_plans.pdf"}
                var materialMenuslidespdf35 = new PopupMenu(menuItems, [$E("materialMenuslidespdf35")], 'materialMenuPopupList', false, false);
            </script>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        10:30
        - 11:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:00
            - 11:45
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">software tools for dE/dx and tof fits</span>

            <em>45'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Silvestro</span> <span itemprop="lastName">Di Luise</span> (Eidgenoessische Tech. Hochschule Zuerich (CH))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=37&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=37&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:45
            - 12:05
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">NA49 news</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Peter</span> <span itemprop="lastName">Seyboth</span> (Max-Planck-Institut fuer Physik (Werner-Heisenberg-Institut) (D)</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=40&amp;materialId=paper&amp;confId=181349" class="material materialGroup">
        
        Paper
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=40&amp;resId=0&amp;materialId=paper&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=40&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=40&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:05
            - 13:05
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">paper draft: p, pbar, n, d and t in p+C at 158 GeV/c</span>

            <em>1h0'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Dezso</span> <span itemprop="lastName">Varga</span> (Eotvos Lorand University (HU))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=45&amp;materialId=paper&amp;confId=181349" class="material materialGroup">
        
        Paper
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=45&amp;resId=0&amp;materialId=paper&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=45&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=45&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=45&amp;materialId=0&amp;confId=181349" class="material materialGroup">
        
        pions in p+p NA49-NA61
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=45&amp;resId=0&amp;materialId=0&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/file_small.png" alt="unknown type file}" border="0"></a>
        
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        13:05
        - 14:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">lunch break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:30
            - 15:10
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">identity analysis software and results on Pb+Pb collisions</span>

            <em>40'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Anar</span> <span itemprop="lastName">Rustamov</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=42&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=42&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:10
            - 15:40
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">identity analysis for p+p interactions</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Maja Katarzyna</span> <span itemprop="lastName">Mackowiak-Pawlowska</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=43&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=43&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:40
            - 16:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">high pT azimuthal correlations</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Marek</span> <span itemprop="lastName">Szuba</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=44&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=44&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        16:00
        - 16:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:30
            - 17:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">news on the 2012 Be run</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Herbert</span> <span itemprop="lastName">Stroebele</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=46&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=46&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:00
            - 17:20
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Energy scan with Pb+Pb collisions</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Marek</span> <span itemprop="lastName">Gazdzicki</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=47&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=47&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
        
        
        
        
        
        
        
            
            <a class="material dropDownMaterialMenu" id="materialMenuslidespdf47">
                <img class="resourceIcon" src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file" border="0"><img class="arrow" src="images/menu_arrow_black.png" alt="down arrow" border="0">
            </a>
            <script type="text/javascript">
                $E('materialMenuslidespdf47').observeClick(function() {
                    var elem = $E('materialMenuslidespdf47');
                        materialMenuslidespdf47.open(elem.getAbsolutePosition().x, elem.getAbsolutePosition().y + elem.dom.offsetHeight);
                    }
                );
                var menuItems = {};
                    menuItems["energy_scan_with_pbpb_v02.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=47&resId=1&materialId=slides&confId=181349", display: "energy_scan_with_pbpb_v02.pdf"}
                    menuItems["2-energy_scan_with_pbpb_v02.pdf"] = {action: "https://indico.cern.ch/getFile.py/access?contribId=47&resId=2&materialId=slides&confId=181349", display: "2-energy_scan_with_pbpb_v02.pdf"}
                var materialMenuslidespdf47 = new PopupMenu(menuItems, [$E("materialMenuslidespdf47")], 'materialMenuPopupList', false, false);
            </script>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:20
            - 17:40
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Open charm and high pT measurements in Pb+Pb at the CERN SPS</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Marco</span> <span itemprop="lastName">Van Leeuwen</span> (University of Utrecht (NL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=48&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=48&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=48&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:40
            - 18:10
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Future NA61 measurements for neutrino physics</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Alain</span> <span itemprop="lastName">Blondel</span> (Universite de Geneve (CH))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=49&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=49&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/powerpoint.png" alt="powerpoint file}" border="0"></a>
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=49&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        18:10
            - 18:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Open Shine</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Marek</span> <span itemprop="lastName">Gazdzicki</span> (Johann-Wolfgang-Goethe Univ. (DE))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=78&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=78&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=78&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        20:00
            - 22:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Collaboration Dinner</span>

            <em>2h30'</em>    </span>


    <table class="sessionDetails">
        <tbody>


    </tbody></table>


</li>

            
            

                </ul>
                </li>

                <li>
                <div style="width: 100%;">
                    <a name="2012-05-18"></a>
                    <span class="day">Friday, May 18, 2012</span>
                </div>
                <ul class="meetingTimetable">

            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        09:30
            - 10:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">paper draft on the 2007 T2K RT analysis</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Nicolas</span> <span itemprop="lastName">Abgrall</span> (Universite de Geneve (CH))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        10:00
            - 10:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">analysis of p+(T2K RT) at 31 GeV/c: dE/dx-tof</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Alexis</span> <span itemprop="lastName">Hasler</span> (Universite de Geneve (CH))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        10:30
        - 11:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:00
            - 11:20
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">analysis of p+(T2K RT) at 31 GeV/c: h-  - Sofia group</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:20
            - 11:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">transverse momentum fluctuations in p+p</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Tobiasz Roman</span> <span itemprop="lastName">Czopowicz</span> (Warsaw University of Technology (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=54&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=54&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:50
            - 12:20
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">azimuthal angle fluctuations and correlations in p+p</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Bartosz</span> <span itemprop="lastName">Maksiak</span> (Warsaw University of Technology (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:20
            - 12:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Lambda and KOs spectra in p+C at 31 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Tomasz Jan</span> <span itemprop="lastName">Palczewski</span> (National Centre for Nuclear Research (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        13:00
        - 14:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">lunch break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:30
            - 15:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">KOs spectra in p+C at 31 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Dragan</span> <span itemprop="lastName">Manic</span> (University of Belgrade (RS))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:00
            - 15:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">normalization for p+p and pi+C 2009 data</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Michael Andreas</span> <span itemprop="lastName">Haug</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Michael</span> <span itemprop="lastName">Unger</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:30
            - 16:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">normalization for p+C at 31 GeV/c 2009 data</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Davide</span> <span itemprop="lastName">Sgalaberna</span> (Eidgenoessische Tech. Hochschule Zuerich (CH))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        16:00
        - 16:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:30
            - 17:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">proton spectra in p+C at 31 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Magdalena Zofia</span> <span itemprop="lastName">Posiadala</span> (University of Warsaw (PL))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Sebastien</span> <span itemprop="lastName">Murphy</span> (Universite de Geneve (CH))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:00
            - 17:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">VMC in NA61</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Laura Amelie</span> <span itemprop="lastName">Zambelli</span> (Univ. P. et Marie Curie (Paris VI) (FR))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:30
            - 17:45
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Fluka in NA61</span>

            <em>15'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Ralph</span> <span itemprop="lastName">Engel</span> (Forschungszentrum Karlsruhe)</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        17:45
            - 18:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Publication strategy of results for T2K</span>

            <em>15'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Boris</span> <span itemprop="lastName">Popov</span> (Joint Inst. for Nuclear Research (RU))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        18:00
            - 18:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">High performance computing on IBM Cell</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Prof. <span itemprop="givenName">Antal</span> <span itemprop="lastName">Járai</span> (Eötvös Loránd University of Sciences)</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            

                </ul>
                </li>

                <li>
                <div style="width: 100%;">
                    <a name="2012-05-19"></a>
                    <span class="day">Saturday, May 19, 2012</span>
                </div>
                <ul class="meetingTimetable">

            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        09:30
            - 10:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">charged particle spectra in pi+C at 158 and 350 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Martin</span> <span itemprop="lastName">Ruprecht</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class="">Dr. <span itemprop="givenName">Hans</span> <span itemprop="lastName">Dembinski</span> (KIT Karlsruhe, Germany)</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        10:00
            - 10:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">pion spectra in p+p interactions</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Antoni</span> <span itemprop="lastName">Aduszkiewicz</span> (University of Warsaw (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        10:30
        - 11:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:00
            - 11:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">V0 analysis in pi+C at 158 and 350 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Michael</span> <span itemprop="lastName">Unger</span> (KIT - Karlsruhe Institute of  Technology (DE))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        11:30
            - 12:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Lambda spectra in p+p at 158 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Andrzej Gabriel</span> <span itemprop="lastName">Wilczek</span> (University of Silesia (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:00
            - 12:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">analysis and draft: hyperon production in p+p at 158 GeV/c</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Tatjana</span> <span itemprop="lastName">Susa</span> (Institute Rudjer Boskovic  (HR))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        12:30
            - 13:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">multiplicity fluctuations in p+p and p+Pb</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Maciej</span> <span itemprop="lastName">Rybczynski</span> (Jan Kochanowski University (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        13:00
        - 14:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">lunch break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        14:30
            - 15:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">system size dependence of phi production</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Volker</span> <span itemprop="lastName">Friese</span> (GSI - Helmholtzzentrum fur Schwerionenforschung GmbH)</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        15:00
            - 15:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">p and pbar production in Pb+Pb</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Marek</span> <span itemprop="lastName">Kowalski</span> (Polish Academy of Sciences (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="breakListItem">
    <span class="topLevelTime">
        15:30
        - 16:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle" style="color: rgb(105, 133, 110);">coffee break</span>
    </span>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:00
            - 16:30
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">long-range correlation analysis and possible applicatio to the NA61 pp and AA data</span>

            <em>30'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speakers:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Mikhail</span> <span itemprop="lastName">Naoumenko</span> (Russian Federal Nuclear Center VNIIEF)</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Vladimir</span> <span itemprop="lastName">Vechernin</span> (St. Petersburg State University)</span>, <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Grigori</span> <span itemprop="lastName">Feofilov</span> (St. Petersburg State University (RU))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:30
            - 16:50
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">pT vs N correlations</span>

            <em>20'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Agnieszka</span> <span itemprop="lastName">Wojtaszek</span> (Jan Kochanowski University (PL))</span>
</td>
        </tr>


    </tbody></table>


</li>

            
            



            



<li class="meetingContrib">
        




    <span class="topLevelTime">
        16:50
            - 17:00
    </span>

    <span class="confModifPadding">
        <span class="topLevelTitle">Phi_phi analysis news</span>

            <em>10'</em>    </span>


    <table class="sessionDetails">
        <tbody>
        <tr>
            <td class="leftCol">Speaker:</td>
            <td>
    
    <span itemprop="performers" itemscope="" itemtype="http://schema.org/Person" class=""> <span itemprop="givenName">Katarzyna</span> <span itemprop="lastName">Grebieszkow</span> (Warsaw University of Technology (PL))</span>
</td>
        </tr>


        <tr>
            <td class="leftCol">Material:</td>
            <td>
                

<span class="materialGroup">
    <a href="https://indico.cern.ch/materialDisplay.py?contribId=79&amp;materialId=slides&amp;confId=181349" class="material materialGroup">
        
        Slides
    </a>

        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=79&amp;resId=1&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/impress.png" alt="presentation file}" border="0"></a>
        
        
        
        
        
        
        
        
        
            <a href="https://indico.cern.ch/getFile.py/access?contribId=79&amp;resId=0&amp;materialId=slides&amp;confId=181349" class="material">
            <img src="https://indico.cern.ch/images/pdf_small.png" alt="pdf file}" border="0"></a>
</span>
            </td>
        </tr>
    </tbody></table>


</li>

            
            </ul>
            </li>
    </ul>
</div>
<script type="text/javascript">
    var slideSpeed = 'fast';
    var tooltipMsgs = {moreinfo : $T('Click here to show / hide detailed information'),
                       morebookings : $T('There are more bookings than is currently shown.<br /> ' +
                                         'Click here to show / hide more information.')};

    $('#collShowBookings').qtip({
        content: tooltipMsgs["morebookings"],
        position: {
            my: 'bottom middle',
            at: 'top middle'
        },
        style: {
            classes: 'ui-tooltip-rounded ui-tooltip-shadow ui-tooltip-light'
        }
    });

    $('.collaborationDisplayMoreInfo').click(function() {
        var newText = ($(this).text() == $T("More Info")) ? $T("Hide info") : $T("More Info");
        var textNode = $(this);
        $(this).closest('.videoServiceWrapper').next('.collabInfoInline').slideToggle(slideSpeed, function() {
            textNode.text(newText);
        });
    });

    $('#collShowBookings').click(function() {
        var newText = ($(this).text() == $T("Show")) ? $T("Hide additional bookings") : $T("Show");
        var textNode = $(this);
        $('#collHiddenBookings').slideToggle(slideSpeed, function() {
            textNode.text(newText);
        });
    });

    $('.bookingLaunchLinkInline').qtip({
        content: {
            text: function() { return videoServiceInfo[$(this).data('id')]; }
        },
        position: {
            my: 'top middle',
            at: 'bottom middle'
        },
        show: {
            solo: true
        },
        hide: {
            event: 'unfocus',
            fixed: true,
            effect: function() {
                $(this).fadeOut(300);
            }
        },
        style: {
            classes: 'ui-tooltip-rounded ui-tooltip-shadow ui-tooltip-popup'
        }
    });

    $('.bookingLaunchLink').qtip({
        content: {
            text: function() { return videoServiceLaunchInfo[$(this).data('id')]; }
        },
        position: {
            my: 'bottom middle',
            at: 'top middle'
        },
        style: {
            classes: 'ui-tooltip-rounded ui-tooltip-shadow ui-tooltip-light'
        }
    });

</script>

    
</div>
