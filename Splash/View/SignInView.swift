//
//  SignInView.swift
//  Splash
//
//  Created by HAI DANG on 4/5/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

import UIKit

class SignInView: UIViewController {
    
    internal let profileImage: UIImageView = {
        
        let imageView =  UIImageView(image: #imageLiteral(resourceName: "profile"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        return imageView
    }()
    
    internal func layoutProfile() {
        view.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            profileImage.heightAnchor.constraint(equalToConstant: 80),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
            ])
    }
    
    internal let registerView: CustomeUIView = {
        let  view = CustomeUIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    
    }()
    
    internal func layoutRegisterView() {
        view.addSubview(registerView)
        NSLayoutConstraint.activate([
        registerView.heightAnchor.constraint(equalToConstant: 150),
        registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        registerView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10)
            ])
        
        registerView.layer.masksToBounds = false
    }
    
    internal let nameTextField : CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your full name"
        textField.autocorrectionType = .no
        return textField
    }()
    
    internal func layoutNameTextField() {
        
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            
            nameTextField.heightAnchor.constraint(equalTo: registerView.heightAnchor, multiplier: 1/3),
            nameTextField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -10),
            nameTextField.topAnchor.constraint(equalTo: registerView.topAnchor)

            ])
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#FFAB91")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(lineView)
        NSLayoutConstraint.activate([
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -10)
            
            ])
    
    }
    
    internal let emailTextField : CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your email"
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    internal func layoutEmailTextField() {
        
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            
            emailTextField.heightAnchor.constraint(equalTo: registerView.heightAnchor, multiplier: 1/3),
            emailTextField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -10),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5)
            
            ])
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#FFAB91")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        registerView.addSubview(lineView)
        NSLayoutConstraint.activate([
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
            
            ])
    }
    
    internal let passTextField : CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    internal func layoutPassTextField() {
        
        view.addSubview(passTextField)
        NSLayoutConstraint.activate([
            
            passTextField.heightAnchor.constraint(equalToConstant: 40),
            passTextField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 10),
            passTextField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -10),
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5)
            
            ])
    }
    
    internal func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func viewTapped() {
        
        view.endEditing(true)
    }
    
    internal let signInBtn : UIButton = {
       
        let btn = styleBtn(title: "Sign in")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    internal func layoutSignInBtn() {
        
        view.addSubview(signInBtn)
        NSLayoutConstraint.activate([
            
            signInBtn.heightAnchor.constraint(equalToConstant: 50),
            signInBtn.leadingAnchor.constraint(equalTo: registerView.leadingAnchor),
            signInBtn.widthAnchor.constraint(equalTo: registerView.widthAnchor, multiplier: 7/15),
            signInBtn.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 10)
            
            ])
    }
    
    internal let registerBtn : UIButton = {
        let btn = styleBtn(title: "Register")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    internal func layoutRegisterBtn() {
        
        view.addSubview(registerBtn)
        NSLayoutConstraint.activate([
            
            registerBtn.heightAnchor.constraint(equalToConstant: 50),
            registerBtn.widthAnchor.constraint(equalTo: registerView.widthAnchor, multiplier: 7/15),
            registerBtn.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 10),
            registerBtn.trailingAnchor.constraint(equalTo: registerView.trailingAnchor)
            
            ])        
    }
    
    internal func registerBtnTouched() {
        
    }
    
    internal func SignInBtnTouched() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutProfile()
        layoutRegisterView()
        layoutNameTextField()
        layoutEmailTextField()
        layoutPassTextField()
        dismissKeyboard()
        layoutSignInBtn()
        layoutRegisterBtn()
        registerBtnTouched()
        SignInBtnTouched()
    }
    
    //MARK: -Set to lock landscape orientation for this VC
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .landscape
    //
    //    }
    //
    //    override var shouldAutorotate: Bool {
    //        return true
    //    }
    
}
