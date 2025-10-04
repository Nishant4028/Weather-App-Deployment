import requests
from flask import Flask, render_template, request

app = Flask(__name__)

# Your WeatherAPI key — keep this secure in production
API_KEY = "728c513b24494db2b33121525251309"

@app.route('/', methods=['GET', 'POST'])
def weather():
    weather_data = None
    if request.method == 'POST':
        city = request.form['city']
        url = f"http://api.weatherapi.com/v1/current.json?key={API_KEY}&q={city}&aqi=no"
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            weather_data = {
                'city': data['location']['name'],
                'country': data['location']['country'],
                'temperature': data['current']['temp_c'],
                'condition': data['current']['condition']['text'],
                'icon': data['current']['condition']['icon']
            }
        else:
            weather_data = {'error': 'City not found or API error'}
    return render_template('index.html', weather=weather_data)

if __name__ == '__main__':
   app.run(host='0.0.0.0', port=5000, debug=True)