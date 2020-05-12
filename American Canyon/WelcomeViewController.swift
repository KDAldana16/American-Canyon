//
//  WelcomeViewController.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/12/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var text: String = ""
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField?.text = text
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "visit" {
            let destinationController = segue.destination as! AmCanViewController
            destinationController.welcomeLabelText = textField.text!
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
