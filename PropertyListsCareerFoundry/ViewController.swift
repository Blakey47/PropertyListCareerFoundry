//
//  ViewController.swift
//  PropertyListsCareerFoundry
//
//  Created by Darragh on 11/25/17.
//  Copyright © 2017 Darragh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let plistUrl = Bundle.main.url(forResource: "People", withExtension: "plist")
    let fileManager = FileManager.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
}

