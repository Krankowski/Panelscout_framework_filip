*** Settings ***
Library    SeleniumLibrary
Documentation    Suit description   #automated tests for scout website

*** Variables ***
#Login in
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}  xpath = //*[@type='submit']
${EMAILINPUT}    xpath = //*[@id='login']
${PASSWORDINPUT}     xpath = //*[@id='password']
${PAGELOGO}     xpath = //*[@title = "Logo Scouts Panel"]

#Wrong password
${LOGINALART}   xpath = //*[text()='Identifier or password invalid.']

#Signing out
${SIGNOUTBUTTON}    xpath = //ul/div[div and div/span[contains(text(), 'Sign out')]]

#Adding a player
${ADDPLAYERBUTTON}      xpath = //a/button[span[contains(text(), 'Add player')]]
${SUBMITBUTTON}     xpath = //*[@type = 'submit']
${PLAYEREMAIL}      xpath = //*[@name='email']
${PLAYERNAME}       xpath = //*[@name='name']
${PLAYERSURNAME}        xpath = //*[@name='surname']
${PLAYERPHONE}      xpath = //*[@name='phone']
${PLAYERWEIGHT}     xpath = //*[@name='weight']
${PLAYERHEIGHT}     xpath = //*[@name='height']
${PLAYERAGE}        xpath = //*[@name='age']
${PLAYERPOSITION}       xpath = //*[@name='mainPosition']
${POPOUTADDEDPLAYER}        xpath = //div[@role = 'alert' and contains(text(), 'Added player')]

#Checking location of the buttons
${NAMEBUTTON}       xpath = //button[span/div/div[contains(text(), 'Name')]]
${SURNAMEBUTTON}       xpath = //button[span/div/div[contains(text(), 'Surname')]]
${AGEBUTTON}       xpath = //button[span/div/div[contains(text(), 'Age')]]
${POSITIONBUTTON}       xpath = //button[span/div/div[contains(text(), 'Main position')]]
${CLUBBUTTON}       xpath = //button[span/div/div[contains(text(), 'Club')]]
${RATINGBUTTON}       xpath = //button[span/div/div[contains(text(), 'Rating')]]
${PLAYERSBUTTON}        xpath = //ul/div[div and div/span[contains(text(), 'Players')]]
${EXPECTEDPREFIX}       Players
${TITLE}

#Adding a match for last created player
${LASTCREATEDPLAYERBUTTON}      xpath = /html/body/div/div[1]/main/div[3]/div[3]/div/div/a[1]/button
${MATCHESBUTTON}        xpath = //ul/div[div and div[span[contains(text(), 'Matches')]]]
${ADDMATCHBUTTON}       xpath = /html/body/div/div[1]/main/a/button
${SUBMITBUTTON_ADDMATCH}        xpath = //*[@type='submit']
${MATCHATHOMEBUTTON}     xpath = //*[@name='matchAtHome' and @value='true']
${POPOUTADDMATCH}       xpath = //div[@role = 'alert' and contains(text(), 'Added match')]
${MYTEAM}       xpath = //*[@name = 'myTeam']
${ENEMYTEAM}        xpath = //*[@name = 'enemyTeam']
${MYTEAMSCORE}      xpath = //*[@name = 'myTeamScore']
${ENEMYTEAMSCORE}       xpath = //*[@name = 'enemyTeamScore']
${MATCHDATE}        xpath = //*[@name = 'date']

*** Test Cases ***
Login to the system
    Open Login Page Fullscreen
    Type in email
    Type in password
    Click on the Submit button
    Assert dashbord
    [Teardown]    Close Browser

Wrong password
    Open Login Page Fullscreen
    Type In Email
    Type In Wrong Password
    Click On The Submit Button
    Visibility of information
    Assert LoginPage
    [Teardown]      Close Browser

Signing out
    Open Login Page Fullscreen
    Type in email
    Type in password
    Click on the Submit button
    Assert dashbord
    Click On The Sign out Button
    Assert LoginPage
    [Teardown]      Close Browser

Adding a player
    Open Login Page Fullscreen
    Type in email
    Type in password
    Click on the Submit button
    Assert dashbord
    Click on the add player button
    Assert add a player page
    Typie in email - player page
    Type in name - player page
    Type in surname - player page
    Typen in phone - player page
    Type in weight - player page
    Type in height - player page
    Type in age - player page
    Type in position - player page
    Click on the submit button - player page
    Assert Jacek Dżdżownica Edit player page
    [Teardown]      Close Browser

Checking location of the buttons
    Open Login Page Fullscreen
    Type in email
    Type in password
    Click on the Submit button
    Assert dashbord
    Click players button
    Wait
    Assert PLayers Page
    Visibility of buttons on players page
    [Teardown]      Close Browser

Adding a match for last created player
    Open Login Page Fullscreen
    Type in email
    Type in password
    Click on the Submit button
    Assert dashbord
    Click on the Last Created Player button
    Assert Last Created Player Page
    Click on the Matches button
    Assert matches page
    Click on the Add Match button
    Assert adding match player page
    Type in My Team
    Type in Enemy Team
    Type in My team score
    Type in Enemy team score
    Type in date
    Click on the Match at Home button
    Click on the Submit Button - adding match player page
    Assert adding player
    [Teardown]      Close Browser


*** Keywords ***
Open login page Fullscreen
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be     Scouts panel - sign in
Wait
    Wait Until Element Is Visible    ${NAMEBUTTON}

#Type ins
Type in email
    Input Text      ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Type in Wrong Password
    Input Text      ${PASSWORDINPUT}    test
Typie in email - player page
    Input Text     ${PLAYEREMAIL}       test@gmail.com
Type in name - player page
    Input Text      ${PLAYERNAME}       Jacek
Type in surname - player page
    Input Text      ${PLAYERSURNAME}        Dżdżownica
Typen in phone - player page
    Input Text      ${PLAYERPHONE}      789 456 123
Type in weight - player page
    Input Text      ${PLAYERWEIGHT}     80
Type in height - player page
    Input Text      ${PLAYERHEIGHT}     190
Type in age - player page
    Input Text      ${PLAYERAGE}        02031998
Type in position - player page
    Input Text      ${PLAYERPOSITION}       defender
Type in My Team
    Input Text      ${MYTEAM}       Coś
Type in Enemy Team
    Input Text      ${ENEMYTEAM}        Łoś
Type in My team score
    Input Text      ${MYTEAMSCORE}      12
Type in Enemy team score
    Input Text      ${ENEMYTEAMSCORE}       8
Type in date
    Input Text      ${MATCHDATE}        19072023

#Click ons
Click on the Submit button
    Click Element       ${SIGNINBUTTON}
Click On The Sign out Button
    Click Element       ${SIGNOUTBUTTON}
Click on the add player button
    Click Element       ${ADDPLAYERBUTTON}
Click on the submit button - player page
    Click Element       ${SUBMITBUTTON}
Click players button
    Click Element       ${PLAYERSBUTTON}
Click on the Last Created Player button
    Click Element       ${LASTCREATEDPLAYERBUTTON}
Click on the Matches button
    Click Element       ${MATCHESBUTTON}
Click on the Add Match button
    Click Element      ${ADDMATCHBUTTON}
Click on the Match at Home button
    Click Element       ${MATCHATHOMEBUTTON}
Click on the Submit Button - adding match player page
    Click Element       ${SUBMITBUTTON_ADDMATCH}
#Visibilities
Visibility of information
    Wait Until Element Is Visible    ${LOGINALART}
    Element Text Should Be    ${LOGINALART}    Identifier or password invalid.
Visibility of buttons on players page
    Wait Until Element Is Visible       ${NAMEBUTTON}
    Wait Until Element Is Visible       ${SURNAMEBUTTON}
    Wait Until Element Is Visible       ${AGEBUTTON}
    Wait Until Element Is Visible       ${POSITIONBUTTON}
    Wait Until Element Is Visible       ${CLUBBUTTON}
    Wait Until Element Is Visible       ${RATINGBUTTON}

#Asserts
Assert dashbord
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     TC_01_alert.png
Assert LoginPage
    Wait Until Element Is Enabled    ${SIGNINBUTTON}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot     TC_02_alert.png
Assert add a player page
    Wait Until Element Is Enabled       ${SUBMITBUTTON}
    Title Should Be    Add player
Assert Jacek Dżdżownica Edit player page
    Wait Until Element Is Visible    ${POPOUTADDEDPLAYER}
    Title Should Be    Edit player Jacek Dżdżownica
Assert PLayers Page
    ${TITLE}=   Get Title
    Should Contain    ${TITLE}      ${EXPECTEDPREFIX}
Assert matches page
    Wait Until Element Is Enabled       ${ADDMATCHBUTTON}
Assert adding match player page
    Wait Until Element Is Enabled       ${SUBMITBUTTON_ADDMATCH}
Assert adding player
    Wait Until Element Is Visible       ${POPOUTADDMATCH}
    Wait Until Element Is Enabled       ${ADDMATCHBUTTON}
Assert Last Created Player Page
    Wait Until Element Is Enabled       ${MATCHESBUTTON}
