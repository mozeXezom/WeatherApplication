//
//  CurrentWeather.swift
//  Weather Application
//
//  Created by mozeX on 01.04.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

    func downloadCurrentWeather(completed: @escaping DownloadComplete){
               AF.request(API_URL).responseData { (response) in
                let jsonObject = JSON(response.data!)
                self._cityName = jsonObject["name"].stringValue
                self._weatherType = jsonObject["weather"][0]["main"].stringValue
                
                let tempDate=jsonObject["dt"].double
                let convertedUnixDate = Date(timeIntervalSince1970: tempDate!)
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
                let currentDate = dateFormatter.string(from: convertedUnixDate)
                self._date = currentDate
                
                let downloadedTemp = jsonObject["main"]["temp"].double
                let tmp = downloadedTemp! - 273.15
                self._currentTemp = Double(Int(round(tmp)))
                
                print(self._cityName!)
                print(self._date!)
                print(self._currentTemp!)
                print(self._weatherType!)
                completed()
                
               }
            }
     }
    
//    func downloadCurrentWeather(completed: @escaping DownloadComplete) {
//        AF.request(API_URL).responseJSON { (response) in
//            //print(response)
//            let result = response.result
//            //print(result.self)
//            let json = JSON(response.result)
//            self._cityName = json["name"].stringValue
//            let tempDate = json["dt"].double
//            self._weatherType = json["weather"][0]["main"].stringValue
//            let downloadedTemp = json["main"]["temp"].double
//            print(downloadedTemp)
//
//        }
//        completed()
//
//    }
//}
//

        
