//
//  RailsRequest.swift
//  FrontWhalesOS
//
//  Created by Reed Carson on 6/18/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

private let defaults = NSUserDefaults.standardUserDefaults()
private let _singleton = RailsRequest()

var _sing = RailsRequest.session()

class RailsRequest: NSObject {
    
    
    // singleton class
    
    class func session() -> RailsRequest { return _singleton }
    
    let API_URL = "https://morning-sands-1943.herokuapp.com"
    
    // add ID property?
    
    
    var token: String? {
        
        get {
            
            return defaults.objectForKey("TOKEN") as? String
            
        } set {
            
            defaults.setValue(newValue, forKey: "TOKEN")
            defaults.synchronize() //-> makes token persistent
            
        }
        
    }
    
    var username: String?
    var email: String?
    var password: String?
    
    func registerWithCompletion(completion: () -> Void) {
        
        var info = [
            "method" : "POST",
            "endpoint" : "/users/register",
            "parameters" : [
                
                "username" : username!,
                "email" : email!,
                "password" :  password!
                
                
                //            Optional Params (not yet implemented):
                
                //            first name
                //            last name
                
            ]
            
            ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            if let accessToken = responseInfo?["access_token"] as? String {
                
                self.token = accessToken
                
                completion()
            }
            
        })
        
    }
    func login(username: String, password: String) {
     
        var info = [
            "method" : "POST",
            "endpoint" : "login",
            "parameters" : [
                
                "username" : username,
                "password" : password
            ]
            
            ] as [String:AnyObject]
        
        
        
    }
    
    var imageLink: UIImage?
    var providedAnswer: String?
    
    
    func postImage(imageURL: String, answer: String) {
        
        var info = [
            "method" : "POST",
            "endpoint" : "posts?",
            "parameters" : [
                
                "imageURL" : imageLink!,
                "answer" : providedAnswer!
        ]
        
        ] as [String:AnyObject]
        
        requestWithInfo(info, andCompletion: { (responseInfo) -> Void in
            
            println(responseInfo)
            
        })
        
    }
    
    func requestWithInfo(info: [String:AnyObject], andCompletion completion: ((responseInfo: [String:AnyObject]?) -> Void)?) {
        
        let endpoint = info["endpoint"] as! String
        
        if let url = NSURL(string: API_URL + endpoint) {
            
            let request = NSMutableURLRequest(URL: url)
            
            request.HTTPMethod = info["method"] as! String
            
            if let token = token {
               
                request.setValue(token, forHTTPHeaderField: "Authorization")
                
            }
            
            let bodyInfo = info["parameters"] as! [String:AnyObject]
            let requestData = NSJSONSerialization.dataWithJSONObject(bodyInfo, options: NSJSONWritingOptions.allZeros, error: nil)
            let jsonString = NSString(data: requestData!, encoding: NSUTF8StringEncoding)
            let postLength = "\(jsonString!.length)"
            request.setValue(postLength, forHTTPHeaderField: "Content-Length")
            let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = postData
            
            
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (responseObject, data, error) -> Void in
                
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    completion?(responseInfo: json)
                    
                }
                
            })
            
            
        }
        
    }
    
}