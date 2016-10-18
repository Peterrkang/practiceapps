//
//  Constants.swift
//  rainyShiny
//
//  Created by Peter Kang on 10/17/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat=35"
let LONGITUDE = "&lon=139"
let APP_ID = "&appid="
let API_KEY = "8464ca69182f3f4109aa6cc83a34de7e"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY)"


typealias DownloadComplete = () -> ()
