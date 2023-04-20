
# GiveHope

GiveHope is a user-friendly web application that serves as a platform for charities to list their organizations and for users to donate to causes that they are passionate about. With GiveHope, users can browse through a variety of charitable organizations and easily make donations to support the causes they believe in. Whether you're looking to donate to a local charity or support a global cause, GiveHope provides a seamless and secure way to make a difference. Join our community of passionate individuals who believe in the power of giving and start making a positive impact today!

For this project, I utilized Ruby as the backend and HTML5, SCSS, and JavaScript for the frontend, while leveraging Ruby on Rails as the web framework.

## Screenshots

![App Screenshot](/app/assets/images/GiveHope-Screenshot-1.png)

## Installation

1. Clone project
```bash
git clone git@github.com:SimonHoefling/give-hope.git
```
2. Navigate into the folder
```bash
cd give-hope
```
3. Download dependencies
```bash
bundle install
```
4. Create Cloudinary account
5. Create a .env file and add your private Cloudinary-key to it
6. Create Database
```bash
rails db:create
```
7. Crate Scheema
```bash
rails db:migrate
```
8. Seed the Database
```bash
rails db:seed
```
9. Start the Server
```bash
rails s
```
or
```bash
dev
```
10. Open the browser and go to localhost:3000


## Demo

The app is available as a Progressive Web App (PWA) for phones and can also be accessed on desktop.

http://give-hope.herokuapp.com/
