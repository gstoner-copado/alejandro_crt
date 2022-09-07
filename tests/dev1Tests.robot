*** Settings ***
Library                QWeb
Library                QForce
Resource               ../resources/common.robot
Suite Setup            Setup Browser
Suite Teardown         End suite
Default Tags           testgen                     dev1

*** Test Cases ***
 US-0000006 Test Case
    # Bike Shop App Access
    QWeb.Appstate      Login
    Set Tags           Bike Shop                   US-0000006
    LaunchApp          Bike Shop
    ClickText          Show Navigation Menu
    VerifyText         Home
    ClickText          Home
    ClickText          Show Navigation Menu
    VerifyText         Bikes
    ClickText          Bikes

US-0000007 Test Case
    [Documentation]
    [Tags]             Bike Shop                   US-0000007
    QWeb.Appstate      Login
    ClickText          App Launcher
    LaunchApp          Bike Shop
    ClickText          Show Navigation Menu
    ClickText          Bikes
#create first test bike
    ClickText          New
    TypeText           *Bike Name                  Trek Bike Test         
    PickList           Brand                       Trek
    ClickText          Purchase Date               partial_match=False
    ClickText          Previous Month
    ClickText          1
#create test purchaser account
    ClickText          Purchaser
    ClickText          New Account
    UseModal           On
    TypeText           Account Name*               Bike Purchaser Test     
    TypeText           Phone                       12223334444
    PickList           Type                        Customer
    PickList           Industry                    Environmental
    ClickText          Save                        partial_match=False
    UseModal           Off
    ClickText          Save                        partial_match=False
    ClickText          Close                       partial_match=False
    ClickText          Bike Purchaser Test         partial_match=False
    ScrollTo           Bikes
#create additional test bikes
    ClickText          New                         partial_match=False
    TypeText           *Bike Name                  Salsa Bike Test
    PickList           Brand                       Salsa
    ClickText          Purchase Date               partial_match=False
    ClickText          1
    ClickText          Save & New
    
    TypeText           *Bike Name                  Marin Bike Test        
    PickList           Brand                       Marin
    ClickText          Purchase Date               partial_match=False
    ClickText          Previous Month
    ClickText          Previous Month
    ClickText          1
    ClickText          Save & New
    
    TypeText           *Bike Name                  Cannondale Bike Test
    PickList           Brand                       Cannondale
    ClickText          Purchase Date               partial_match=False
    ClickText          Previous Month
    ClickText          Previous Month
    ClickText          10
    ClickText          Save & New
    
    PickList           Brand                       Rad Power
    TypeText           *Bike Name                  Rad Power Bike Test
    ClickText          Purchase Date               partial_match=False
    ClickText          Previous Month
    ClickText          15
    ClickText          Save                        partial_match=False
    ClickText          Close Trek Bike Test
#Delete Test Account
    ClickText          Show Navigation Menu
    ClickText          Accounts
    ClickText          Bike Purchaser Test
    ClickText          Show more actions
    ClickText          Delete
    UseModal           On
    ClickText          Delete
    UseModal           Off
    ClickText          Refresh
#Delete Test Bikes
    ClickText          Show Navigation Menu
    ClickText          Bikes
    Clicktext          Bike Test                   partial_match=True
    ClickText          Show more actions
    ClickText          Delete
    UseModal           On
    ClickText          Delete
    UseModal           Off
    Clicktext          Bike Test                   partial_match=True
    ClickText          Show more actions
    ClickText          Delete
    UseModal           On
    ClickText          Delete
    UseModal           Off
    Clicktext          Bike Test                   partial_match=True
    ClickText          Show more actions
    ClickText          Delete
    UseModal           On
    ClickText          Delete
    UseModal           Off
    Clicktext          Bike Test                   partial_match=True
    ClickText          Show more actions
    ClickText          Delete
    UseModal           On
    ClickText          Delete
    UseModal           Off
    VerifyNoText       Bike Test



    #                  create bike object test preconfigured. add create bike app as additional step? in trial setup, creating additional
    # about creating CRT and setting up. look into creating package with config updates. QA person is the one building the test case.