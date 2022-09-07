*** Settings ***
Library              QWeb
Library              QForce
Resource             ../resources/common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite
Default Tags         testgen                     dev1

*** Test Cases ***
 US-0000006 Test Case
    # Bike Shop App Access
    QWeb.Appstate    Login
    Set Tags         Bike Shop        US-0000006
    LaunchApp        Bike Shop
    ClickText        Show Navigation Menu
    VerifyText       Home
    ClickText        Home
    ClickText        Show Navigation Menu
    VerifyText       Bikes
    ClickText        Bikes

   #  create bike object test preconfigured. add create bike app as additional step? in trial setup, creating additional 
   # about creating CRT and setting up. look into creating package with config updates.