*** Settings ***
Documentation       Inhuman Insurance, Inc. Artificial Intelligence System robot.
...                 Produces traffic data work items.

Library             RPA.HTTP
Library             RPA.JSON
Library             RPA.Tables
Library             RPA.FileSystem


*** Variables ***
${OUTPUT_DIR}           /Users/m143/Documents/pythonProjects
${TRAFFIC_DATA_URL}     https://github.com/robocorp/inhuman-insurance-inc/raw/main/RS_198.json


*** Tasks ***
Produce traffic data work items
    Download traffic data
    ${traffic_data}=    Load traffic data as table
    Log    Traffic data loaded successfully: ${traffic_data}
    [Teardown]    Clean up resources


*** Keywords ***
Download traffic data
    RPA.HTTP.Download
    ...    ${TRAFFIC_DATA_URL}
    ...    ${OUTPUT_DIR}${/}traffic.json
    ...    overwrite=True

Load traffic data as table
    ${json}=    Load JSON from file    ${OUTPUT_DIR}${/}traffic.json
    ${table}=    Create Table    ${json}[value]
    RETURN    ${table}

Clean up resources
    RPA.FileSystem.Remove Files    ${OUTPUT_DIR}${/}traffic.json
