//
//  SignUpVC.swift
//  fourHourSocietyActual
//
//  Created by MIKE LAND on 8/21/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var username: UITextField!
    
    @IBAction func signUpUser(sender: AnyObject) {
        var user = PFUser()
        user.username = username.text
        user.email = userEmail.text
        user.password = userPassword.text
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? String
                self.errorLabel.text = errorString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                self.performSegueWithIdentifier("goHomeFromSignUp", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Title HERE"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}