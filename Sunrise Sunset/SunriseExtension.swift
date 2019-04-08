//
//  SunriseExtension.swift
//  Sunrise Sunset
//
//  Created by Paul Baker on 4/8/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import Foundation

extension SunTimes {
    
    static let utcDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "hh:mm:ss a" // Same format as in the API response
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df
    }()
    
    static let localDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.calendar = NSCalendar.current
        df.timeZone = TimeZone.current
        df.timeStyle = .medium
        return df
    }()
    
    init(from decoder: Decoder) {
        
        // turn strings to local dates
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let sunriseUTCString = try! container.decode(String.self, forKey: CodingKeys.sunrise)
        let sunsetUTCString = try! container.decode(String.self, forKey: CodingKeys.sunset)
        
        // convert to timestamp, in UTC
        let sunriseUTCDate = SunTimes.utcDateFormatter.date(from: sunsetUTCString)
        let sunsetUTCDate = SunTimes.utcDateFormatter.date(from: sunsetUTCString)
        
        // Convert UTC timestamp to local time for device
        sunrise = SunTimes.localDateFormatter.string(from: sunriseUTCDate!)
        sunset = SunTimes.localDateFormatter.string(from: sunsetUTCDate)
    }
}
