//
//  PopUpViewController.swift
//  PopUpDemo
//
//  Created by 洪亞偉 on 15/5/1.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popUp: UIView!

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popUp.layer.cornerRadius = 10
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("close:"))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}

extension PopUpViewController: UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return DimmingPresentationController(presentedViewController: presented, presentingViewController: presenting)
        
    }
}

extension PopUpViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
    return (touch.view === view)
    }
}