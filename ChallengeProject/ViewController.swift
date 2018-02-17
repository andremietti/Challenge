//
//  ViewController.swift
//  ChallengeProject
//
//  Created by andre mietti on 16/02/18.
//  Copyright © 2018 andre mietti. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import  GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    let fbLoginButton = FBSDKLoginButton()
    let googleLoginButton = GIDSignInButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.current() != nil  {
            //do something
        }
        else {
            setupFacebookButton()
        }
        setupGoogleLoginButton()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    func setupFacebookButton() {
        fbLoginButton.readPermissions = ["public_profile", "email"]
        fbLoginButton.center.y = 70
        fbLoginButton.center.x = view.center.x
        view.addSubview(fbLoginButton)
    }
    
    func setupGoogleLoginButton() {
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signInSilently()

        googleLoginButton.center.y = 120
        googleLoginButton.center.x = view.center.x
        view.addSubview(googleLoginButton)
    }

}
