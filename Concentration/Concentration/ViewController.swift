//
//  ViewController.swift
//  Concentration
//
//  Created by Danielle Sousa on 4/14/23.
//

import UIKit

class ViewController: UIViewController
{
    var flipCout = 0 {
        didSet{
            flipCoutLabel.text = "Flips: \(flipCout)"
        }
    }
    @IBOutlet weak var flipCoutLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    var emojiChoses: Array<String> = ["👽","👻","🎃","👽","👻","🎃"]
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCout += 1
        if let cardNumber = cardButtons.index(of: sender){
            print ("CardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoses[cardNumber], on: sender )
        }else {
           print ("chosen card was not in cardsButtons")
        }
       
        flipCoutLabel.text = "Flips: \(flipCout)"
        //flipCard(withEmoji: "", on: sender )
        
    }
    
    @IBAction func touchSecondcard(_ sender:UIButton)
   {
       flipCout += 1
            flipCoutLabel.text = " Flips: \(flipCout) "
            flipCard(withEmoji: "", on: sender )
    }
    
    func flipCard(withEmoji emoji: String , on button : UIButton)
    {
        if  button.currentTitle==emoji
        {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
            
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
    
    
}

