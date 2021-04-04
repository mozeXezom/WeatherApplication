//
//  ViewController.swift
//  Weather Application
//
//  Created by mozeX on 29.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var currentCityTemp: UILabel!
    
    @IBOutlet weak var currentDate: UILabel!
    
    @IBOutlet weak var specialBackground: UIImageView!
    
    // Constans
    
    
    // Variables
    var currentWeather: CurrentWeather!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        applyEffect()
        currentWeather = CurrentWeather()
        currentWeather.downloadCurrentWeather {
            self.updateUI()
        }
        
    }
    
    func applyEffect() {
        specialEffect(view: specialBackground, intensity: 45)
        specialEffect(view: weatherImage, intensity: -45)
    }
    
    func specialEffect(view: UIView, intensity: Double) {
        let horizontalMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotion.minimumRelativeValue = -intensity
        horizontalMotion.maximumRelativeValue = intensity
        
        let verticalMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotion.minimumRelativeValue = -intensity
        verticalMotion.maximumRelativeValue = intensity
        
        let movement = UIMotionEffectGroup() // Make some motion with group
        movement.motionEffects = [horizontalMotion, verticalMotion]
        
        view.addMotionEffect(movement)
    }
    
    func updateUI() {
        cityName.text = currentWeather.cityName
        currentCityTemp.text = "\(currentWeather.currentTemp)"
        weatherType.text = currentWeather.weatherType
        currentDate.text = currentWeather.date
    }


}

