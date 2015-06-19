//
//  RegisterVC.swift
//  FrontWhalesOS Project
//
//  Created by Reed Carson on 6/17/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var usernameField: CoolField!
    
    @IBOutlet weak var emailField: CoolField!
    
    @IBOutlet weak var passwordField: CoolField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
                
                self.bottomConstraint.constant = 20 + kbSize.height
                
                
            }
            
        }
    }
    
    
    @IBAction func registerAction(sender: FancyButton) {
   
           _sing.username = self.usernameField.text
           _sing.email = self.emailField.text
          _sing.password = self.passwordField.text
        
        
        RailsRequest.session().registerWithCompletion { () -> Void in
            
        }
            
        if _sing.username != nil && _sing.email != nil && _sing.password != nil {
            
//            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard!.instantiateViewControllerWithIdentifier("Login") as! UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
            
        }

       
        
        }
        

    }
    
    

    

