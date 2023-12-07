# Flutter Login Application

This Flutter application includes a simple login screen design that allows users to log in. Users enter their username and password to access the application. The login information is stored locally within the application using the "shared_preferences" package.
![L1](https://github.com/emreyilldirrm/login_app/assets/149498114/d3721125-0089-4568-8fb5-a41bc613c67c)

## Screens

### Login Screen

The initial screen that welcomes users. It includes username and password input fields along with a "Login" button.

### Successful Login Screen

The screen displayed when the user successfully logs in. It may include the username or a welcome message.
![L3](https://github.com/emreyilldirrm/login_app/assets/149498114/4669407a-22f2-484d-9c1f-42d7c782a0c7)
![L2](https://github.com/emreyilldirrm/login_app/assets/149498114/26e617fd-ea5f-4e67-b01d-aa81b750e651)

## Functionality

- User login is stored locally using the "shared_preferences" package.
- When the application is closed while the user is logged in, they can automatically log in on the next launch.
- An option to log out is available.

## Used Packages

- `flutter/material.dart`: Used for fundamental Flutter material design components.
- `shared_preferences`: Used to store small pieces of data such as user login status.
