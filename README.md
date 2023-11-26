# Weather App Contest

<a href=""><img src="./screenshots/banner.png"></img></a>

A real-time weather application based on the current location of the user or different searchable locations. 

### Language & Tools used:
- Flutter & Dart
- Weatherapi - Real-time weather data API
- Riverpod  - State management


### Demo
Take a look at the [App](https://)

>**This is only a simulation of the mobile user experience from your laptop, desktop or tablet.**

### Screenshot
| Home                                         | Saved List                                   | Search                                       |
| -------------------------------------------- | -------------------------------------------- | -------------------------------------------- |
| <img src="./screenshots/1.png" width="200"/> | <img src="./screenshots/2.png" width="200"/> | <img src="./screenshots/3.png" width="200"/> |

| New York                                     | London                                       | Minsk                                        |
| -------------------------------------------- | -------------------------------------------- | -------------------------------------------- |
| <img src="./screenshots/n.png" width="200"/> | <img src="./screenshots/l.png" width="200"/> | <img src="./screenshots/m.png" width="200"/> |

| Paris                                        | Dubai                                        | Bangkok                                      |
| -------------------------------------------- | -------------------------------------------- | -------------------------------------------- |
| <img src="./screenshots/p.png" width="200"/> | <img src="./screenshots/d.png" width="200"/> | <img src="./screenshots/b.png" width="200"/> |


## weatherapi
- Head over to [weatherapi](https://www.weatherapi.com/) and sign up
- After login create an API key (`Make sure you have the pro+ `) or the weekly data won't be populated. 
- create a file name `api_key.dart` under `lib/auth/`
- add the line below 
>**const $weatherApiKey = 'YOUR_API_KEY_FROM_WEATHER_API';**
- hit flutter run on the selected emulator/device


## Credit
- [heyFluter.com](https://heyflutter.com/)
