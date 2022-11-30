//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Lana Carbone on 28/11/2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var button: UIButton!
    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        button.addTarget(self, action: #selector(buttonTapped(_:)),
           for: .touchUpInside)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped!")
       
        if toggle.isOn {
            print("Switch is on.")
        } else {
            print("Switch is off.")
        }
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is on.")
        } else {
            print("Switch is off.")
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
}

