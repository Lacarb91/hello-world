//
//  gameViewController.swift
//  MatchingGame
//
//  Created by Lana Carbone on 7/1/2023.
//

import UIKit

class gameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var shuffledListofWords = listOfWords.shuffled()
        let newWord = shuffledListofWords.removeFirst()
        
        func newRound() {

            var currentGame: Game!
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
            updateUI()
        }
        
        func updateUI() {
            scoreLabel.text = "Score: \(totalWins - totalLosses)"
            wordLabel.text = newWord


        }
        
        }
    
    @IBAction func unwindToGame(unwindSegue: UIStoryboardSegue) {
        
    }



    let listOfWords = ["sushi", "pizza", "kombucha"]
    
    let incorrectMovesAllowed = 1
   
    var totalWins = 0
    var totalLosses = 0

    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var wordLabel: UILabel!
    
    

    @IBAction func sushiButton(_ sender: UIButton) {
    }
    @IBAction func pizzaButton(_ sender: UIButton) {
    }
    @IBAction func kombuchaButton(_ sender: UIButton) {
    }
}

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

