//
//  AmCanViewController.swift
//  American Canyon
//
//  Created by Karla Aldana on 5/11/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class AmCanViewController: UIViewController {
    
    @IBOutlet weak var cityWebButton: UIButton!
    @IBOutlet weak var cityLogoImage: UIImageView!
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var parksRecButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cityWebButtonTapped(_ sender: UIButton) {
        let url = NSURL(string: "https://www.cityofamericancanyon.org/")
        UIApplication.shared.openURL(url! as URL)
    }
    
    @IBAction func contactUsButtonTapped(_ sender: Any) {
        let url = NSURL(string: "https://www.cityofamericancanyon.org/how-do-i/contact/city-staff")
        UIApplication.shared.openURL(url! as URL)
    }
    
    @IBAction func parksRecButtonTapped(_ sender: Any) {
        let url = NSURL(string: "https://www.cityofamericancanyon.org/government/recreation")
        UIApplication.shared.openURL(url! as URL)
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
