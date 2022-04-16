//
//  WeatherViewController2.swift
//  SimpleWeatherApplication
//
//  Created by Wafaa Dwikat on 16/04/2022.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

/// Weather View Controller
class WeatherViewController2: UIViewController {
    
    /// Weather
    var weather: WeatherDetails?
    
    /// Weather Model View
    private(set) var weatherModelView: WeatherViewModel!
    
    /// Location Name Label
    @IBOutlet weak var locationNameLabel: UILabel!
    
    /// Icon
    @IBOutlet weak var icon: SDAnimatedImageView!
    
    /// Status Label
    @IBOutlet weak var statusLabel: UILabel!
    
    /// Temperature Label
    @IBOutlet weak var temperatureLabel: UILabel!
    
    /// Icon Width
    @IBOutlet weak var iconWidth: NSLayoutConstraint!
    
    /// Loading Inductor
    var loadingInductor: NVActivityIndicatorView!
    
    /// Weather Stack
    @IBOutlet weak var weatherStack: UIStackView!
    /**
     View Did Load.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInductor()
        self.showComponents(isShown: true)
        self.showInductor(isShown: true)
        self.fetchData(key: "f9fb0ed95ba94fc3abf63021221004", location: "Russia", aqi: "no")
    }
    
    /**
      Show indicator.
      - Parameter isShown: as Bool.
      */
    private func showInductor(isShown: Bool) {
        if isShown {
            self.loadingInductor.startAnimating()
        } else {
            self.loadingInductor.stopAnimating()
        }
    }
    
    /**
     Setup indicator configuration.
      */
    private func configureInductor() {
        let size: CGFloat = 70
        let frame = CGRect(x: (view.frame.width - size) / 2, y: (view.frame.height - size) / 2, width: size, height: size)
        loadingInductor = NVActivityIndicatorView(frame: frame, type: .lineSpinFadeLoader, color: .white, padding: 20)
        loadingInductor.backgroundColor = .darkGray
        view.addSubview(loadingInductor)
    }
    
    /**
      Fetch data from API.
      - Parameter key: as String.
      - Parameter location: as String.
      - Parameter aqi: as String.
      */
    private func fetchData(key: String, location: String, aqi: String) {
        WeatherModel.getWeather(key: key, location: location, aqi: aqi) { result in
            switch result {
            case .success(let weatherResult):
                self.weather = weatherResult
                self.weatherModelView = WeatherViewModel(weather: self.weather ?? WeatherDetails(jsonObject: [:]))
                self.setupData()
            case .failure(let error):
              print(error)
            }
        }
    }
    
    /**
     Show Components.
      - Parameter isShown: as Bool.
      */
    private func showComponents(isShown: Bool) {
        self.weatherStack.isHidden = isShown
    }
    
    /**
     Setup received data to  Components.
      */
    private func setupData() {
        self.showInductor(isShown: false)
        self.showComponents(isShown: false)
        self.iconWidth.constant = UIScreen.main.bounds.width * 0.48
        self.locationNameLabel.attributedText = weatherModelView.getLocationName()
        self.icon.sd_setImage(with: weatherModelView.getIconURL(), completed: nil)
        self.statusLabel.attributedText = weatherModelView.getWeatherStatus()
        self.temperatureLabel.attributedText = weatherModelView.getTemperature()
    }
}



////
////  WeatherViewController.swift
////  SimpleWeatherApplication
////
////  Created by Wafaa Dwikat on 14/04/2022.
////
//
//import UIKit
//import SDWebImage
//
//class WeatherViewController: UIViewController {
//
//    var weather: WeatherDetails?
//    private(set) var modelView: WeatherViewModel!
//    @IBOutlet weak var locationNameLabel: UILabel!
//    @IBOutlet weak var icon: SDAnimatedImageView!
//    @IBOutlet weak var statusLabel: UILabel!
//    @IBOutlet weak var temperatureLabel: UILabel!
//    @IBOutlet weak var temperatureTypeLabel: UILabel!
//    @IBOutlet weak var iconWidth: NSLayoutConstraint!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.fetchData(key: "f9fb0ed95ba94fc3abf63021221004", location: "Russia", aqi: "no")
//
//    }
//
//
//    private func fetchData(key: String, location: String, aqi: String) {
//        WeatherModel.getWeather(key: key, location: location, aqi: aqi) { result in
//
//            switch result {
//            case .success(let weatherResult):
//                self.weather = weatherResult
//                self.modelView = WeatherViewModel(weather: self.weather ?? WeatherDetails(jsonObject: [:]))
//                self.setupData()
//
//
//            case .failure(let error):
//              print(error)
//            }
//        }
//    }
//
//    private func setupData() {
//
//        self.iconWidth.constant = UIScreen.main.bounds.width * 0.6
//        self.locationNameLabel.text = modelView.getLocationName()
//        self.icon.sd_setImage(with: modelView.getIconURL(), completed: nil)
//        self.statusLabel.text = modelView.getWeatherStatus()
//        self.temperatureLabel.text = modelView.getTemperatureValue()
//        self.temperatureTypeLabel.text = modelView.getTemperatureType()
//
//    }
//
//
//
//
//}
