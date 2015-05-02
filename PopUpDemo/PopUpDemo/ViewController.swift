//
//  ViewController.swift
//  PopUpDemo
//
//  Created by 洪亞偉 on 15/5/1.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popBtn: UIButton!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var width: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        popBtn.layer.cornerRadius = 50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func popUp(sender: AnyObject) {
        println("Normal")
        
        height.constant = 100
        width.constant = 100
        popBtn.layer.cornerRadius = 50
        
        performSegueWithIdentifier("showPopup", sender: nil)
    }

    @IBAction func down(sender: AnyObject) {
        println("Down")

        height.constant = 90
        width.constant = 90
        popBtn.layer.cornerRadius = 45

    }

}

