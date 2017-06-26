//
//  popoverVC.swift
//  SlightestMoney
//
//  Created by Scott Curry on 6/14/17.
//  Copyright © 2017 Scott Curry. All rights reserved.
//

import UIKit

class popoverVC: UIViewController {

    @IBOutlet weak var changeValue: UILabel!
    @IBOutlet weak var equateValue: UISwitch!
    @IBOutlet weak var equateBtn: UIButton!
    let red = UIColor(red:0.84, green:0.33, blue:0.32, alpha:1.0)
    let blue = UIColor(red:0.28, green:0.61, blue:0.80, alpha:1.0)
    
    var mainAmt = UserDefaults.standard.value(forKey: "mainAmt") as! String
    var variableAmt = UserDefaults.standard.value(forKey: "variableAmt") as! String
    var growthAmt = UserDefaults.standard.value(forKey: "growthAmt") as! String
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if changeValue.text == "0" {
            changeValue.text =  ""
            changeValue.text = changeValue.text! + String(sender.tag-1)
        } else {
            changeValue.text = changeValue.text! + String(sender.tag-1)
        }
    }
    
    
    @IBAction func equateSwitch(_ sender: UISwitch) {
        
        if equateValue.isOn  {
            UIView.animate(withDuration: 0.25, animations: {
                self.equateBtn.backgroundColor = self.red
                self.equateBtn.setTitle("Subtract", for: .normal)
            })
        } else {
            UIView.animate(withDuration: 0.25, animations: {
                self.equateBtn.backgroundColor = self.blue
                self.equateBtn.setTitle("+ Add", for: .normal)
            })
        }

    }

    
    @IBAction func calculate(_ sender: UIButton) {
        
        if equateValue.isOn {
            let newVar = String(Int(variableAmt)! - Int(changeValue.text!)!)
            let addVar = String(Int(growthAmt)! + Int(changeValue.text!)!)
            UserDefaults.standard.set(newVar, forKey: "variableAmt")
            UserDefaults.standard.set(addVar, forKey: "growthAmt")
            performSegue(withIdentifier: "calculate", sender: self)
        } else {
            let newVar = String(Int(variableAmt)! + Int(changeValue.text!)!)
            let addVar = String(Int(growthAmt)! - Int(changeValue.text!)!)
            UserDefaults.standard.set(newVar, forKey: "variableAmt")
            UserDefaults.standard.set(addVar, forKey: "growthAmt")
            performSegue(withIdentifier: "calculate", sender: self)
        }
        

    }
    
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.equateValue.center.x = self.view.center.x
        
    }


}
