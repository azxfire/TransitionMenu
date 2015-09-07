//
//  ViewController.swift
//  TransitionMenu
//
//  Created by taowang on 15/9/7.
//  Copyright (c) 2015年 mdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let transitionManager = TransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unWindToViewController(sender:UIStoryboardSegue){
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toViewController = segue.destinationViewController as! UIViewController
        
        toViewController.transitioningDelegate = self.transitionManager;
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController == nil ? UIStatusBarStyle.Default : UIStatusBarStyle.LightContent
    }
}

