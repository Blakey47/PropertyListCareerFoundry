//
//  ShowInfoViewController.swift
//  PropertyListsCareerFoundry
//
//  Created by Darragh on 11/25/17.
//  Copyright © 2017 Darragh. All rights reserved.
//

import UIKit

class ShowInfoViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var personInfo: [Dictionary<String, Any>]?
    var infoForTextView = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showInfo()
    }
    
    func showInfo() {
        if let personInfo = personInfo {
            for i in 0...personInfo.count - 1 {
                infoForTextView += "\(personInfo[i]["First Name"]!) \(personInfo[i]["Last Name"]!), Age: \(personInfo[i]["Age"]!)\n"
            }
            textView.text = infoForTextView
        }
    }
    
}
