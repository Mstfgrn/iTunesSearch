
# iTunes Search Application

This application brings different types of content structures on iTunes using `iTunes Search API`. A modular structure was created by embedding each component into each other. An attempt has been made to stick to the `MVVM-C Design pattern`. It uses `DefaultNetworkPackage` as a package for **Network Operations**.

## In-app terms of use
- The content that comes after the opening is determined as movie by default.
- In order for the user to search, more than 2 characters must be entered in the search text field.
    - ![alt-text](searchCount.gif) 
- Changing the content segment without filling in the search text field does not yield any results.
    - ![alt-text](searchNeeds.gif) 
- The hidesBarsOnSwipe feature is used in the navigationView structure. If the back title does not appear on the detail screen, it is sufficient to scroll down.

### Preview the app
![alt-text](review.gif) 

## Support
See comments within the project for guidance and implementation flow, or email mustafagorgun87@hotmail.com for support.
