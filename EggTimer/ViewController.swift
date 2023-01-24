//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var doneLabelView: UILabel!

    let eggPrepareTimes = [
        "Soft": 5.0,
        "Medium": 8.0,
        "Hard": 12.0
    ]
    
    @IBAction func eggImageTouched(_ sender: UIButton) {
        self.progressBarView.isHidden = false
        self.doneLabelView.isHidden = true
        self.progressBarView.progress = 0.0
        setTimer(time: eggPrepareTimes[sender.currentTitle!]!)
    }
    
    func setTimer(time: Double) {
        var currentPercent: Float = 0.0
        let t = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentPercent = currentPercent + 1 / Float(time)
            self.progressBarView.progress = currentPercent
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            t.invalidate()
            self.doneLabelView.isHidden = false
            self.progressBarView.isHidden = true
        }
    }

}
