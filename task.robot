*** Settings ***
Library     OperatingSystem    # Thư viện OS để có thể chạy file Python
Library     RPA.Browser.Selenium
Library     Process


*** Variables ***
${PYTHON}       python    # Đường dẫn tới Python interpreter
${CALC_PY}      ${CURDIR}${/}calc.py    # Đường dẫn tới file calc.py


*** Test Cases ***
Test Addition
    [Documentation]    Test tính tổng của hai số
    ${output} =    Run Process    ${PYTHON}    ${CALC_PY}    5    3    # Chạy hàm add từ file Python
    Should Be Equal As Numbers    ${output.rc}    0    # Kiểm tra kết quả trả về
    Should Be Equal As Numbers    ${output.stdout}    8    # Kiểm tra kết quả là 8
