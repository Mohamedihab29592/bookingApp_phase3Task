# booking_app


## Table of contents
- ### [main packages used =>](#main-packages-used)
- ### [Folder structure =>](#folder-structure)
- ### [Screenshots =>](#screenshots)
- ### [Demo video =>](#demo-video)

## Main packages used
- [dio](https://pub.dev/packages/dio) to make integration with API
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) as state management
- [shared_preferences](https://pub.dev/packages/shared_preferences) to handle caching data
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) to use Google map
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) to handle internet connection 
- [get_it](https://pub.dev/packages/get_it) to make dependency injection
- [location](https://pub.dev/packages/location) to get user's location
- [image_picker](https://pub.dev/packages/image_picker) to pick image from mobile storage
- [localization](https://pub.dev/packages/localization) to handle localization
- [google_sign in](https://pub.dev/packages/google_sign_in) to handle localization



## Folder structure
We have applied clean archeticture concept and here is the basic folder structure:

core folder structure that flutter provides:

```
booking_app
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

Here is the folder structure we have been using in this project:
```
lib

├── core
├── featuers
├── bloc_observer.dart
└── main.dart
```


### core
This folder contains all services and tools related to the application
```
core
├── app_localization
├── compnent
├── di                      
├── dio_service             
├── error
├── local
├── network        
├── routes                  
├── services     
├── usecase              
└── utils                   
```


### features
This folder containes everything related to the screen of the application and the business logic of the application specificly state management.
```
presentation
├── auth
├── home
└── onBoarding
├── search
├── splash_screen
```



## Screenshots
Here are some screeshots for the application




## Demo Video





