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
        
        var plistFormat = PropertyListSerialization.PropertyListFormat.xml
        
        do {
            let plistData = try Data(contentsOf: plistUrl!)
            let people = try PropertyListSerialization.propertyList(from: plistData, options: [], format: &plistFormat) as! [Dictionary<String, Any>]
            
            for person in people {
                print("First Name: \(String(describing: person["First Name"])), Last Name: \(String(describing: person["Last Name"])), Age: \(String(describing: person["Age"]))")
            }
            if let fName = people[0]["First Name"] {
                print("First Name for first person: \(fName)")
            }
        } catch {
            print("Error")
        }
        
    }
    
    @IBAction func showButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
}

