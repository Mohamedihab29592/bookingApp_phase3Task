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
Here are some screeshots for the application:


<img src="https://user-images.githubusercontent.com/64233832/194777838-d626bb99-06a3-4bc0-a0a8-d1ab9622da6a.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194777841-c33aceab-1a98-4f22-920a-f095955b1144.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194777843-50851755-fa3f-4f57-8f96-21ccd56b3c03.jpeg" width="300"> 


<img src="https://user-images.githubusercontent.com/64233832/194778303-7d429e5b-38fb-4837-8bda-03257cf3e09d.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778304-ffba60a0-5522-4745-9da4-9f4bc2af7e31.jpeg" width="300"> 

<img src="https://user-images.githubusercontent.com/64233832/194778364-f04e8fba-ab52-4cae-bcaf-23b4ec3577b4.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778367-8c3e1a30-e543-4e2b-b92e-f09cde515d85.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778445-0cce9f87-ed6d-4351-9077-10c1a7e874c2.jpeg" width="300"> 



<img src="https://user-images.githubusercontent.com/64233832/194778757-f10a646d-b66c-4294-8747-97cfc2594bc1.JPG" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778760-f3bbf72c-ead4-4be4-88e2-0bbbcbe06292.jpeg" width="300">

<img src="https://user-images.githubusercontent.com/64233832/194778831-0a5fdd21-73e2-4961-b9ee-c351a1a19d86.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778833-d6c038d0-6feb-4bda-8591-96a02d1d3b22.jpeg" width="300"><img src="https://user-images.githubusercontent.com/64233832/194778835-e5a9419b-92f1-4b30-9b80-b7642b72242b.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778836-d6ec142c-46d1-483c-bbc1-ae3620692119.jpeg" width="300">




<img src="https://user-images.githubusercontent.com/64233832/194778837-cc75611b-0bc1-4373-9e89-39698e09eda6.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778838-54ad7374-4dcb-4bcf-8ead-ec640b46cd78.jpeg" width="300"><img src="https://user-images.githubusercontent.com/64233832/194778841-6dacd2bc-e0c8-48fe-9f93-2a556cbd7810.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778867-c8be568b-8da8-4f2d-b7d7-13e4f9d59105.jpeg" width="300">


<img src="https://user-images.githubusercontent.com/64233832/194778869-4d4e1149-ec74-4050-810f-1d9ec3ac3dbb.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778870-6a408e6f-ff88-4f1a-96de-8ab47e12915f.jpeg" width="300"><img src="https://user-images.githubusercontent.com/64233832/194778872-266a2e5a-707f-45b7-9c5a-f5720191a0e3.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778873-77e4a339-0cd5-4323-8dad-3bd89d258156.jpeg" width="300">


<img src="https://user-images.githubusercontent.com/64233832/194778875-a95bc450-0d5b-427d-b884-0e9442109fa1.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778876-bddfb06a-338f-44e0-af52-edebcf6be422.jpeg" width="300"><img src="https://user-images.githubusercontent.com/64233832/194778878-0741978c-0dfa-4f47-a3b2-825f2d6d6cfe.jpeg" width="300"> <img src="https://user-images.githubusercontent.com/64233832/194778880-04c66ea0-1bd0-4504-90bd-1da531cb9dbe.jpeg" width="300"> <img src="[https://user-images.githubusercontent.com/64233832/194778880-04c66ea0-1bd0-4504-90bd-1da531cb9dbe.jpeg](https://user-images.githubusercontent.com/64233832/194778881-74bdae6c-5d42-4078-99f6-7915076af135.jpeg)" width="300">



## Demo Video








