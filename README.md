# Resedential app

**Overview:**
   The Residential Management Application project aims to streamline and automate various aspects of managing residential properties. It provides a centralized platform for property owners, tenants, and property managers to efficiently handle tasks such as rent collection, maintenance requests, lease management, and communication.

**Target Audience:**
   - **Property Owners:** Individuals or companies owning residential properties looking to streamline property management processes and improve efficiency.
   - **Property Managers:** Professionals responsible for managing multiple residential properties seeking a centralized platform to automate tasks and enhance communication with tenants.
   - **Tenants:** Residents of managed properties who benefit from convenient tools for rent payments, maintenance requests, and communication with property managers.

##

Residential Management Application written in Flutter.

## Screenshots
|Profile  									                    |Chat                                        |Notice                                        |
|-----------------------------------------------|--------------------------------------------|----------------------------------------------|
|<img src='screenshots/profile.gif' width='250'>|<img src='screenshots/chat.gif' width='250'>|<img src='screenshots/notice.gif' width='250'>|
|Complaints								                      |Voting                                      |Contacts                                        |
|<img src='screenshots/complaints.gif' width='250'>|<img src='screenshots/voting.gif' width='250'>|<img src='screenshots/contacts.gif' width='250'>|
|Social Media 									                   |Health                                        |Visitor                                        |
|<img src='screenshots/social.gif' width='250'>    |<img src='screenshots/health.gif' width='250'>|<img src='screenshots/visitor.gif' width='250'>|

## Features
First user to register is given admin access by default. Rest of the users do not have admin access by default.
* User types
  * Admin
    * give / revoke admin access
    * disable / enable access to application
  * User
  * Disabled
* Profile Management
  * Edit name, email, password, profile picture
* Chat
* Notice
  * Add, Edit, Delete notice (admin access required)
  * Translate into regional Indian languages
  * Text to speech
* Complaints
  * like, comment on complaints
  * Analyse complaints
* Voting (admin access required to initiate voting)
  * Set timer
* Visitor authentication
  * add / edit visitors (admin access required)
  * send sms to respective flat (admin access required)

## Getting Started

#### 1. [Setup Flutter](https://flutter.dev/docs/get-started/install)
#### 2. Clone the repo
```
$ https://github.com/M-Saaim/resedentialapp.git
```
#### 3. [Setup Firebase and firestore](https://firebase.google.com/)
* Enable authentication (email/ password)
* Enable Cloud Firestore
* Enable Storage

## What's next
* IOS support

#### To setup Firebase, download the flutterfire cli and run the commands in the firebase setup.bash or run

` bash firebase_setup.bash `

You don't need to go to firebase.google.com to create a new project manually or add your application to the existing application

## Resources 

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



