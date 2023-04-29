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
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{ return }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data){
                self.completionHandler?(Weather(response: response))
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

struct APIResponse: Codable{
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Codable{
    let temp: Double
}

struct APIWeather: Codable{
    
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey{
        case description
        case iconName = "main"
    }
}
