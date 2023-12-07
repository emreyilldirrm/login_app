# Flutter Login Application

This Flutter application includes a simple login screen design that allows users to log in. Users enter their username and password to access the application. The login information is stored locally within the application using the "shared_preferences" package.

## Screens

### Login Screen

The initial screen that welcomes users. It includes username and password input fields along with a "Login" button.

### Successful Login Screen

The screen displayed when the user successfully logs in. It may include the username or a welcome message.

## Functionality

- User login is stored locally using the "shared_preferences" package.
- When the application is closed while the user is logged in, they can automatically log in on the next launch.
- An option to log out is available.

## Used Packages

- `flutter/material.dart`: Used for fundamental Flutter material design components.
- `shared_preferences`: Used to store small pieces of data such as user login status.
