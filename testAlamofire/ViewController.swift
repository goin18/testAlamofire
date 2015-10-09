//
//  ViewController.swift
//  testAlamofire
//
//  Created by Marko Budal on 09/10/15.
//  Copyright © 2015 Marko Budal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendJson(sender: UIButton) {
        
        //postJSON("http://telemetry.sandbox.axa.baselinetelematics.com/T2/inbound.php?imei = " +mMacAddress.replace(":", ""), packetJson);
        //http://collector.staging.promutuel.baselinetelematics.com/1.0/t2
        
        
        
        let contents =  readFile("myJson", fileType: "json")
        let jsonData = contents!.dataUsingEncoding(NSUTF8StringEncoding)!
        
        
        
        do {
            let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
            
            if let jsonDict = jsonDict {
                
                // work with dictionary here
                
                postJson(jsonDict as! [String : AnyObject])
               
                
            } else {
                // more error handling
            }
        } catch let error {
            // error handling
            
            print(error)
        }
    }
    
    func postJson(jsonDict:[String : AnyObject]) -> Void
    {
        let postsEndpoint = "http://collector.staging.promutuel.baselinetelematics.com/1.0/t2?imei=84EB182B97CD"

        Alamofire.request(.POST, postsEndpoint, parameters: jsonDict).responseJSON { response in
            print(response)
        }
    
    }
    
    func readFile(fileName: String, fileType: String) -> String? {
        let fileRoot = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        
        do {
            let contents = try NSString(contentsOfFile: fileRoot!, usedEncoding: nil) as String
            return contents
        } catch {
            // contents could not be loaded
        }
        return nil
    }

}


