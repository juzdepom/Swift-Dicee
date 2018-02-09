//
//  ViewController.swift
//  Dicee
//
//  Created by Julia Gao Miller on 2/9/18.
//  Copyright © 2018 Julia Gao Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0;
    var randomDiceIndex2: Int = 0;
    
    let diceArray = [#imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    var orange = UIColor(red:0.89, green:0.40, blue:0.40, alpha:1.0)
    var darkOrange = UIColor(red:0.70, green:0.40, blue:0.40, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        roll()
    }
    
    func updateDiceImages(){
        self.randomDiceIndex1 = Int(arc4random_uniform(4))
        self.randomDiceIndex2 = Int(arc4random_uniform(4))
        
        self.diceImageView1.image = self.diceArray[self.randomDiceIndex1]
        self.diceImageView2.image = self.diceArray[self.randomDiceIndex2]
    }
    
    func roll(){
        rollButton.isEnabled = false
        rollButton.backgroundColor = darkOrange
        rollButton.setTitleColor(UIColor.brown, for: .normal)
        let i = Double(0.3);
        self.updateDiceImages()
        delay(i){
            self.updateDiceImages()
            self.delay(i){
                self.updateDiceImages()
                self.delay(i){
                    self.updateDiceImages()
                    self.rollButton.isEnabled = true;
                    self.rollButton.backgroundColor = self.orange
                    self.rollButton.setTitleColor(UIColor.white, for: .normal)
                }
            }
        }
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

//    detect if iphone has been shaken
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        roll()
    }

    
}

