//
//  roundButton.swift
//  SlightestMoney
//
//  Created by Scott Curry on 6/14/17.
//  Copyright © 2017 Scott Curry. All rights reserved.
//

import UIKit

@IBDesignable class roundButton: UIButton {

    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }


}
