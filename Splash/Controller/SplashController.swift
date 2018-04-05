//
//  ViewController.swift
//  Splash
//
//  Created by HAI DANG on 4/3/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit
import Firebase

class SplashController: SplashView {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleSignout))
        
        if Auth.auth().currentUser?.uid == nil {
            
            handleSignout()
                        
        }
        
    }
    
    @objc func handleSignout() {
        
        do {
            
            try Auth.auth().signOut()
            
        } catch {
            
            alert(title: "Error occured please try again", message: error.localizedDescription, viewController: self)
            
            return
        }
        
        let signInVc = SignInViewController()
        
        signInVc.view.backgroundColor = UIColor(hexString: "#FF80AB")
        
        navigationController?.pushViewController(signInVc, animated: true)
    }
    
}

