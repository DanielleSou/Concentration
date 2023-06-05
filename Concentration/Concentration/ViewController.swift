//
//  ViewController.swift
//  Concentration
//
//  Created by Danielle Sousa on 4/14/23.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    var flipCout = 0 {
        didSet
        {
            flipCoutLabel.text = "Flips: \(flipCout)"
        }
    }
    @IBOutlet weak var flipCoutLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCout += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("chosen card was not in cardsButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
                
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
                
            }
        }
    }
    
    var emojiChoices = ["🤖","👻","🤢","👽","👾","🎃","💀", "👺","☠️","🤮","🤡"]
    var emoji = [Int: String]()
    
    func emoji ( for card: Card) -> String {
        if emoji[card.identifier] == nil,
           emojiChoices.count > 0 {
            let randomIndex = Int( arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier]=emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}
