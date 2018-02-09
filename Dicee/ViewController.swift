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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
    }
    
    func updateDiceImages(){
        randomDiceIndex1 = Int(arc4random_uniform(4))
        randomDiceIndex2 = Int(arc4random_uniform(4))
        
        diceImageView1.image = diceArray[randomDiceIndex1]
        diceImageView2.image = diceArray[randomDiceIndex2]
        
    }

    
}

