//
//  ViewController.swift
//  Splash
//
//  Created by HAI DANG on 4/3/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit

class SplashController: SplashView {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleSignout))
        
    }
    
    @objc func handleSignout() {
        //action handleSignout here
        let signInVc = SignInViewController()
        signInVc.view.backgroundColor = UIColor(hexString: "#FF80AB")
        navigationController?.pushViewController(signInVc, animated: true)
    }
    

}

