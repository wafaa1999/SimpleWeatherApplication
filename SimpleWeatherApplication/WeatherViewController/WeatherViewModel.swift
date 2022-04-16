//
//  WeatherViewModel.swift
//  SimpleWeatherApplication
//
//  Created by Wafaa Dwikat on 14/04/2022.
//

import Foundation
import UIKit

/// Weather view model
class WeatherViewModel{

    /// Weather
    private var weather: WeatherDetails

    /**
     initialization.
     - Parameter weather: as WeatherDetails.
     */
    init(weather: WeatherDetails) {
        self.weather = weather
    }
    
    /**
     Get height of row at indexPath.
     - Parameter fontSize: as Float.
     - Parameter fontFamily: as String.
     - Parameter color: as UIColor.
     - Parameter string: text that will have attributes as String.
     - Returns: string to display as NSAttributedString.
     */
    private func setupStringAttributes(fontSize: Float, fontFamily: String, color: UIColor, stringToAddAttributes: String) -> NSAttributedString {
        let font = UIFont(name: fontFamily, size: CGFloat(fontSize))!
        let fontAttribute = [ NSAttributedString.Key.font: font ]
        let attributedString = NSMutableAttributedString(string: stringToAddAttributes, attributes: fontAttribute)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: stringToAddAttributes.count))
        return attributedString
    }
    
    /**
     Get location name.
     - Returns: string to display as NSAttributedString.
     */
    func getLocationName() -> NSAttributedString {
        return self.setupStringAttributes(fontSize: 25.0, fontFamily: "AvenirNextCondensed-Medium", color: .white, stringToAddAttributes: self.weather.locationName)
    }
    
    /**
     Get icon URL.
     - Returns: icon URL as URL.
     */
    func getIconURL() -> URL? {
        return URL(string: weather.iconURL)
    }
    
    /**
     Get temperature.
     - Returns: string to display as NSAttributedString.
     */
    func getTemperature() -> NSAttributedString {
        let temperatureValue = self.setupStringAttributes(fontSize: 55.0, fontFamily: "AvenirNextCondensed-Medium", color: .white, stringToAddAttributes: String(self.weather.temperature))
        let temperatureType = self.setupStringAttributes(fontSize: 18.0, fontFamily: "AvenirNextCondensed-Regular", color: .white, stringToAddAttributes: "℃")
        let temperature = NSMutableAttributedString()
        temperature.append(temperatureValue)
        temperature.append(temperatureType)
        return temperature
    }
    
    /**
      Get weather status.
      - Returns: string to display as NSAttributedString.
      */
    func getWeatherStatus() -> NSAttributedString {
        return self.setupStringAttributes(fontSize: 18.0, fontFamily: "AvenirNextCondensed-Medium", color: .white, stringToAddAttributes: String(self.weather.weatherStatus))
    }
    
}


////
////  WeatherViewModel.swift
////  SimpleWeatherApplication
////
////  Created by Wafaa Dwikat on 14/04/2022.
////
//
//import Foundation
//
//
///// Movie view model
//class WeatherViewModel{
//
//    /// Movies
//    private var weather: WeatherDetails
//
//    /**
//     Designated init..
//     - Parameter movies: movies as [Movie].
//     */
//    init(weather: WeatherDetails) {
//        self.weather = weather
//    }
//
//    func getLocationName() -> String {
//        
//        return weather.locationName
//    }
//    
//    func getIconURL() -> URL? {
//        return URL(string: weather.iconURL)
//        
//    }
//    
//    func getTemperatureValue() -> String {
//        return "\(weather.temperature )"
//        
//    }
//    
//    func getTemperatureType() -> String {
//        return "℃"
//    }
//    
//    func getWeatherStatus() -> String {
//        return weather.weatherStatus
//        
//    }
//    
//    
//
//}
