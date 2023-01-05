//
//  ViewController.swift
//  Login
//
//  Created by Lana Carbone on 17/12/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        } else { segue.destination.navigationItem.title = username.text
        }
    }
    @IBOutlet var username: UITextField!
    
 
    @IBOutlet var forgotUsername: UIButton!
    
    @IBOutlet var forgotPassword: UIButton!
    
    
    @IBAction func forgotUsernameButton(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsername", sender: sender)
    }
    @IBAction func forgotPasswordButton(_ sender: Any) {
        performSegue(withIdentifier: "forgotPassword", sender: sender)
    }
}

