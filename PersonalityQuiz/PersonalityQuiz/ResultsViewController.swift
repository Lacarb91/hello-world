//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Lana Carbone on 31/12/2022.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var responses: [Answer]
        calculatePersonalityResult()
        
        func calculatePersonalityResult() {
            let frequencyOfAnswers = responses.reduce(into: [FoodType: Int]()){
                (counts, answer) in
                if let existingCount = counts[answer.type] {
                    counts[answer.type] = existingCount + 1
                } else {
                    counts[answer.type] = 1
                }
            }
            let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
                                                                    { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
            })
            
            let mostCommonAnswer = frequentAnswersSorted.first!.key
        }
    }
}
