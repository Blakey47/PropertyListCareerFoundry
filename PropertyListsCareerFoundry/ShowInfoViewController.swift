//
//  ShowInfoViewController.swift
//  PropertyListsCareerFoundry
//
//  Created by Darragh on 11/25/17.
//  Copyright © 2017 Darragh. All rights reserved.
//

import UIKit

class ShowInfoViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    var personInfo: [Dictionary<String, Any>]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showInfo()
    }
    
    func showInfo() {
        if let personInfo = personInfo {
            for person in personInfo {
                print("First Name: \(String(describing: person["First Name"])), Last Name: \(String(describing: person["Last Name"])), Age: \(String(describing: person["Age"]))")
            }
        }
    }
    
}
