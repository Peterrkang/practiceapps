//
//  ViewController.swift
//  rainyShiny
//
//  Created by Peter Kang on 10/17/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!

    
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tabelView: UITableView!
    
    
    var currentWeather: CurrentWeather!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tabelView.delegate = self
        tabelView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
            
        }
        
    }

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }

    
    func updateMainUI(){
        
        dateLabel.text = currentWeather.date
        locationLabel.text = currentWeather.cityName
        currentTempLabel.text = "\(currentWeather.currentTemp)°F"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

}

