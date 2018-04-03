//
//  SplashViewController.swift
//  Splash
//
//  Created by HAI DANG on 4/3/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit

class SplashView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 70, green: 130, blue: 180)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleSignout))

    }
    
    @objc func handleSignout() {
        //action handleSignout here
        //print("Signout handler")
        present(SignInViewController(), animated: true, completion: nil)
        
    }

  

   

}
