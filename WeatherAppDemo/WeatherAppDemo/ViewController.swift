//
//  ViewController.swift
//  WeatherAppDemo
//
//  Created by Vidyadhar V. Thatte on 11/18/17.
//  Copyright © 2017 VdThatte. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=dbdae2e74aa31222a99c74a1a01923b6", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                DispatchQueue.main.async {
                    let tempInKelvin = json["main"]["temp"] as AnyObject
                    //let tempInCelcius = Float(tempInKelvin as! NSNumber) - 273.0
                    //let tempInFarenheit = ((9/5)*tempInCelcius) + 32
                    self.temperatureLabel.text = String(describing: tempInKelvin)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }

}

