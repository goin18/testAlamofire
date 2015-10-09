//
//  ViewController.swift
//  testAlamofire
//
//  Created by Marko Budal on 09/10/15.
//  Copyright © 2015 Marko Budal. All rights reserved.
//

import UIKit
import Alamofire

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
        let parameters = ["aa":"1"]
        
        //postJSON("http://telemetry.sandbox.axa.baselinetelematics.com/T2/inbound.php?imei = " +mMacAddress.replace(":", ""), packetJson);
        //http://collector.staging.promutuel.baselinetelematics.com/1.0/t2

        
        let http = "http://telemetry.sandbox.axa.baselinetelematics.com/T2/inbound.php?imei=84EB182B97CD"
    
//        Alamofire.request(.POST, http, parameters: parameters, encoding: .JSON).responseJSON {
//            (res) -> Void in
//            
//            print("Res: \(res.description)")
//            print("Res: \(res.description)")
//            print("Res: \(res.description)")
//            
//            }

        let fileURL = NSBundle.mainBundle().URLForResource("myJson", withExtension: "json")
            print(fileURL)
        
        Alamofire.upload(.POST, http, file: fileURL!).responseJSON {
                        (res) -> Void in
            
                        print("Res: \(res.description)")
                        print("Res: \(res.description)")
                        print("Res: \(res.description)")
                        
                        }
        }



}



