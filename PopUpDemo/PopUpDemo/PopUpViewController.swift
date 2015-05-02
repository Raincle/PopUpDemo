//
//  PopUpViewController.swift
//  PopUpDemo
//
//  Created by 洪亞偉 on 15/5/1.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit
import iAd

class PopUpViewController: UIViewController, ADInterstitialAdDelegate {

    @IBOutlet weak var popUp: UIView!
    var interstitial: ADInterstitialAd!

    
    
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
        
        
        interstitial = ADInterstitialAd()
        interstitial.delegate = self
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func showAD(sender: AnyObject) {
        println("AD")
        if interstitial.loaded {
            interstitial.presentInView(view)
        self.requestInterstitialAdPresentation()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    //MARK: - iAd
    
    func cycleInterstitial() {
        interstitial.delegate = nil
        interstitial = ADInterstitialAd()
        interstitial.delegate = self
        
    }
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        cycleInterstitial()
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        cycleInterstitial()
    }
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