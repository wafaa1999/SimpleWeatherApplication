//
//  WeatherViewController.swift
//  SimpleWeatherApplication
//
//  Created by Wafaa Dwikat on 14/04/2022.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

/// Weather View Controller
class WeatherViewController: UIViewController {

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

    /// Loading Indicator
    @IBOutlet weak var loadingIndicator: NVActivityIndicatorView!

    /**
     View Did Load.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureIndicator()
        self.showComponents(isShown: true)
        self.showIndicator(isShown: true)
        self.fetchData(key: "f9fb0ed95ba94fc3abf63021221004", location: "Russia", aqi: "no")
    }

    /**
     Show indicator.
     - Parameter isShown: as Bool.
     */
    private func showIndicator(isShown: Bool) {
        if isShown {
            self.loadingIndicator.startAnimating()
        } else {
            self.loadingIndicator.stopAnimating()
        }
    }

    /**
     Setup indicator configuration.
     */
    private func configureIndicator() {
        loadingIndicator.type = .lineSpinFadeLoader
        loadingIndicator.color = .white

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
                self.weatherModelView = WeatherViewModel(weather: weatherResult)
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
        self.icon.isHidden = isShown
        self.locationNameLabel.isHidden = isShown
        self.statusLabel.isHidden = isShown
        self.temperatureLabel.isHidden = isShown
    }

    /**
     Setup received data to  Components.
     */
    private func setupData() {
        self.showIndicator(isShown: false)
        self.showComponents(isShown: false)
        self.iconWidth.constant = UIScreen.main.bounds.width * 0.48
        self.locationNameLabel.attributedText = weatherModelView.getLocationName()
        self.icon.sd_setImage(with: weatherModelView.getIconURL(), completed: nil)
        self.statusLabel.attributedText = weatherModelView.getWeatherStatus()
        self.temperatureLabel.attributedText = weatherModelView.getTemperature()

    }
}




//
///// Weather View Controller
//class WeatherViewController: UIViewController {
//
//    /// Weather Model View
//    private(set) var weatherModelView: WeatherViewModel!
//
//    /// Location Name Label
//    @IBOutlet weak var locationNameLabel: UILabel!
//
//    /// Icon
//    @IBOutlet weak var icon: SDAnimatedImageView!
//
//    /// Status Label
//    @IBOutlet weak var statusLabel: UILabel!
//
//    /// Temperature Label
//    @IBOutlet weak var temperatureLabel: UILabel!
//
//    /// Icon Width
//    @IBOutlet weak var iconWidth: NSLayoutConstraint!
//
//    /// Loading Indicator
//    @IBOutlet weak var loadingIndicator: NVActivityIndicatorView!
//
//
//    /// Weather Stack
//    @IBOutlet weak var weatherStack: UIStackView!
//
//    /**
//     View Did Load.
//     */
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.configureIndicator()
//        self.showComponents(isShown: true)
//        self.showIndicator(isShown: true)
//        self.fetchData(key: "f9fb0ed95ba94fc3abf63021221004", location: "Russia", aqi: "no")
//    }
//
//    /**
//     Show indicator.
//     - Parameter isShown: as Bool.
//     */
//    private func showIndicator(isShown: Bool) {
//        if isShown {
//            self.loadingIndicator.startAnimating()
//        } else {
//            self.loadingIndicator.stopAnimating()
//        }
//    }
//
//    /**
//     Setup indicator configuration.
//     */
//    private func configureIndicator() {
//        self.loadingIndicator.type = .lineSpinFadeLoader
//        self.loadingIndicator.color = .white
//    }
//
//    /**
//     Fetch data from API.
//     - Parameter key: as String.
//     - Parameter location: as String.
//     - Parameter aqi: as String.
//     */
//    private func fetchData(key: String, location: String, aqi: String) {
//        WeatherModel.getWeather(key: key, location: location, aqi: aqi) { result in
//            switch result {
//            case .success(let weatherResult):
//                self.weatherModelView = WeatherViewModel(weather: weatherResult)
//                self.setupData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    /**
//     Show Components.
//     - Parameter isShown: as Bool.
//     */
//    private func showComponents(isShown: Bool) {
//        self.weatherStack.isHidden = isShown
//    }
//
//    /**
//     Setup received data to  Components.
//     */
//    private func setupData() {
//        self.showIndicator(isShown: false)
//        self.showComponents(isShown: false)
//        self.iconWidth.constant = UIScreen.main.bounds.width * 0.48
//        self.locationNameLabel.attributedText = weatherModelView.getLocationName()
//        self.icon.sd_setImage(with: weatherModelView.getIconURL(), completed: nil)
//        self.statusLabel.attributedText = weatherModelView.getWeatherStatus()
//        self.temperatureLabel.attributedText = weatherModelView.getTemperature()
//    }
//}
//
//
//
