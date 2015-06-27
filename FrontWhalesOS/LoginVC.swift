//
//  LoginVC.swift
//  FrontWhalesOS Project
//
//  Created by Reed Carson on 6/17/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var nameField: CoolField!
    
    @IBOutlet weak var passField: CoolField!

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
 

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
                
                self.bottomConstraint.constant = 20 + kbSize.height
    
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func loginAction(sender: FancyButton) {
   
        _sing.username = nameField.text
        _sing.password = passField.text
       
        println("button")
        println(passField.text)
        

        _sing.login { () -> Void in
            
            let homePage = self.storyboard?.instantiateViewControllerWithIdentifier("HP") as! HomePageVC
            self.presentViewController(homePage, animated: true, completion: nil)
            
            println("Is this working?")
        }
        
    }
    
}
