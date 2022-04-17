//
//  WeatherDetails.swift
//  SimpleWeatherApplication
//
//  Created by Wafaa Dwikat on 14/04/2022.
//

import Foundation

/// Weather Details
struct WeatherDetails {
    
    /// Location name
    var locationName: String = ""
    
    /// Temperature
    var temperature: Float = 0.0
    
    /// Icon URL
    var iconURL: String = ""
    
    /// Weather Status
    var weatherStatus: String = ""
    
    /**
     Initialization.
     - Parameter jsonObject: as NSDictionary
     */
    init(jsonObject: NSDictionary) {
        if let location = jsonObject["location"] as? NSDictionary, let name = location["name"]{
            self.locationName = name as? String ?? ""
        }
        if let current = jsonObject["current"] as? NSDictionary {
            if let temp = current["temp_c"] {
                self.temperature = temp as? Float ?? 0.0
            }
            if let condition = current["condition"] as? NSDictionary {
                if let icon = condition["icon"] {
                    self.iconURL = icon as? String ?? ""
                    iconURL.insert(contentsOf: "https:", at: iconURL.startIndex)
                }
                if let status = condition["text"] {
                    self.weatherStatus = status as? String ?? ""
                }
            }
        }
    }
}
