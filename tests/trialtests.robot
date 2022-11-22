*** Settings ***
Library                     QWeb
Library                     QForce
Resource                    ../resources/common.robot
Suite Setup                 Setup Browser
Suite Teardown              End suite
Default Tags                dev1

*** Test Cases ***
Bicycle Object Test
    Home
    LaunchApp               Bicycles                    #Test will fail at this point until custom tab is created
    ClickText               New                         partial_match=False
    TypeText                *Bicycle Name               Test Bike Record
    PickList                Type                        Road
    ClickText               Save                        partial_match=False
    VerifyField             Bicycle Name                Test Bike Record
    VerifyField             Type                        Road
    ClickText               Show more actions
    ClickText               Delete
    UseModal                On
    ClickText               Delete
    UseModal                Off


Car Test Create Record
    [Tags]                  US-0000012
    Home
    LaunchApp               Cars
    ClickText               New
    TypeText                Price                       999999.99
    ClickCheckbox           Driveable                   on
    ClickText               Save                        partial_match=True
    VerifyText              was created

    
    # VALIDATION
    VerifyField             Price                       $999,999.99
    VerifyCheckboxValue     Driveable                   on    


    # DELETION/CLEANUP
    ClickText               Delete
    UseModal                On
    ClickText               Delete
    UseModal                Off
    VerifyText              was deleted




