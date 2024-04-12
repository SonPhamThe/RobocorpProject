*** Settings ***
Documentation       Google Translate song lyrics from source to target language.
...                 Saves the original and the translated lyrics as text files.

Library             RPA.Browser.Selenium
Library             DateTime


*** Variables ***
${LYRIC_URL}                https://www.lyrics.com/Peaches
${WAIT_FOR_TRANSLATION}     10s


*** Tasks ***
Google Translate song lyrics from source to target language
    ${lyric}=    Get lyrics
    ${translated_text}=    Translate    ${lyric}
    Log    ${translated_text}
    Save lyrics


*** Keywords ***
Get lyrics
    Open Browser    ${LYRIC_URL}
    ${link_elements}=    Get WebElements    xpath://div[@class='best-matches']//a
    FOR    ${element}    IN    @{link_elements}
        ${link_text}=    Get Text    ${element}
        IF    '${link_text}' == 'Peaches'
            Click Element    ${element}
            BREAK
        END
    END
    # Sử dụng Execute JavaScript trích xuất nội dung của phần tử có id là lyric-body-text
    ${lyric_element}=    Execute JavaScript    return document.querySelector('#lyric-body-text').textContent
    Log    ${lyric_element}
    RETURN    ${lyric_element}

Translate
    [Arguments]    ${lyrics}
    Go To    https://translate.google.com/?sl=en&tl=vi&text=${lyrics}&op=translate
    ${translation_element}=    Set Variable    css:ryNqvb
    Wait Until Element Is Visible    ${translation_element}
    ${translation}=    Get Text    ${translation_element}
    RETURN    ${translation}

Save lyrics
    No Operation
