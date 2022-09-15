*** Settings ***
Library              QWeb
Library              QForce
Resource             ../resources/common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite
Default Tags         integration

*** Test Cases ***
Integration Tests Dev1
    # Bike Object Tests
    QWeb.Appstate    Login
    Set Tags         Bike Shop                   US-0000006
    ClickText        App Launcher
    LaunchApp        Bike Shop
    ClickText        Show Navigation Menu
    ClickText        Home
    ClickText        Show Navigation Menu
    ClickText        Bikes
    ClickText        New
    TypeText         *Bike Name                  Test Bike 1
    PickList         Brand                       Trek
    ClickText        Save                        partial_match=False
    ClickText        Close                       partial_match=False
    ClickText        Show Navigation Menu
    ClickText        Bikes
    ClickText        Refresh
    ClickText        Test Bike 1                 partial_match=False
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    ClickText        Refresh
    VerifyNoText     Test Bike 1
