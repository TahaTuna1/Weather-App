//
//  WeatherService.swift
//  Weather
//
//  Created by Taha Tuna on 29.04.2023.
//

import Foundation
import CoreLocation


public final class WeatherService: NSObject{
    
    private let locationManager = CLLocationManager()
    private let API_KEY = "" //MARK: DELETE
    private var completionHandler: ((Weather) -> Void)?
    
    public override init(){
        super.init()
        locationManager.delegate = self
    }
    
    public func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)){
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    private func makeDataRequest(forCoordinated coordinates: CLLocationCoordinate2D) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            do {
                
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                let cityName = apiResponse.city.name
                
                
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                var firstFiveDays = [(date: Date, temperature: String, description: String)]()
                
                for item in apiResponse.list.prefix(10) {
                    guard let date = dateFormatter.date(from: item.dt_txt) else { continue }
                    let temperature = "\(Int(item.main.temp))°C"
                    let description = item.weather.first?.description ?? ""
                    let tuple = (date: date, temperature: temperature, description: description)
                    firstFiveDays.append(tuple)
                    
                }
                
                
                
                guard let list = apiResponse.list.first else { return }
                let weather = Weather(list: list, cityName: cityName, firstFiveDays: firstFiveDays)
                
                
                
                
                self.completionHandler?(weather)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}

extension WeatherService: CLLocationManagerDelegate{
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.first else { return }
        makeDataRequest(forCoordinated: location.coordinate)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Something went wrong \(error.localizedDescription)")
    }
}

struct APIResponse: Codable {
    let list: [APIList]
    let city: APICity
}

struct APICity: Codable {
    let name: String
}

struct APIList: Codable {
    let main: APIMain
    let weather: [APIWeather]
    let dt_txt: String
}

struct APIMain: Codable {
    let temp: Double
}

struct APIWeather: Codable {
    let main: String
    let description: String
}
