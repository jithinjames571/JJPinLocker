//
//  ViewController.swift
//  JJPinLocker
//
//  Created by jithinjames571 on 06/17/2019.
//  Copyright (c) 2019 jithinjames571. All rights reserved.
//


import UIKit
import JJPinLocker

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        let d = JJLockerViewController()
//        d.lol()
//
        
        JJLocker.shared.present(with: UIColor.green, header: "JJ Locker", messgage: "Please eter the pin", pinNumbers: 6, handler: {result in
            print("lol \(result)")
            if result == "12345"{
                
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

