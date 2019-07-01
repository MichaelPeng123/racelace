//
//  ViewController.swift
//  racelace
//
//  Created by Michael Peng on 6/30/19.
//  Copyright © 2019 Michael Peng. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
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
