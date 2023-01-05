//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Lana Carbone on 30/12/2022.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.badgeValue = "!"
    }
        
   override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        
            tabBarItem.badgeValue = nil
        }


}

