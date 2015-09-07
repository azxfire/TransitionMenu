//
//  TransitionManager.swift
//  
//
//  Created by taowang on 15/9/7.
//
//

import UIKit

class TransitionManager: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {
    private var presenting = true
    
    // animate a change from one viewcontroller to another
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: Perform the animation
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        //set up from 2D transforms that we'll use in the animation
        
        let π : CGFloat = 3.14159265359
        let offScreenRight = CGAffineTransformMakeRotation(-π/2)
        let offScreenLeft = CGAffineTransformMakeRotation(π/2)
        
        
//        let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
//        let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
        
//        toView.transform = offScreenRight
        toView.transform = self.presenting ? offScreenRight : offScreenLeft
        
        
        //rotation
        toView.layer.anchorPoint = CGPointMake(0, 0)
        fromView.layer.anchorPoint = CGPointMake(0, 0)
        
        toView.layer.position = CGPointMake(0, 0)
        fromView.layer.position = CGPointMake(0, 0)
        
        
        container.addSubview(toView)
        container.addSubview(fromView)
//        container.backgroundColor = UIColor.whiteColor()
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations: {
            
//            fromView.transform = offScreenLeft
            fromView.transform = self.presenting ? offScreenLeft : offScreenRight
            toView.transform = CGAffineTransformIdentity
            
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
        })
        
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // remmeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
