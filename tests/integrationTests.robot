*** Settings ***
Library              QWeb
Library              QForce
Resource             ../resources/common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite
Default Tags         testgen                     integration

*** Test Cases ***
Integration Tests Dev1
# Bike Object Tests
    QWeb.Appstate    Login
    Set Tags         Bike Shop        US-0000006
    LaunchApp        Bike Shop
    ClickText        Show Navigation Menu
    # VerifyText       Home
    # ClickText        Home
    # ClickText        Show Navigation Menu
    # VerifyText       Bikes
    ClickText        Bikes
    # Set Tags         Bike
    # ClickText        App Launcher
    # TypeText          Search apps and items...      Bike
    # LaunchApp        Bikes
    ClickText        New                         delay=1
    UseModal         On
    TypeText         *Bike Name                  CRT Test Bike
    PickList         Brand                       Trek
    ClickText        Purchase Date               partial_match=False
    ClickText        Today
    ClickText        Save                  partial_match=False    delay=1
    # VerifyText       *Bike Name
    # TypeText         *Bike Name                  CRT Test Bike v2
    # PickList         Brand                       Salsa
    # ClickText        Purchase Date               partial_match=False
    # ClickText        Today
    # ClickText        Save                        partial_match=False
    UseModal         Off
    # ClickText        Show Navigation Menu
    # VerifyText       Bikes
    # ClickText        Bikes
    # VerifyText       CRT Test Bike
    # ClickText        CRT Test Bike               partial_match=False
    ClickText        Show more actions
    ClickText        Delete
    UseModal         On
    ClickText        Delete
    UseModal         Off
    # VerifyText       CRT Test Bike v2
    # ClickText        CRT Test Bike v2            partial_match=False
    # ClickText        Show more actions
    # ClickText        Delete
    # UseModal         On
    # ClickText        Delete
    # UseModal         Off
