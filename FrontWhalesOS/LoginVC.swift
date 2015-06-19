//
//  LoginVC.swift
//  FrontWhalesOS Project
//
//  Created by Reed Carson on 6/17/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    
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
    


    
    

}
