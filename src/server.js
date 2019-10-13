const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');
const app = express()

//const apiKey = 'd759f5c23f95bf6c8ac762df900ff9';
const apiKey = '6ed22518eb90cef1db5c648bc27deff2';
const fahrenheit = 'imperial';
const celsius = 'metric';

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));
app.set('view engine', 'ejs')

app.get('/', function (req, res) {
  res.render('index', {weather: null, error: null});
})

app.post('/', function (req, res) {
  let city = req.body.city;
  //let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&units=imperial&appid=${apiKey}`
  let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&units=${celsius}&appid=${apiKey}`


  request(url, function (err, response, body) {
    if(err){
      res.render('index', {weather: null, error: 'Error, please try again'});
    } else {
      let weather = JSON.parse(body)
      if(weather.main == undefined){
        res.render('index', {weather: null, error: 'Error, please try again'});
      } else {
        let weatherText = `It's ${weather.main.temp} degrees celsius in ${weather.name}!`;
        res.render('index', {weather: weatherText, error: null});
      }
    }
  });
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})
