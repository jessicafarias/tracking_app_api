# Trakin Application Programming Interface

##### This is a back-end API, which provides data to [this application](https://github.com/jessicafarias/tracking_app/tree/feature/app) that I developed.

# Tracking app
Tracking your time

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
  <h3 align="center">Track</h3>

  <p align="center">
    This project is created with the porpuse of register and tracking the time invested on diferent tasks. The UI has diferent interactive elements like a toogle, a funcional carousel to see the task. Also the login/logout is implemented using tokens so fell free to use any password it will be encripted.<br /></p>

<!-- ABOUT THE PROJECT -->

#### Features:
- Create a new user and return a token
- Require authentication for login
- Filter the password
- Create tasks for users

#### Base URL for request
It's deployed [here](https://jesapi.herokuapp.com) on heroku

### Built With
This project was built using these technologies.
* Ruby on Rails
* rack-cors
* GitHub
* Rubocop
* Stylelint


### Getting Started
To get a local copy up and running follow these simple example steps.

### Clone
* Clone this repo:
  - Clone with SSH:
  ```
    git@github.com:jessicafarias/tracking_app_api.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/jessicafarias/tracking_app_api.git
  ```
  - Clone with GitHub CLI
  ```
    gh repo clone jessicafarias/tracking_app_api.git
    
 - cd to tracking_app_api.git


### Setup

Install dependencies:

```
$ bundle install
```

Start the local webserver:

```$ rails s -p 3002``` will open the project at local webserver at http://localhost:3002/ 

### Using | Requests examples using JS

for all request you will need base URL:
const baseUrl = `https://jesapi.herokuapp.com`


#### Create New task
```
const url = `${baseUrl}/tasks`;
const config = `{
    method: 'POST',
    mode: 'cors',
    headers: {
      'Content-Type': 'application/json',
      Authorization: ` Bearer ${token} `,
    },
    redirect: 'follow',
    body: JSON.stringify(data),
  }`
```

#### Get all tasks
```
const url = `${baseUrl}/tasks/`;
const config = `{
    method: 'GET',
    mode: 'cors',
    headers: {
      Authorization: `Bearer ${token} `,
    }`
```

#### Get tasks created today
```
const url = `${baseUrl}/tasks/today`;
const config = `{
    method: 'GET',
    mode: 'cors',
    headers: {
      Authorization: `Bearer ${token}`,
    }`
```

#### Get tasks created yesterday

```
const url = `${baseUrl}/tasks/yesterday`;
const config = `{
    method: 'GET',
    mode: 'cors',
    headers: {
      Authorization: `Bearer ${token}`,
    }`
```

#### Get tasks selecting the date

```
const url = `${baseUrl}/tasks/30-03-2021`;
const config = `{
    method: 'GET',
    mode: 'cors',
    headers: {
      Authorization: `Bearer ${token}`,
    }`
```

#### Create User and Session (Sing up)
```
const url = `${baseUrl}/users/sign_up`;
const config = `{
    method: 'POST',
    mode: 'cors',
    headers: { 'Content-Type': 'application/json' },
    redirect: 'follow',
    body: JSON.stringify(data),
  },`
```

#### Create Session (Login)
```
const url = `${baseUrl}/users/sign_in`;
const config = `{
    method: 'POST',
    mode: 'cors',
    headers: { 'Content-Type': 'application/json' },
    redirect: 'follow',
    body: JSON.stringify(data),
  }`
```

#### Destroy session (Sing out)
```
const apiUrl = `${baseUrl}/users/sign_out`;
const config = `{
    method: 'POST',
    mode: 'cors',
    headers: { 'Content-Type': 'application/json' },
    redirect: 'follow',
    body: JSON.stringify(data),
  }`
```


## Author

## 👤 Jessica Michelle Farías Rosado:
Working as a FullStack developer on this project.

 [![Website](https://img.shields.io/badge/-Website-black?style=for-the-badge&logo=Julia&logoColor=white)](https://jessicafarias.github.io/)

 [![LINKEDIN](https://img.shields.io/badge/-LINKEDIN-0077B5?style=for-the-badge&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/jessica-michelle-farias-rosado/)

 [![EMAIL](https://img.shields.io/badge/-EMAIL-D14836?style=for-the-badge&logo=Mail.Ru&logoColor=white)](mailto:jessica.farias.rosado@gmail.com)
 
 [![TWITTER](https://img.shields.io/badge/-TWITTER-1DA1F2?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/FariasRosado)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jessicafarias/tracking_app_api/issues).

## Show your support

Give a :star: if you like this project!



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/jessicafarias/tracking_app_api.svg?style=flat-square
[contributors-url]: https://github.com/jessicafarias/tracking_app_api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jessicafarias/tracking_app_api.svg?style=flat-square
[forks-url]: https://github.com/jessicafarias/tracking_app_api/network/members
[stars-shield]: https://img.shields.io/github/stars/jessicafarias/tracking_app_api.svg?style=flat-square
[stars-url]: https://github.com/jessicafarias/tracking_app_api/stargazers
[issues-shield]: https://img.shields.io/github/issues/jessicafarias/tracking_app_api.svg?style=flat-square
[issues-url]: https://github.com/jessicafarias/tracking_app_api/issues

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
