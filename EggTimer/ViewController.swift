//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var doneLabelView: UILabel!

    let eggPrepareTimes: [String: Float] = [
        "Soft"   : 5.0  * 60,
        "Medium" : 8.0  * 60,
        "Hard"   : 12.0 * 60
    ]

    var timer = Timer()
    let player = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!)


    var remainingTime : Float = 0
    var maxTime       : Float = 0
    
    @IBAction func eggImageTouched(_ sender: UIButton) {
        self.progressBarView.isHidden = false
        self.doneLabelView.isHidden = true
        self.progressBarView.progress = 0.0
        self.timer.invalidate()
        self.remainingTime = eggPrepareTimes[sender.currentTitle!]!
        self.maxTime = self.remainingTime

        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.remainingTime > 0 {
                self.remainingTime -= 1
                self.progressBarView.progress = (self.maxTime - self.remainingTime) / self.maxTime
            } else {
                self.timer.invalidate()
                self.doneLabelView.isHidden = false
                self.progressBarView.isHidden = true
                self.player.play()
            }
        }
    }
}
