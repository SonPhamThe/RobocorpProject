*** Settings ***
Library     RPA.Browser.Selenium


*** Variables ***
${LOGIN_URL}    https://demo.nopcommerce.com/login
${USERNAME}     thesonpham120499@gmail.com
${PASSWORD}     @Sonpham1204


*** Tasks ***
LoginTest
    Open Browser    https://demo.nopcommerce.com/login    browser=Chrome
    Click Link    xpath://a[@class='ico-login']
    Input Text    id:Email    thesonpham120499@gmail.com
    Input Text    id:Password    @Sonpham1204
    Wait Until Page Contains Element    xpath://a[@class='button-1 login-button']    timeout=20
    Click Element    xpath://a[@class='button-1 login-button']
    Close Browser
