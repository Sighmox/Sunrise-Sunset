//
//  SunTimesService.swift
//  Sunrise Sunset
//
//  Created by Paul Baker on 4/8/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import Foundation
import CoreLocation


class SunTimesService {
    
    //var locationManager:CLLocationManagerDelegate!
    
    
    func fetchSunTimes() {
    
    
    let url_str = "https://api.sunrise-sunset.org/json?lat=45&lng=-93"
    let url = URL(string: url_str)
    
    let session = URLSession.shared
    let task = session.dataTask(with: url!) { data, response, error in
        
        if let sunTimesData = data {
            let decoder = JSONDecoder()
            let results = try! decoder.decode(Results.self, from: sunTimesData)
            print(results)
        }
    }
    task.resume()
}

}


