//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Lana Carbone on 31/12/2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiLabel5: UILabel!
    @IBOutlet weak var multiLabel6: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var multiSwitch5: UISwitch!
    @IBOutlet weak var multiSwitch6: UISwitch!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questions: [Question] = [
        Question(text: "Pick a colour:", type: .single, answers: [Answer(text: "Red", type: .meat),Answer(text: "Green", type: .salad),Answer(text: "Blue", type: .prawn),Answer(text: "Yellow", type: .dessert)]),
                 Question(text: "Where would you rather be?", type: .single, answers: [Answer(text: "Inside, cozy and rugged up.", type: .meat),Answer(text: "Outside, exploring and walking in nature.", type: .salad),Answer(text: "Swimming and laying around by the beach.", type: .prawn),Answer(text: "Out with friends, checking out a fun event.", type: .dessert)]),
        Question(text: "What do you like to do in your spare time?", type: .multiple, answers: [Answer(text: "Keeping active - exercising and working out.", type: .meat),Answer(text: "Being with and looking after animals.", type: .salad),Answer(text: "Reading.", type: .salad),Answer(text: "Hanging out with friends.", type: .dessert),Answer(text: "Playing games.", type: .dessert),Answer(text: "Watching TV shows and movies.", type: .dessert),Answer(text: "Having alone time to myself.", type: .meat),Answer(text: "Travel and explore new places", type: .prawn)]),
        Question(text: "How likely are you to press snooze on your alarm?:", type: .ranged, answers: [Answer(text: "Unlikely.", type: .meat),Answer(text: "A little bit.", type: .prawn),Answer(text: "Could go either way.", type: .salad),Answer(text: "Likely.", type: .dessert)]),
        Question(text: "What temperature do you like?", type: .ranged, answers: [Answer(text: "Hot.", type: .meat),Answer(text: "Warm.", type: .prawn),Answer(text: "Cold.", type: .salad),Answer(text: "Icy.", type: .dessert)])
                ]
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
        
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        if multiSwitch5.isOn {
            answersChosen.append(currentAnswers[4])
        }
        if multiSwitch6.isOn {
            answersChosen.append(currentAnswers[5])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
            switch currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswers)
            case .multiple:
                updateMultipleStack(using: currentAnswers)
            case .ranged:
                updateRangedStack(using: currentAnswers)
            }
    }
    
    @IBSegueAction func showResluts(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder)
    }
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiSwitch5.isOn = false
        multiSwitch6.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        multiLabel5.text = answers[4].text
        multiLabel6.text = answers[5].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
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

