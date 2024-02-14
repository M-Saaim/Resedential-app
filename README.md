# Resedential app

**Overview:**
   The Residential Management Application project aims to streamline and automate various aspects of managing residential properties. It provides a centralized platform for property owners, tenants, and property managers to efficiently handle tasks such as rent collection, maintenance requests, lease management, and communication.

1. **Features:**
   - **Tenant Management:** Allows property managers to maintain tenant records, including contact information, lease agreements, and rental payment history.
   - **Rent Collection:** Facilitates the collection of rent payments through online payment gateways, automating reminders and notifications for overdue payments.
   - **Maintenance Requests:** Enables tenants to submit maintenance requests through the platform, with property managers able to track, prioritize, and assign tasks to maintenance staff.
   - **Lease Management:** Manages lease agreements, including renewal notifications, lease terms, and documentation storage.
   - **Communication Tools:** Provides communication channels between property managers and tenants, allowing for announcements, notices, and general correspondence.
   - **Financial Reporting:** Generates financial reports, including income statements, expense tracking, and tax-related documents for property owners.
   
2. **Benefits:**
   - **Efficiency:** Automates manual processes, reducing administrative overhead and streamlining operations for property managers.
   - **Transparency:** Enhances transparency and communication between property owners, tenants, and managers through centralized access to information and updates.
   - **Tenant Satisfaction:** Improves tenant experience by providing convenient tools for rent payments, maintenance requests, and communication, leading to higher tenant satisfaction and retention.
   - **Financial Management:** Simplifies financial management tasks, such as rent collection and reporting, ensuring accurate record-keeping and financial transparency for property owners.
   
3. **Technology Stack:**
   - **Frontend:** HTML, CSS, JavaScript (React.js or Vue.js)
   - **Backend:** Python (Django or Flask)
   - **Database:** SQL (PostgreSQL, MySQL)
   - **Payment Integration:** Stripe, PayPal
   - **Communication:** Email/SMS API integration
   
4. **Future Enhancements:**
   - **Mobile App:** Develop a mobile application for tenants and property managers to access the platform on-the-go.
   - **Predictive Maintenance:** Implement predictive maintenance algorithms to anticipate and prevent potential issues before they occur.
   - **Integration with IoT Devices:** Integrate with IoT devices for smart home functionalities, such as remote temperature control and energy monitoring.
   - **Data Analytics:** Utilize data analytics to derive insights on tenant behavior, property performance, and market trends for informed decision-making.
   
5. **Target Audience:**
   - **Property Owners:** Individuals or companies owning residential properties looking to streamline property management processes and improve efficiency.
   - **Property Managers:** Professionals responsible for managing multiple residential properties seeking a centralized platform to automate tasks and enhance communication with tenants.
   - **Tenants:** Residents of managed properties who benefit from convenient tools for rent payments, maintenance requests, and communication with property managers.

## Getting Started | FLUTTER Intro
 
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




# ResidentialAPP

Residential Management Application written in Flutter.

## Screenshots
|Profile  									                    |Chat                                        |Notice                                        |
|-----------------------------------------------|--------------------------------------------|----------------------------------------------|
|<img src='screenshots/profile.gif' width='250'>|<img src='screenshots/chat.gif' width='250'>|<img src='screenshots/notice.gif' width='250'>|
|Complaints								                      |Voting                                      |Contacts                                        |
|<img src='screenshots/complaints.gif' width='250'>|<img src='screenshots/voting.gif' width='250'>|<img src='screenshots/contacts.gif' width='250'>|
|Social Media 									                   |Health                                        |Visitor                                        |
|<img src='screenshots/social.gif' width='250'>    |<img src='screenshots/health.gif' width='250'>|<img src='screenshots/visitor.gif' width='250'>|

## Demo
[Download the release apk to try out the application](https://github.com/arjun-14/housingsociety/releases/download/1.0.0/app-release.apk)
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









