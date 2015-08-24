//
//  HomeVC.swift
//  fourHourSocietyActual
//
//  Created by MIKE LAND on 8/20/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class HomeVC: UIViewController {
    @IBAction func seeMapButton(sender: AnyObject) {
        performSegueWithIdentifier("goToMapSegue", sender: self)
    }

    @IBAction func userLogsOut(sender: AnyObject) {
        PFUser.logOut()
        performSegueWithIdentifier("loginSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        self.title = "Title HERE"
        checkIfLoggedIn()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkIfLoggedIn() {
        var currentUser = PFUser.currentUser()
        println(currentUser)
        if currentUser != nil {
            // Do stuff with the user
        } else {
            // Show the signup or login screen
            println("login sir")
            performSegueWithIdentifier("loginSegue", sender: self)
        }
    }
}