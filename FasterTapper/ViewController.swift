//
//  ViewController.swift
//  FasterTapper
//
//  Created by Melissa on 9/21/15.
//  Copyright © 2015 Melissa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
   
    
    var timer = NSTimer()
    var count = 0
    var seconds = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    
    func setupGame() {
        seconds = 60
        count = 0
        
        countdownLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        seconds--
        countdownLabel.text = "Time: \(seconds)"
        
        if(seconds == 0) {
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!",
                message: "You scored \(count) points",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Play Again",
                style :UIAlertActionStyle.Default,
                handler: { action in self.setupGame()
            }))
            presentViewController(alert, animated: true, completion:nil)
        }
    }
    
    @IBAction func buttonPressed() {
        count++
        scoreLabel.text = "Score: \(count)"
    }


}

