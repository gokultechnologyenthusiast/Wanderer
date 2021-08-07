# wanderer

An application to swipe and store places to your bucket list.

## task given

1. Create a Tinder like carousel to swipe left and right random places using the
API
2. Every card in the app, has the details of the place with place-image and icons
for map (pin-icon), and favorite (heart-icon)
3. On left-swipe, details of the next place are fetched from the API. If the API
response list is over, hit the API again
4. On right-swipe, details of the place are bookmarked and stored
5. If you click on pin-icon, the place should open in GoogleMaps
6. If you click on heart-icon, the place should get stored in the favorites list
7. The favorite places list and detailed view should be available in the offline
mode
8. Extra points if you implement SocialLogins (Google | Facebook | Instagram |
Twitter)

## Getting Started

First thing I did is setup my app code structure and added the core reusable components.

Inside core folder:-

Networking file is not used as the given api always gives an array of location details.

Constant is when common constants used are stored.

enum contain common enums used.

currently there is only one enum to handle api status.

controllers contain common controllers used throughout the app.

Routes are where all routes of app and dependency injection of controllers of specific pages are handled.

Responsive ui folder contains of custom classes which i have created to build beautiful ui for mobile and web. 

then created a controller for home page when I called the location list api with help of a repository.

A mock repository with data for unit test is also written.

the divided app pages to modules started with home.

each widget development in home page is done along with widget test.

app bar is there with a title.

handled internet connectivity along the api call.

sqflite package is used for local storage.

2 tables are created one for bookmarked location and other for favourites location.

when ever the array of location in controller has decreased to a length of 3, then api is called and repopulated the 
list.

each time a place is bookmarked or added as favorite its updated in sql local data base.

book mark place list in not displayed.

favorite places list can be accessed in right side menu.

favorite place detailed view was not done as there wasn't much info in the api.

instead a extra icon is given in list on click will open wiki link in mobile browser.

social login via facebook and google is added sign in process will be those.

firebase auth is used to handle both facebook and google login's. 

logout also added to the menu drawer.

