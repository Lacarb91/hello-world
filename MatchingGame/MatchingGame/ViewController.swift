//
//  ViewController.swift
//  MatchingGame
//
//  Created by Lana Carbone on 16/12/2022.
//

import UIKit

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        func newRound() {
            var shuffledListofWords = listOfWords.shuffled()
            var currentGame: Game!
            let newWord = shuffledListofWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        }
        
        func updateUI() {
            var     shuffledListofWords = listOfWords.shuffled()
            let newWord = shuffledListofWords.removeFirst()
            scoreLabel.text = "Score: \(totalWins - totalLosses)"


        }
        }


    let listOfWords = ["sushi", "pizza", "kombucha"]
    
    let incorrectMovesAllowed = 1
    
    var totalWins = 0
    var totalLosses = 0
    
    @IBOutlet var LanaFavouriteFoodTitle: UILabel!
    
    @IBAction func playButton(_ sender: Any) {
    }
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var wordLabel: UILabel!

    @IBAction func sushiButton(_ sender: UIImageView) {
    }
    @IBAction func pizzaButton(_ sender: UIImageView) {
    }
    @IBAction func kombuchaButton(_ sender: UIImageView) {
    }
    
    @IBOutlet var gameOverLabel: UILabel!
    @IBOutlet var finalScoreGameOverLabel: UILabel!
    @IBAction func playAgainGameOverButton(_ sender: Any) {
    }
    
    @IBOutlet var youWonLabel: UILabel!
    @IBOutlet var finalScoreYouWonLabel: UILabel!
    
    @IBAction func playAgainYouWonButton(_ sender: Any) {
    }
}
    
    

