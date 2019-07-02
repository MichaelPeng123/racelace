//
//  ViewController.swift
//  racelace
//
//  Created by Michael Peng on 6/30/19.
//  Copyright © 2019 Michael Peng. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        if NSString(string:UIDevice.current.systemVersion).doubleValue > 8 {
            locationManager.requestAlwaysAuthorization()
        }
        print("ooooooooooooga")
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        print("managing")
        
    }
    
    //Location managing functions
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var speed: CLLocationSpeed = CLLocationSpeed()
        speed = locationManager.location!.speed
        speedLabel.text = "Speed(m/s): \(speed)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.denied{
            print("hi")
            locationManager.startUpdatingLocation()
        }
    }
    
    //Timer
    
    var timer = Timer()
    
    var firstTwo = 0
    var secTwo = 0
    var thirdTwo = 0
    
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.change), userInfo: nil, repeats: true)
    }
    
    @objc func change() {
        firstTwo += 1
        if (firstTwo >= 100) {
            secTwo += 1
            firstTwo = 0
            if (secTwo >= 60) {
                thirdTwo += 1
                secTwo = 0
            }
        }
        timerLabel.text = "\(thirdTwo) : \(secTwo) : \(firstTwo)"
    }
    
}
