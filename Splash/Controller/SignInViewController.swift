//
//  SignInViewController.swift
//  Splash
//
//  Created by HAI DANG on 4/3/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class SignInViewController: SignInView {
    
    private func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    
    private func isNameValid(name:String) -> Bool {
        
        let nameReEx = "[A-Z0-9a-z ]{6,120}"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", nameReEx)
        
        return predicate.evaluate(with: name)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        
        
    }

    
    override func registerBtnTouched() {
        registerBtn.addTarget(self, action: #selector(handleRegisterBtnTouched), for: .touchUpInside)
    }
    
    @objc func handleRegisterBtnTouched() {
        
        if !isNameValid(name: nameTextField.text ?? "") {
            
            alert(title: "Register Failed", message: "Your full name must be between 6 and 120 characters without any special characters", viewController: self)
            
            return
            
        }
        
        if !isValidEmail(email: emailTextField.text!) {
            
            alert(title: "Email Invalid", message: "Please correct your email !", viewController: self)

        } else {
            
            Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passTextField.text ?? "", completion: { (user, error) in
                
                if let error = error {
                    
                    alert(title: "Register Failed", message: error.localizedDescription, viewController: self)
                    
                    return
                }
                
                guard let userId = user?.uid else {
                    
                    alert(title: "Register Failed", message: "Something went wrong !", viewController: self)
                    
                    return
                }
                
                let ref = Database.database().reference()
                
                let userRef = ref.child("users").child(userId)
                
                userRef.updateChildValues([
                    
                    "Name" : self.nameTextField.text!,
                    
                    "Email" : self.emailTextField.text!
                    
                    
                    ])
                
                alert(title: "Register Successfully", message: "Now you can sign in with your email", viewController: self)
                
            })
        }
        
    }
   
    override func SignInBtnTouched() {
        
        signInBtn.addTarget(self, action: #selector(handleSignInBtnTouched), for: .touchUpInside)

    }
    
    @objc func handleSignInBtnTouched() {
        
        SVProgressHUD.show()
        
        if !isValidEmail(email: emailTextField.text ?? "") {
            
            alert(title: "Sign in Failed", message: "Email is not valid", viewController: self)
            
            SVProgressHUD.dismiss()
            
            return
            
        }
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passTextField.text ?? "") { (user, error) in
            
            if let error = error {
                
                SVProgressHUD.dismiss()
                
                alert(title: "Sign in Failed", message: error.localizedDescription, viewController: self)
                
            } else {
               
                self.navigationController?.popToRootViewController(animated: true)
                
            }
            
        }
        
    }
    
}
