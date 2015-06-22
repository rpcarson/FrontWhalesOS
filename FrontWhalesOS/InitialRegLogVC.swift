//
//  InitialRegLogVC.swift
//  FrontWhalesOS Project
//
//  Created by Reed Carson on 6/17/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class InitialRegLogVC: UIViewController {

   
//    @IBAction func openRegister(sender: UIButton) {
//    }
//    
//    @IBAction func openLogin(sender: UIButton) {
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("This is my token: \(RailsRequest.session().token)")
        
        if RailsRequest.session().token != nil {
            
            println(RailsRequest.session().token!)
            
            let homePage = self.storyboard?.instantiateViewControllerWithIdentifier("HP") as! HomePageVC
            
            self.navigationController?.pushViewController(homePage, animated: true)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
