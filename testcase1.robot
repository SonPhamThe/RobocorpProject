*** Settings ***
Library     RPA.Browser.Selenium
Library     tasks.py


*** Variables ***
${LOGIN_URL}    https://demo.nopcommerce.com/login
${USERNAME}     thesonpham120499@gmail.com
${PASSWORD}     @Sonpham1204


*** Tasks ***
LoginTest
    Open Browser    ${LOGIN_URL}    browser=Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://a[@class='ico-login']
    Click Element    xpath://a[@class='ico-login']
    Wait Until Element Is Visible    id:Email
    Input Username ${USERNAME}
    Input Text    id:Password    ${PASSWORD}
    Click Login Button
    Wait Until Element Is Visible    xpath://div[@class='header-links']//a[@class='ico-account']
    ${logged_in}    Get Text    xpath://div[@class='header-links']//a[@class='ico-account']
    IF    '${logged_in}' == '${USERNAME}'
        Log    Login successful!
    ELSE
        Log    Login failed!
    END
    Close Browser


*** Keywords ***
Input Username
    [Arguments] ${username}
    Input Text    id:Email    ${username}

Input Password
    [Arguments] ${password}
    Input Text    id:Password    ${password}

Click Login Button
    Click Button    xpath://button[@type='submit']
