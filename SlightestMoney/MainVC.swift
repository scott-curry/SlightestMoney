//
//  MainVC.swift
//  SlightestMoney
//
//  Created by Scott Curry on 6/14/17.
//  Copyright © 2017 Scott Curry. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var number:Double = 0;
    @IBOutlet weak var mainValue: UILabel!
    @IBOutlet weak var ofLabel: UILabel!
    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var resetcloseBtn: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var closeMenuBtn: UIButton!
    @IBOutlet weak var homeLink: UIButton!
    @IBOutlet weak var settingsLink: UIButton!
    @IBOutlet weak var aboutLink: UIButton!
    @IBOutlet weak var dismissLink: UIButton!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuIcon: UIButton!
    
    @IBOutlet weak var updateBtn: roundButton!
    @IBOutlet weak var resetButton: roundButton!
    
    @IBOutlet weak var growthValue: UILabel!
    
    
    
    var mainAmt = UserDefaults.standard.value(forKey: "mainAmt")
    var variableAmt = UserDefaults.standard.value(forKey: "variableAmt")
    var growthAmt = UserDefaults.standard.value(forKey: "growthAmt")

    
    
    @IBAction func resetAmt(_ sender: UIButton) {
        self.optionsDisappear()
        self.mainValue.text = self.mainAmt as? String
        self.growthValue.text = "0"
        UserDefaults.standard.set(self.mainValue.text, forKey: "variableAmt")
    }
    
    @IBAction func resetTouch(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.resetBtn.alpha = 0
            self.menuIcon.alpha = 0
            self.resetcloseBtn.alpha = 1
            self.resetcloseBtn.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi)
        }
        self.optionsAppear()
        
    }
    
    @IBAction func closeTouch(_ sender: UIButton) {
        self.optionsDisappear()
        UIView.animate(withDuration: 0.5){
            self.menuIcon.alpha = 1
        }
    }
    
    
    
    @IBAction func openMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) { 
            self.mainView.frame.origin.x = (self.view.window?.frame.width)! * 0.75
            self.mainView.alpha = 0.5
            self.menuAppear()
        }
        
    }
    
    func optionsAppear(){
        UIView.animate(withDuration: 0.25) {
            self.updateBtn.alpha = 1
        }
        UIView.animate(withDuration: 0.25, delay: 0.25, animations: {
            self.resetButton.alpha = 1
        })
    }
    
    func optionsDisappear(){
        UIView.animate(withDuration: 0.5) {
            self.resetcloseBtn.alpha = 0
            self.resetcloseBtn.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            self.resetBtn.alpha = 1
        }
        
        UIView.animate(withDuration: 0.25) {
            self.resetButton.alpha = 0
        }
        UIView.animate(withDuration: 0.25, delay: 0.25, animations: {
            self.updateBtn.alpha = 0
        })
    }
    
    func menuAppear(){
        
        
        UIView.animate(withDuration: 1, delay: 0.25, animations: {
            self.homeLink.alpha = 1
            self.settingsLink.alpha = 1
            self.aboutLink.alpha = 1
            self.closeMenuBtn.alpha = 1
            self.menuTitle.alpha = 1
        })
        
    }
    
    
    func menuDisappear(){
        UIView.animate(withDuration: 0.25) {
            self.homeLink.alpha = 0
            self.settingsLink.alpha = 0
            self.aboutLink.alpha = 0
            self.closeMenuBtn.alpha = 0
            self.menuTitle.alpha = 0
        }
    }
    
    
    func menuClose(){
        UIView.animate(withDuration: 0.5) {
            self.menuDisappear()
            self.mainView.frame.origin.x = 0
            self.mainView.alpha = 1
        }
        
    }
    
    
    func switchSpent() {
            UIView.animate(withDuration: 0.25, animations: {
                self.positionTwo()
            })
        print("switchSpent")
    }
    
    
    func switchRemain() {
            UIView.animate(withDuration: 0.25, animations: {
                self.positionOne()
            })
            print("switchRemain")
    }
    
    func positionOne() {
        self.mainValue.alpha = 1
        self.mainValue.frame.origin.y = self.mainValue.frame.origin.y + 100
        self.growthValue.alpha = 0
        self.growthValue.frame.origin.y = self.growthValue.frame.origin.y + 100
    }
    
    func positionTwo() {
        self.mainValue.alpha = 0
        self.mainValue.frame.origin.y = self.mainValue.frame.origin.y - 100
        self.growthValue.alpha = 1
        self.growthValue.frame.origin.y = self.growthValue.frame.origin.y - 100
    }
    
    
    @IBAction func closeMenu(_ sender: UIButton) {
        self.menuClose()
    }
    
    @IBAction func homeLink(_ sender: UIButton) {
        self.menuClose()
    }
    
    @IBAction func dismissMenu(_ sender: UIButton) {
        self.menuClose()
    }
    
    @IBAction func switchAmts(_ sender: UIButton) {
        if UserDefaults.standard.bool(forKey: "direction") == false {
            self.switchRemain()
            UserDefaults.standard.set(true, forKey: "direction")
        } else if UserDefaults.standard.bool(forKey: "direction") == true {
            self.switchSpent()
            UserDefaults.standard.set(false, forKey: "direction")
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resetcloseBtn.alpha = 0
        self.homeLink.alpha = 0
        self.settingsLink.alpha = 0
        self.aboutLink.alpha = 0
        self.closeMenuBtn.alpha = 0
        self.menuTitle.alpha = 0
        self.updateBtn.alpha = 0
        self.resetButton.alpha = 0
        
        if UserDefaults.standard.bool(forKey: "direction") == false {
            // self.positionTwo()
            self.mainValue.frame.origin.y = self.growthValue.frame.origin.y - 100
            self.mainValue.alpha = 0
            UserDefaults.standard.set(false, forKey: "direction")
            print("false")
        } else if UserDefaults.standard.bool(forKey: "direction") == true {
            self.positionOne()
            self.mainValue.frame.origin.y = self.mainValue.frame.origin.y - 100
            UserDefaults.standard.set(true, forKey: "direction")
            print("true")
        }
        
        print(String(UserDefaults.standard.bool(forKey: "direction")))
        
        if let name = variableAmt {
        mainValue.text = name as? String
        // number = Double(mainValue.text!)!
        }
        
        if let origin = mainAmt {
            originalLabel.text = originalLabel.text! + (origin as? String)!
        }
        
        if ((mainAmt as? String)==(variableAmt as? String)) {
            originalLabel.alpha = 0
            ofLabel.alpha = 0
        } else {
            originalLabel.alpha = 1
            ofLabel.alpha = 1
        }
        
        self.growthValue.text = growthAmt as? String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
