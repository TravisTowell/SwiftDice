//
//  ViewController.swift
//  D20
//
//  Created by Travis Towell on 1/21/20.
//  Copyright © 2020 Travis Towell. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var criticalLabel: UILabel!
    
    var rollySounds: AVAudioPlayer?
    var failSounds: AVAudioPlayer?
    var winnySounds: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // its frigging gamer time
        let path = Bundle.main.path(forResource: "rolldice.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            rollySounds = try AVAudioPlayer(contentsOf: url)
        }
        catch {
            //we are monkey
        }
    }

    func rollDice() {
        
        let rolledNumber = Int.random(in:1...20)
        
        let imageName = "d\(rolledNumber)"
        

        rollySounds?.play()
        
        diceImageView.image = UIImage(named: imageName)
        
        if ( imageName == "d1"){
            criticalLabel.text = "You're BAD!"
            criticalLabel.isHidden = false
        }
        
        else if( imageName == "d20")
        {
            criticalLabel.text = " You're not bad!"
            criticalLabel.isHidden = false
        }
        
        else{
            criticalLabel.isHidden = true
        }
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event:
        UIEvent?){
        rollDice()
    }
    @IBAction func rollDiceFromButton() {
        rollDice()
    }
    
}

