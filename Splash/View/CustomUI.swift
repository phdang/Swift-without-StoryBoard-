//
//  CustomTextField.swift
//  Splash
//
//  Created by HAI DANG on 4/6/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit
class CustomeUIView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 97.0, green: 97.0, blue: 97.0, alpha: 0.8).cgColor
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
    }
    
}

@IBDesignable
class CustomTextField: UITextField {
    
    
    // MARK: - IBInspectable
    @IBInspectable var tintCol: UIColor = UIColor(hexString: "#707070")
    @IBInspectable var fontCol: UIColor = UIColor(hexString: "#707070")
    @IBInspectable var shadowCol: UIColor = UIColor(hexString: "#707070")
    
    
    // MARK: - Properties
    var textFont = UIFont(name: "Helvetica Neue", size: 16.0)
    
    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = false
//        self.backgroundColor = UIColor(red: 230, green: 230, blue: 230)
        self.layer.cornerRadius = 3.0
        self.tintColor = tintCol
        self.textColor = fontCol
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 255, green: 255, blue: 255).cgColor
        
        if let phText = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: phText, attributes: [NSAttributedStringKey.foregroundColor: UIColor(hexString: "#B3B3B3")])
        }
        
        if let fnt = textFont {
            self.font = fnt
        } else {
            self.font = UIFont(name: "Helvetica Neue", size: 16.0)
        }
    }
    
    // Placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // Editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
}
