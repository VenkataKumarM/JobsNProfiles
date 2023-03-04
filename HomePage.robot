*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library  Dialogs
Library  SignUpVal.py
Library     SignInVal.py
Library     OperatingSystem
Library     String
Library     Collections
Library  ExtendedSelenium2Library
Library  JMapping.py
*** Variables ***
${browser}  Chrome
${url}  https://jobsnprofiles.com/
${element id}   //*[@id="custom_carousel"]/div[2]/ul/li[3]/div[2]/a/img

${entered_email}   natraj@gmail.com
${entered_pass}     Neha@123
${signedup_url}     https://jobsnprofiles.com/Jsdashboard

${file_2}   C:\\Users\\Venkata Kumara Swami\\Downloads\\Resume.pdf
${path1}    /html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[5]/div/div[1]/div[1]/div[1]/div[2]
${name1}    Full-Time
${job role}     Machine Learning
${job_location1}    Austin
${chek0}    C:\\Users\\Venkata Kumara Swami\\Downloads\\Screenshot_20220808_142820_com.android.mms.jpg
*** Keywords ***


*** Test Cases ***
TheamColor
    open browser  ${url}    ${Browser}
    maximize browser window
    click element  xpath://*[@id="cookie-consent-button"]
    sleep   3
    Wait Until Element Is Enabled    css:.navbar
    ${css_nav}     Get Webelement     css:.navbar

    ${nav_bgcolor}    Call Method    ${css_nav}     value_of_css_property     background-color
    ${nav_fontcolor}    Call Method     ${css_nav}   value_of_css_property      color
    ${font_style}    Call Method    ${css_nav}     value_of_css_property     font-family

    # provided data
    ${theme_bgcolor}    Set Variable    rgba(64, 104, 130, 1)
    ${theme_fontcolor}  Set Variable    rgba(255, 255, 255, 1)
    ${theme_fontstyle}  Set Variable    Roboto, sans-serif

    IF  '${nav_bgcolor}'=='${theme_bgcolor}' and '${nav_fontcolor}'=='${theme_fontcolor}' and '${theme_fontstyle}'=='${font_style}'
        Log To Console    Theme bg color,font color,style matched
    ELSE
        Log To Console    Theme bg color,font color, style didn't match
    END
FJButtonMouseHover
    sleep   5
    Wait Until Element Is Enabled       xpath://*[@id="_button"]
    ${check}  Mouse Over    xpath://*[@id="_button"]
    ${register_bg}=     Get WebElement      css:#_button:hover
    sleep   4
    ${color3}=       Call Method     ${register_bg}     value_of_css_property   box-shadow
    Log To Console  color is ${color3}
    ${over_color}   Set Variable    rgba(49, 112, 143)
    IF  '${over_color}' == '${color3}[16]'
        Log To Console  Find Jobs Button Mouse Hover color is matched
    ELSE
        Log To Console  Find Jobs Button Button Mouse Hover color didn't matched
    END

FeatureJobsTitle
    ${register_bg}  Get Webelement  css:.title_heading
    ${originalcolor}  Call Method     ${register_bg}     value_of_css_property        font-weight
    ${testcolor}     Set Variable    700
    IF    '${testcolor}'=='${originalcolor}'
        Log To Console   feature jobs tittle format matched
    ELSE
        Log To Console    feature jobs tittle format not matched
    END
BottomImages
    Wait Until Element Is Enabled   xpath://*[@id="custom_carousel"]/div[2]/ul/li[5]/div[2]/a/img
    sleep   2
    ${width}    ${height}    Get Element Size    xpath://*[@id="custom_carousel"]/div[2]/ul/li[5]/div[2]/a/img
    ${i}    Set Variable     35

    IF  ${width} == ${i} and ${height} == ${i}
        Log To Console  Bottom Images Size Matched
    ELSE
        Log To Console  Bottom Images Size Not Matched
    END
TopCompanyImageTitle
    Wait Until Element Is Enabled    css:.feature-box-1 .icon
    ${css_height}   Get Webelement  css:.feature-box-1 .icon
    ${css_width}    Get Webelement    css:.feature-box-1 .icon
    ${css_title}    Get Webelement  css:.feature-box-1 h5
    ${height_jnp}    Call Method    ${css_height}    value_of_css_property    height
    ${width_jnp}    Call Method    ${css_width}    value_of_css_property    width

    ${title_font}        Call Method     ${css_title}    value_of_css_property   font-size
    ${title_fontweight}        Call Method     ${css_title}    value_of_css_property   font-weight
    ${title_color}        Call Method     ${css_title}    value_of_css_property   color

    ${height1}    Set Variable     70px
    ${width1}    Set Variable     70px

    ${font_size}     Set Variable    15px

    ${font_weight}   Set Variable   600
    ${font_color}    Set Variable   rgb(64, 104, 130, 1)

    IF    '${height_jnp}'=='${height1}' and '${width_jnp}'=='${width1}'
        Log To Console   Top Company Images Sizes are matched
    ELSE
        Log To Console    Top Company Images Sizes are not matched

    END

    IF  '${title_font}'=='${font_size}' and '${font_weight}'=='${title_fontweight}' and '${font_color}'=='${title_color}'
        Log To Console  Top Company title, font size,font weight,font color matched
    ELSE
        Log To Console  Top Company title, font size,font weight,font color didn't match
    END

SocialLinks
    ${wid}    Get WebElement      css:#footer .footer-top .social-links a
    ${hei}   Get WebElement      css:#footer .footer-top .social-links a

    ${width}    Call Method     ${wid}      value_of_css_property       width
    ${height}   Call Method     ${hei}      value_of_css_property       height

    ${set_wid}  Set Variable    36px
    ${set_hei}  Set Variable    36px
    IF  '${width}' == '${set_wid}'
        Log To Console  Social link size Matched
    ELSE
        Log To Console  Social link size Not Matched
    END
JB_SignUpVal
    click link      link:Job Seeker
    click link      link:Sign Up
    input text      name:firstName  venkata kumara swami m
    input text      name:email  ${entered_email}
    ${EData}=   emailval  ${entered_email}
    Log To Console  ${EData}
    input text      name:password   ${entered_pass}
    input text      name:confirmPassword    ${entered_pass}
    ${PData}=   passward  ${entered_pass}
    Log To Console  ${PData}
    [Arguments]                 ${Status_Locator}                ${Checkbox_Locator}            ${Excel_Value}

    ${Is_Checkbox_Selected}=    Run Keyword And Return Status    terms_and_condition    ${Status_Locator}
    ${Actual_Chkbx_Value}=      Run Keyword If      '${Is_Checkbox_Selected}'== 'True'    Set Variable    terms & condition box Default Enabled
    ...    ELSE IF    '${Is_Checkbox_Selected}'== 'False'    Set Variable    terms and condition box Default Disabled
    Log To Console    ${Actual_Chkbx_Value}

    Run Keyword If    '${Is_Checkbox_Selected}'!='${Actual_Chkbx_Value}'    Click Element    terms_and_condition
    Log To Console  terms & conditions box Enabled Sucessfully

    ${wid}    Get WebElement      css:#theme-button
    ${width}        Call Method     ${wid}      value_of_css_property       width
    ${colr}        Call Method     ${wid}      value_of_css_property       color

    #Log To Console  Button Size is ${width} Button color is ${colr}
    click button    id:theme-button
    sleep   4
    ${url_signup}     Get Location
    #Log to Console  url is:${url_signup}
    # here checking the inputs if  exists user in redirect to sign in page
    IF  '${url_signup}' == '${signedup_url}'
        Log To Console  New User Regiter Sucessfully
        ${NewUrl}=      Get Location
        IF  '${NewUrl}' == 'https://jobsnprofiles.com/Jsdashboard'
            Log To Console  New User Signin Sucessfully
            sleep   5
        ELSE
            Log To Console  Page Loading Problem
        END
    ELSE
        Log To Console  User already register
        sleep   4
        Click Link      xpath://*[@id="login-link"]
        ${Login_url}=   Get Location
        input text      name:email  ${entered_email}
        ${val_email}     emailval1    ${entered_email}
        Log To Console  ${val_email}
        input text      name:password   ${entered_pass}
        ${val_pass}     passward1    ${entered_pass}
        Log To Console  ${val_pass}
        Execute Manual Step     please enter recaptcha
        click button    xpath://*[@id="theme-button"]
        Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[1]/a       timeout=10s
        ${sucessurl}=   Get Location
        IF  '${sucessurl}' == 'https://jobsnprofiles.com/Jsdashboard'
            Log To Console  Exist User Signin Sucessfully
        ELSE
            Log To Console  SignIn Problem
        END
        sleep   3

    END

#SignInVal
##    open browser    ${url}  ${browser}
##    Maximize Browser Window
##    click element   xpath://*[@id="cookie-consent-button"]
#    click link      link:Job Seeker
#    click link      link:Sign In
#    #${signinurl}=   Get Location
#    input text      name:email  ${entered_email}
#    ${val_email}     emailval1    ${entered_email}
#    Log To Console  ${val_email}
#    input text      name:password   ${entered_pass}
#    ${val_pass}     passward1    ${entered_pass}
#    Log To Console  ${val_pass}
#    Execute Manual Step     please enter recaptcha
#    click button    xpath://*[@id="theme-button"]
#    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[1]/a
#    ${sucessurl}=   Get Location
#    IF  '${sucessurl}' == 'https://jobsnprofiles.com/Jsdashboard'
#            Log To Console  Signin Sucessfully
#    ELSE
#        Log To Console  SignIn Problem
#    END
#    sleep   2

MostResentJobs
    sleep   3
    Wait Until Element Is Visible   css:#most_recentjobs > div > div > div.row > div:nth-child(1) > div > div > div.col-sm-12.col-md-3.logo > img   timeout=10s
    ${img1}  Get Webelement  css:#most_recentjobs > div > div > div.row > div:nth-child(1) > div > div > div.col-sm-12.col-md-3.logo > img
    ${width1}  Call Method     ${img1}     value_of_css_property        width
    ${heigth1}  Call Method     ${img1}     value_of_css_property        height
    ${bor}  Get Webelement  css:#mostRecentJob .card
    ${border1}  Call Method     ${bor}     value_of_css_property        border
    Wait Until Element Is Visible   xpath://*[@id="most_recentjobs"]/div/div/div[2]/div[6]/div/div/div[1]/img
    ${img6}  Get Webelement  css:#most_recentjobs > div > div > div.row > div:nth-child(6) > div > div > div.col-sm-12.col-md-3.logo > img
    ${width6}  Call Method     ${img6}     value_of_css_property        width
    ${heigth6}  Call Method     ${img6}     value_of_css_property        height

    IF  "${width1}" == '70px' and "${heigth1}" == '65px' and "${width6}" == '70px' and "${heigth6}" == '65px' and "${border1}" == '1px solid rgb(112, 112, 112)'
        Log To Console  Image heigth and width,and border matched in most resent jobs
    ELSE
        Log To Console  Image heigth and width,and border not-matched in most resent jobs
    END
    click button    xpath://*[@id="_button"]
    sleep   1
    Wait Until Element Is Visible   xpath:/html/body/div/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=15s
    Log To Console  Page Redirected Sucessfully
    Click element       xpath:(//a[text()='Dashboard'])[2]
    sleep   5

    Run Keyword And Ignore Error        Scroll Element Into View    xpath:(//*[text()='View all'])[3]
    sleep   1
    click element   xpath:(//*[text()='View all'])[3]
    sleep   2
    click element   xpath://*[text()='Find Recruiters']     #find recruiter
    sleep   4
    Wait Until Element Is Visible    xpath://*[@id="navbarNav"]/ul/li[1]/a      timeout=15s
    click element   xpath://*[@id="navbarNav"]/ul/li[1]/a       #dash board
    sleep   10
    Wait Until Element Is Visible   xpath://*[@id="_button3"]    timeout=10s
    sleep   3

    Run Keyword And Ignore Error        Scroll Element Into View    css:#_button3
    sleep   1
    ${check}  Mouse Over    css:#_button3
    ${elem}    Get Webelement    css:#_button3:hover
    ${bg color}    Call Method    ${elem}    value_of_css_property    box-shadow
    Log To Console  mouse over color is ${bg color}[:25]
    ${over_color}   Set Variable    rgba(255, 100, 20, 0.667)
    IF  '${bg color}[:25]' == '${over_color}'
        Log To Console  Update Button Color Is Matched
    ELSE
        Log To Console  Update Button Color Is Not Matched
    END
    click element   xpath://*[@id="_button3"]
    sleep   3
    ${salary}=      Get Text    xpath:(//*[@class='list-group mb-2'])//span//span[1]      #city
    #Log To Console  City is ${salary}
    Wait Until Element Is Visible   xpath:(//*[name()='path'])[12]  timeout=10s
    click element   xpath:(//*[name()='path'])[12]
    Select From List By Label   xpath:(//*[@class='form-select form-control'])[3]   Anchorage
    sleep   1
    click element   xpath://*[text()='Update']
    sleep   4
    Wait Until Element Is Visible   xpath://*[@id="root"]/div/div[3]/div/div[1]/div[1]/div[1]/div/ul/div[2]/div[2]/li    timeout=10s
    ${salary1}=      Get Text    xpath:(//*[@class='list-group mb-2'])//span//span[1]      #city
    #Log To Console  updated city is ${salary1}
    IF  '${salary}' != '${salary1}'
        Log To Console  City Feild Is Updated
    ELSE
        Log To Console  City Feild Is Not Updated
    END
    Click element       xpath://*[@id="navbarNav"]/ul/li[1]/a       #dash bord
    sleep   3

Pagination

    Wait Until Element Is Visible       xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input    timeout=10s
    ${login_url}=    Get Location
    input text  xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input    ${job role}
    input text  xpath://*[@id="exampleInputPassword1"]      ${job_location1}
    click button    xpath://*[@id="_button"]
    sleep   8
    ${fetch_url}=    Get Location
    IF  '${fetch_url}' != '${login_url}'
        Log To Console  Records fetched sucessfully
    ELSE
        Log To Console  Loading Problem
    END


    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[2]/a    timeout=10s
    sleep   2
    Set Focus To Element    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[2]/a
    sleep   2
    click link   link:3
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=10s
    Log To Console  Jobs are visible
    sleep   2
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[1]    timeout=10s
    Log To Console  Page Numbers and Job numbers visible

    sleep   3
    Set Focus To Element    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a     timeout=7s
    sleep   2
    click link  link:22
    Wait Until Element Is Visible     xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6   timeout=7s
    Log To Console  Jobs are visible

    sleep   2
    Set Focus To Element    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[4]/div[1]/div[2]/div/nav/ul/li[3]/a
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[4]/div[1]/div[2]/div/nav/ul/li[3]/a     timeout=7s
    sleep   2
    click link  link:18
    Wait Until Element Is Visible     xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6   timeout=7s
    Log To Console  Jobs are visible
    sleep   2

    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[1]/a       # Dash Board
    sleep   2
P_Filter

    Wait Until Element Is Visible       xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input    timeout=7s
    ${login_url}=    Get Location
    sleep   2
    click button    xpath://*[@id="_button"]
    sleep   5
    ${fetch_url}=    Get Location
    IF  '${fetch_url}' != '${login_url}'
        Log To Console  Records fetched sucessfully
    ELSE
        Log To Console  Loading Problem
    END

#    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[1]/input
#    sleep   5
#
#    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[5]/a    timeout=5s
#    sleep   5
#    Set Focus To Element    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[5]/a
#    sleep   5
#    click link   link:5
#    Log To Console  Pagination with filters are accessible
#    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[1]/a       # Dash Board

    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[1]/input
    sleep   2

    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[5]/a    timeout=5s
    sleep   2
    Set Focus To Element    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[5]/a
    sleep   2
    click link   link:5
    sleep   2
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=7s
    Log To Console  Jobs are visible


    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a    timeout=5s
    sleep   2
    Set Focus To Element    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a
    sleep   2
    click link  link:12
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=7s
    Log To Console  Jobs Are visible
    sleep   2
    #click element   xpath:(//*[local-name()='svg'])[19]
    Set Focus To Element    xpath:(//*[@id="accordion-body"]/ul/li[1]/input)[2]
    sleep   1
    click element   xpath:(//*[@id="accordion-body"]/ul/li[1]/input)[2]     #fulltime
    sleep   1
    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[2]/input
    sleep   1
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[2]/input  #part time
    sleep   1
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[1]    timeout=7s
    ${data}=    Get Text    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[1]
    Log To Console  find jobs are:${data}
    sleep   2
#    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[2]/input      timeout=7s
#    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[2]/input
#    sleep   2
#    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[2]/input
#    sleep   2

    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[3]/input      #contract
    sleep   2
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[3]/input
    sleep   2
    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[5]/a
    wait until element is visible   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[5]/a     timeout=7s
    sleep   2
    click link  link:5
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6
    Log To Console  Jobs are Visible
    sleep   2
    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a     timeout=7s
    sleep   2
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[11]/div[1]/div[2]/div/nav/ul/li[7]/a
    sleep   2
    Wait Until Element Is Visible   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=7s
    Log To Console      Jobs Are visible
    sleep   2
    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[3]/input      #contract
    sleep   2
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[3]/input      #contract
    sleep   2
    Set Focus To Element    xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[4]/input
    sleep   2
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[4]/input
    sleep   2
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div[2]/div[2]/div/ul/li[4]/input      timeout=7s
    ${data_}=       Get Text    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[1]
    Log To Console  find jobs are:${data_}
    sleep   2
    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[1]/a
    sleep   2

JobsMapping

    Wait Until Element Is Visible       xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input        timeout=10s
    ${login_url}=    Get Location
    input text  xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input    ${job role}
    input text  xpath://*[@id="exampleInputPassword1"]      ${job_location1}
    click button    xpath://*[@id="_button"]
    sleep   8
    ${fetch_url}=    Get Location
    IF  '${fetch_url}' != '${login_url}'
        Log To Console  Records fetched sucessfully
    ELSE
        Log To Console  Loading Problem
    END
    sleep   5
    Wait Until Element Is Visible       xpath:/html/body/div/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=10s

    ${data1}      Get Text    xpath:/html/body/div/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6
    Log To Console  Job Title is ${data1}
    ${data2}     Get Text    xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[2]/small[1]/span
    click element   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6
    sleep   5
    ${skills1}=     Get Text    xpath:/html/body/div/div/div[3]/section/div[1]/div[2]/div[1]/div[2]/div/div[1]/p[5]
    Log To Console      ${skills1}
    ${map_data}=     job_name    ${job role}     ${data1}   ${skills1}
    Log To Console  ${map_data}
    ${loc_res}=      loc1    ${job_location1}    ${data2}
    Log To Console  ${loc_res}
    click element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # dash board
    sleep   3
AddResume
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[2]/a   timeout=7s
    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[2]/a   # file manager
    Wait Until Element Is Visible   xpath://*[@id="file_main"]/div/section/div/div[1]/nav/ul/li[2]/a   timeout=7s
    click element   xpath://*[@id="file_main"]/div/section/div/div[1]/nav/ul/li[2]/a    #My resume
    Wait Until Element Is Visible   xpath://*[@id="dropdownMenuButton1"]   timeout=7s
    #click link      xpath://*[@id="main-content"]/div/div/div/p/a
    click element   xpath://*[@id="dropdownMenuButton1"]
    click link  xpath://*[@id="actions"]/div[1]/div/div[1]/div/ul/li[1]/a

    input text      xpath://*[@id="addresume"]/div/div[1]/div/input     Python Developer
    input text      xpath://*[@id="addresume"]/div/div[2]/div/input     Venkata Kumara Swami M
    input text      xpath://*[@id="addresume"]/div/div[3]/div/input     Python Developer
    input text      xpath://*[@id="addresume"]/div/div[4]/div/input     raj@gmail.com
    sleep   1
    press keys      xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[5]/div/div/div[1]/div[1]/div[2]    ENTER
    input text          xpath://*[@id="addresume"]/div/div[6]/div/input     9014221400
    Select From List By Index   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[7]/div/select    10   #country
    sleep   3
    Select From List By Index   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[8]/div/select    2   # state
    sleep   3
    Select From List By Index   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[9]/div/select    3   # city

    Choose File     xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[11]/div/input    ${file_2}

    Select Frame    xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[12]/div/div/div[1]/div[2]/div[1]/iframe
    input text      xpath:/html/body/p  I am Good Python Developer
    Unselect Frame
    Select From List By Index   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[14]/div/select   2
    sleep   3
    Select From List By Index   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[15]/div/select   3
    sleep   3
    Select From List By Index   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[16]/div/select   3
    input text  xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[17]/div/input    2
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[18]/button[1]    timeout=7s
    click button    xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/form/div/div[18]/button[1]
    ${URl1}=   Get Location
    IF  '${URl1}' == 'https://jobsnprofiles.com/Filemanager#'
            Log To Console  Resume Added and Page Redirected Sucessfully
    ELSE
        Log To Console  Resume not added and Page Loading Problem
    END
    sleep   5
    Click Element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # DAsh Board
    sleep   2

ResumeActivation
    Wait Until Element Is Visible   xpath://*[@id="role"]   timeout=10s
    ${data1}=     Get Text    xpath://*[@id="role"]
    ${data2}=      Get Text    xpath://*[@id="location_exp"]
    @{company}=     Split String    ${data1}
    @{Ex_Loc}=      Split String    ${data2}
    #Log To Console  Company name @{company}     # getting job details in list format
    #Log To Console  Location Is @{Ex_Loc}       # geting job location in list format
    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[2]/a   # file manager
    Wait Until Element Is Visible  xpath://*[@id="file_main"]/div/section/div/div[1]/nav/ul/li[2]/a     timeout=10s
    click element   xpath://*[@id="file_main"]/div/section/div/div[1]/nav/ul/li[2]/a    # my resumes
    Wait Until Element Is Visible       xpath://*[@id="main-content"]/div/div/div[1]/div/div/div[4]/span/div/input      timeout=10s

    ${BG}   Get WebElement     xpath://*[@id="main-content"]/div/div/div[1]/div/div/div[4]/span/div/input
    ${bg color}    Call Method    ${BG}    value_of_css_property    background-color
    ${BG1}   Get WebElement     xpath://*[@id="main-content"]/div/div/div[2]/div/div/div[4]/span/div/input
    ${bg color1}    Call Method    ${BG1}    value_of_css_property    background-color


    IF  '${bg color}' == 'rgba(64, 104, 130, 1)'
        Click Element   xpath://*[@id="main-content"]/div/div/div[2]/div/div/div[4]/span/div/input
        sleep   5
        Log To Console  second Resume is primary activated
    ELSE

        Click Element   xpath://*[@id="main-content"]/div/div/div[1]/div/div/div[4]/span/div/input
        sleep   5
        Log To Console  First Resume is Primary activated
    END

    Click Element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # DAsh Board
    sleep   5
    Wait Until Element Is Visible   xpath://*[@id="role"]
    ${data_1}=     Get Text    xpath://*[@id="role"]
    ${data_2}=      Get Text    xpath://*[@id="location_exp"]
    @{company_1}=     Split String   ${data_1}
    @{Ex_Loc_1}=      Split String   ${data_2}
    FOR     ${I}    IN  @{company}
        FOR     ${J}    IN  @{company_1}
            Exit FOR Loop IF    '${I}' != '${J}'
        END
    END
    Log To Console  Data Updated
    sleep   2

FollowRecruiter

    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[3]/a
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div[2]/div/ul/li[2]/button       timeout=10s
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/ul/li[1]/button   #my recruiter
    #Wait Untill Element Is Visible  css:#footer_ > div:nth-child(1) > small
    #click element   css:#footer_ > div:nth-child(1) > small
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div/div[1]/div/section/div/div/div[2]/div[1]/div/div/div[3]/div[1]/small      timeout=15s
    click element   xpath:/html/body/div[1]/div/div[3]/div[2]/div/div/div[1]/div/section/div/div/div[2]/div[1]/div/div/div[3]/div[1]/small
    sleep   5
    click element   xpath:/html/body/div[5]/div/div/div[1]/button   # close Button
    Click Element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # DAsh Board
    sleep   5

AddFiles
    click element   xpath:/html/body/div[1]/div/div[3]/nav/div/div/ul/li[2]/a       # file manger
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/div[1]/div[1]/div/div[1]/div/button    timeout=10s
    click element   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/div[1]/div[1]/div/div[1]/div/button    # new file
    Wait Until Element Is Visible   xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/div[1]/div[1]/div/div[1]/div/ul/li[2]/a   timeout=10s
    Choose File  xpath:/html/body/div[1]/div/div[3]/div/div/section/div/div[2]/div[1]/div[1]/div/div[1]/div/ul/li[2]/a  ${chek0}
    sleep   4
    Click Element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # DAsh Board
    sleep   4
ApplyJob
    sleep   2
    ${login_url}=    Get Location
    Wait Until Element Is Visible       xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input    timeout=7s
    input text  xpath://*[@id="root"]/div/div[3]/div[1]/div/div/div/div/div[3]/form/div/div[1]/input    ${job role}
    input text  xpath://*[@id="exampleInputPassword1"]      ${job_location1}
    click button    xpath://*[@id="_button"]
    sleep   5
    ${fetch_url}=    Get Location
    IF  '${fetch_url}' != '${login_url}'
        Log To Console  Records fetched sucessfully
    ELSE
        Log To Console  Loading Problem
    END
    Wait Until Element Is Visible       xpath:/html/body/div/div/div[3]/div[2]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6     timeout=7s

    click element   xpath://*[@id="searchJobPage"]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h6
    Wait Until Element Is Visible    xpath://*[@id="job-details-view"]/div[2]/div[1]/a      timeout=10s
    sleep   5
    click element   xpath://*[@id="job-details-view"]/div[2]/div[1]/a   # apply button
    Wait Until Element Is Visible   xpath://div[@role='dialog']//button[text()='Apply Now']     timeout=7s
    sleep   5
    click button   xpath://div[@role='dialog']//button[text()='Apply Now']
    sleep   5
    ${data}=    Get Text    css:#job-details-view > div.buttons-div-main > div:nth-child(1) > a
    IF  '${data}' == 'Applied'
        Log To Console  Applied JOb Sucessfully
        Click Element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # DAsh Board
        sleep   5
    ELSE
        Log To Console  Not Applied Job
        Click Element   xpath:/html/body/div[5]/div/div/div[1]/button
        Click Element   xpath:/html/body/div[1]/div/nav/div/div/ul/li[1]/a      # DAsh Board
        sleep   5
    END
