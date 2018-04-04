//
//  SignInViewController.swift
//  Splash
//
//  Created by HAI DANG on 4/3/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit

class SignInViewController: SignInView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    override func registerBtnTouched() {
        registerBtn.addTarget(self, action: #selector(handleRegisterBtnTouched), for: .touchUpInside)
    }
    
    @objc func handleRegisterBtnTouched() {
        print("Register Button touched !")
    }
   
    override func SignInBtnTouched() {
        
        signInBtn.addTarget(self, action: #selector(handleSignInBtnTouched), for: .touchUpInside)

    }
    
    @objc func handleSignInBtnTouched() {
        print("Sign in Button touched !")
    }
    
}
