//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let eggPrepareTimes = [
        "Soft": 5.0,
        "Medium": 8.0,
        "Hard": 12.0
    ]
    
    @IBAction func eggImageTouched(_ sender: UIButton) {
        setTimer(time: eggPrepareTimes[sender.currentTitle!]!)
    }
    
    func setTimer(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            print("Eggs ready!")
        }
    }

}
