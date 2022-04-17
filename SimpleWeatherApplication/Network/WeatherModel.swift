//
//  WeatherModel.swift
//  SimpleWeatherApplication
//
//  Created by Wafaa Dwikat on 14/04/2022.
//

import Foundation
import Alamofire
import UIKit


/// Weather Model
class WeatherModel {
    
    /**
     Get weather.
     - Parameter key: as String.
     - Parameter location: as String.
     - Parameter aqi: as String.
     - Parameter completion: as closure
     */
    static func getWeather(key: String, location: String, aqi: String,  completion: @escaping (Result<WeatherDetails, NetworkError>) -> Void) {
        AF.request(WeatherRouter.getWeather(key: key, location: location, aqi: aqi)).responseJSON {
            response in
            guard let dataBack = response.value as? NSDictionary else {
                completion(.failure(.invalidResponse))
                return
            }
            let weather = WeatherDetails(jsonObject: dataBack )
            completion(.success(weather))
        }
    }
}


/// Network Error
enum NetworkError: Error {
    case invalidResponse
}
