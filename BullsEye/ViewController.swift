//
//  ViewController.swift
//  BullsEye
//
//  Created by Dyan Galih on 06/02/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showInfo(_ sender: UIButton) {
        let alert = UIAlertController(title: "Information", message: "Bull's Eye Game. Just move the slide bar right and left to get nearest point score. As long as slide position nearest to the point score, your score will higher and get perfect point each game", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showAllert(){
        let difference = abs(targetValue - currentValue)
        let point = 100 - difference
        
        score += point
        
        let message = "Your scored \(point) points"
        
        let alert = UIAlertController(title: "Score", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        displayData()
    }
    
    @IBAction func sliderMove(_ slider: UISlider){
        currentValue = Int(slider.value.rounded())
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        startOver()
    }
    
    func startOver(){
        round = 1
        score = 0
        displayData()
    }
    
    func displayData(){
        currentValue = Int(slider.value.rounded())
        startNewRound()
        updateScore()
        updateRound()
    }
    
    func updateScore(){
        scoreLabel.text = String(score)
    }
    
    func updateRound(){
        roundLabel.text = String(round)
    }
    
    func updateLabels(randomValue: String) {
        targetLabel.text = randomValue
    }

    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels(randomValue: String(targetValue))
    }
}

