//
//  EntranceVC.swift
//  SlightestMoney
//
//  Created by Scott Curry on 6/14/17.
//  Copyright © 2017 Scott Curry. All rights reserved.
//

import UIKit

class EntranceVC: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var startValue: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelBtn: roundButton!
    @IBAction func numbers(_ sender: UIButton) {
        
        if startValue.text == "0" {
        startValue.text =  ""
        startValue.text = startValue.text! + String(sender.tag-1)
        } else {
        startValue.text = startValue.text! + String(sender.tag-1)
        }
        
        
    }
    
    @IBAction func getStarted(_ sender: UIButton) {
        
        if startValue.text != "" {
            UserDefaults.standard.set(startValue.text, forKey: "mainAmt")
            UserDefaults.standard.set(startValue.text, forKey: "variableAmt")
            UserDefaults.standard.set("0", forKey: "growthAmt")
            performSegue(withIdentifier: "beginSegue", sender: self)
        }

        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if startValue.text != "" {
            
        }
        
        
        
    }
    


}
