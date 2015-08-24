//
//  resetPasswordVC.swift
//  fourHourSocietyActual
//
//  Created by MIKE LAND on 8/23/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class ResetPasswordVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBAction func resetPasswordButton(sender: AnyObject) {
        var userEmail = emailField.text
        PFUser.requestPasswordResetForEmailInBackground(userEmail)
        self.performSegueWithIdentifier("goToSignInFromReset", sender: self)
        
        var alert = UIAlertController(title: "Password Reset Email Sent", message: "We have sent an email to: \(self.emailField.text). Please check your inbox", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
