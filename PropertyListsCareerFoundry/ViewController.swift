//
//  ViewController.swift
//  PropertyListsCareerFoundry
//
//  Created by Darragh on 11/25/17.
//  Copyright © 2017 Darragh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    let plistUrl = Bundle.main.url(forResource: "People", withExtension: "plist")
    let fileManager = FileManager.default
    var plistFormat = PropertyListSerialization.PropertyListFormat.xml
    var people: [Dictionary<String, Any>]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fileExistsInDocumentsDirectory() == false {
            seedDataToDocumentsDirectory()
        }
    }
    
    
    
    // MARK: ACTION BUTTONS
    
    @IBAction func addButtonPressed(_ sender: Any) {
        do {
            let plistData = try Data(contentsOf: documentDirectoryFileURL()!)
            people = try PropertyListSerialization.propertyList(from: plistData, options: [], format: &plistFormat) as? [Dictionary<String, Any>]
            
            if var people = people {
                
                let anotherPerson = ["First Name" : firstNameTextField.text!, "Last Name" : lastNameTextField.text!, "Age" : ageTextField.text!] as [String : Any]
                people.append(anotherPerson)
                
                let serializedData = try PropertyListSerialization.data(fromPropertyList: people, format: PropertyListSerialization.PropertyListFormat.xml, options: 0)
                if let file = documentDirectoryFileURL() {
                    try serializedData.write(to: file)
                    print(file)
                }
            }
            
        } catch {
            print("Error")
        }
    }
    
    @IBAction func showButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showInfo", sender: self)        
    }
    
    
    
    // MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showInfoViewController = segue.destination as! ShowInfoViewController
        showInfoViewController.personInfo = people
    }
    
    
    
    // MARK: FUNCTIONS
    
    func documentDirectoryFileURL() -> URL? {
        do {
            let document = try fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            let file = document.appendingPathComponent("People.plist")
            return file
        } catch {
            print("Error getting file path.")
            return nil
        }
    }
    
    func fileExistsInDocumentsDirectory() -> Bool {
        if let file = documentDirectoryFileURL() {
            let fileExists = FileManager().fileExists(atPath: file.path)
            return fileExists
        }
        return false
    }
    
    func seedDataToDocumentsDirectory() {
        do {
            let plistData = try Data(contentsOf: plistUrl!)
            
            if let file = documentDirectoryFileURL() {
                try plistData.write(to: file)
            }
        } catch {
            print("Error writing file.")
        }
    }
    
}







