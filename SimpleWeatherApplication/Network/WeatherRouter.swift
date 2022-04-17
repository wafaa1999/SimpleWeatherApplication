//
//  WeatherRouter.swift
//  SimpleWeatherApplication
//
//  Created by Wafaa Dwikat on 14/04/2022.
//

import Foundation
import Alamofire

/// Weather router
enum WeatherRouter {
    
    ///  Get weather
    case getWeather(key: String, location: String, aqi: String)
    
    /// Base URL
    var baseURL: String {
        return "https://api.weatherapi.com"
    }
    
    /// Path
    var path: String {
        switch self {
        case .getWeather(_, _, _):
            return "v1/current.json"
        }
    }
    
    /// Method
    var method: HTTPMethod {
        switch self {
        case .getWeather(_, _, _):
            return .get
        }
    }
    
    /// Parameters
    var parameters:  [String: String]?  {
        switch self {
        case .getWeather(let key, let location, let aqi):
            return [
                "key": key,
                "q": location,
                "aqi": aqi
            ]
        }
    }
}


