//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Lana Carbone on 30/12/2022.
//

import UIKit

class MiddleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "ViewDidLoad")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "ViewDidDisappear")
    }
    
    @IBOutlet var lifeCycleLabel: UILabel!
    
    var eventNumber = 1
    
    func addEvent(from: String) {
        if let existingText = lifeCycleLabel.text {
            lifeCycleLabel.text = "\(existingText)\nEvent number \(eventNumber) was \(from)"
            eventNumber += 1
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

}
