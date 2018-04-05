//
//  extension splash.swift
//  Splash
//
//  Created by HAI DANG on 4/3/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha:1)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}

func alert(title: String, message: String, viewController: UIViewController) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let cancelAction = UIAlertAction(title: "Back", style: .cancel) { (action) in

        alert.dismiss(animated: true, completion: nil)

    }

    alert.addAction(cancelAction)
    
    viewController.present(alert, animated: true, completion: nil)

    
}

func styleBtn(title: String)->UIButton {
    
    let btn = UIButton()
    btn.setTitle(title, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    btn.backgroundColor = UIColor(hexString: "#2196F3")
    btn.layer.cornerRadius = 10
    btn.layer.shadowColor = UIColor(red: 97.0, green: 97.0, blue: 97.0, alpha: 0.8).cgColor
    btn.layer.shadowOpacity = 0.8;
    btn.layer.shadowRadius = 5.0;
    btn.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    btn.layer.masksToBounds = false
    return btn
}










