*** Settings ***
Resource                   ../resources/common.robot
Suite Setup                Setup Browser
Suite Teardown             End suite
Default Tags               testgen                     production

*** Test Cases ***
Entering A Lead             
    QWeb.Appstate          Login
    Set Tags               Lead                        Sales
    LaunchApp              Sales
    ClickText              Leads
    VerifyText             Change Owner
    ClickText              New
    VerifyText             Lead Information
    UseModal               On
    Picklist               Salutation                  Ms.
    TypeText               First Name                  Tina
    TypeText               Last Name                   Smith
    Picklist               Lead Status                 New
    TypeText               Phone                       +12234567858449             First Name
    TypeText               Company                     Growmore                    Last Name
    TypeText               Title                       Manager                     Address Information
    TypeText               Email                       tina.smith@gmail.com        Rating
    TypeText               Website                     https://www.growmore.com/
    Picklist               Lead Source                 Partner
    ClickText              Save                        partial_match=False
    UseModal               Off
    Sleep                  1
    ClickText              Details
    VerifyField            Name                        Ms. Tina Smith
    VerifyField            Lead Status                 New
    VerifyField            Phone                       +12234567858449
    VerifyField            Company                     Growmore
    VerifyField            Website                     https://www.growmore.com/
    ${phone_num} =         GetFieldValue               Phone
    Should Match Regexp    ${phone_num}                ^[+]\\d{14}$

 Converting A Lead To Opportunity-Account-Contact
    Set Tags               Lead                        Sales
    ClickText              Leads
    VerifyText             Tina Smith
    VerifyText             Manager
    VerifyText             Growmore
    ClickText              Leads
    ClickText              Tina Smith                  recognition_mode=vision
    ClickUntil             Convert Lead                Convert
    ClickText              Opportunity                 2
    TypeText               Opportunity Name            Growmore Pace
    ClickText              Convert                     2
    VerifyText             Your lead has been converted                            timeout=30
    ClickText              Go to Leads
    ClickText              Opportunities
    VerifyText             Growmore Pace
    ClickText              Accounts
    VerifyText             Growmore
    ClickText              Contacts
    VerifyText             Tina Smith

 Creating An Account
    Set Tags               Account                     Sales
    ClickText              Accounts
    ClickUntil             Account Information         New
    TypeText               Account Name                Salesforce                  anchor=Parent Account
    TypeText               Phone                       +12258443456789             anchor=Fax
    TypeText               Fax                         +12258443456766
    TypeText               Website                     https://www.salesforce.com
    Picklist               Type                        Partner
    Picklist               Industry                    Finance
    TypeText               Employees                   35000
    TypeText               Annual Revenue              12 billion
    ClickText              Save                        partial_match=False
    ClickText              Details
    VerifyText             Salesforce
    VerifyText             35,000


 Creating An Opportunity For The Account
    Set Tags               Account                     Sales
    ClickText              Accounts
    VerifyText             Salesforce
    VerifyText             Opportunities
    ClickUntil             Stage                       Opportunities
    ClickUntil             Opportunity Information     New
    TypeText               Opportunity Name            Safesforce Pace             anchor=Cancel            delay=2
    TypeText               Search Accounts...          Salesforce                  check=False
    ClickText              +12258443456789
    Picklist               Type                        New Business
    ClickText              Close Date                  Opportunity Information
    ClickText              Next Month
    ClickText              Today
    Picklist               Stage                       Prospecting
    TypeText               Amount                      5000000
    Picklist               Lead Source                 Partner
    TypeText               Next Step                   Qualification
    TypeText               Description                 This is first step
    ClickText              Save                        partial_match=False
    Sleep                  1
    ClickText              Opportunities
    VerifyText             Safesforce Pace

 Change status of opportunity
    Set Tags               Opportunities               Sales
    ClickText              Opportunities
    ClickText              Safesforce Pace             delay=2
    VerifyText             Contact Roles
    ClickText              Show actions for this object
    ClickText              Add Contact Roles
    TypeText               Search Contacts...          Tina                        delay=2
    ClickText              Tina Smith
    ClickText              Next                        delay=3
    ClickText              Edit Role: Item 1
    ClickText              --None--
    ClickText              Decision Maker
    ClickText              Save                        partial_match=False
    VerifyText             Tina Smith
    ClickText              Mark Stage as Complete
    ClickText              Opportunities               delay=2
    ClickText              Safesforce Pace
    VerifyStage            Qualification
    VerifyStage            Prospecting                 selected=false


 Create A Contact For The Account
    Set Tags               Account                     Sales
    ClickText              Accounts
    VerifyText             Salesforce
    VerifyText             Contacts
    ClickUntil             Email                       Contacts
    ClickUntil             Contact Information         New
    Picklist               Salutation                  Mr.
    TypeText               First Name                  Richard
    TypeText               Last Name                   Brown
    TypeText               Phone                       +00150345678134             anchor=Mobile
    TypeText               Mobile                      +00150345678178
    TypeText               Search Accounts...          Salesforce                  check=False
    ClickText              +12258443456789
    TypeText               Email                       richard.brown@gmail.com     anchor=Reports To
    TypeText               Title                       Manager
    ClickText              Save                        partial_match=False
    Sleep                  1
    ClickText              Contacts
    VerifyText             Richard Brown


 Delete Test Data
    Set Tags               Account                     Sales
    ClickText              Accounts
    VerifyText             Salesforce
    ClickText              Salesforce                  partial_match=False
    ClickText              Show more actions
    ClickText              Delete
    UseModal               On
    ClickText              Delete
    UseModal               Off
    VerifyText             Growmore
    Clicktext              Growmore                    partial_match=False
    ClickText              Show more actions
    ClickText              Delete
    UseModal               On
    ClickText              Delete
    UseModal               Off

Creating An Account2
    Set Tags               Account                     Sales
    LaunchApp              Sales
    ClickText              Accounts
    ClickUntil             Account Information         New
    TypeText               *Account Name               Copado
    TypeText               Phone                       +12223333333
    TypeText               Website                     https://www.copado.com
    Picklist               Type                        Partner
    Picklist               Industry                    Finance
    TypeText               Employees                   600
    TypeText               Annual Revenue              2 billion
    ClickText              Save                        partial_match=False
    ClickText              Details
    VerifyText             Copado
    ClickText              Show more actions
    ClickText              Delete
    UseModal               On
    ClickText              Delete
    UseModal               Off