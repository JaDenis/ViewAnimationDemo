//
//  EffectVC.swift
//  ViewAnimationDemo
//
//  Created by Massimo Polimeni on 03/04/15.
//  Copyright (c) 2015 Massimo Polimeni. All rights reserved.
//

import UIKit

class EffectVC: UIViewController
{
	var effect: String = ""
	
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var mainImage: UIImageView!
	
	
	// MARK: - VIEW LIFE CYCLE
	
	override func viewDidLoad()
	{
        super.viewDidLoad()
		
        // adding blur effect to backgroundImage
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		backgroundImage.addSubview(blurEffectView)
		
		// set initial state
		switch effect
		{
			case "showEffect1","showEffect2": // growing effect
				
				// scales down the image view
				mainImage.transform = CGAffineTransformMakeScale(0.0, 0.0)
				
			case "showEffect3": // slide up animation
				
				// move the image view off screen (and then bring it back to its original position)
				mainImage.transform = CGAffineTransformMakeTranslation(0, 500)
				
			case "showEffect4": // spring + slide up animations
				
				// combine two animation with scale and translation
				let scale = CGAffineTransformMakeScale(0.0, 0.0)
				let translate = CGAffineTransformMakeTranslation(0, 500)
				mainImage.transform = CGAffineTransformConcat(scale, translate)
			
			default:
				print("error");
		}
    }

	override func viewDidAppear(animated: Bool)
	{
		// set final state
		switch effect
		{
            case "showEffect1": // growing effect
                UIView.animateWithDuration(0.7, delay: 0.0, options: [],
                    animations:
					{
						self.mainImage.transform = CGAffineTransformMakeScale(1, 1)
					}, completion: nil);
        
            case "showEffect2": // spring animation
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [],
                    animations:
					{
						self.mainImage.transform = CGAffineTransformMakeScale(1, 1)
					}, completion: nil);
            
            case "showEffect3": // slide up animation
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
                    animations:
					{
						self.mainImage.transform = CGAffineTransformMakeTranslation(0, 0)
					}, completion: nil)
        
            case "showEffect4": // spring + slide up animations
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
                    animations:
					{
                        let scale = CGAffineTransformMakeScale(1, 1)
                        let translate = CGAffineTransformMakeTranslation(0, 0)
                        self.mainImage.transform = CGAffineTransformConcat(scale, translate)
                    }, completion: nil)
            default:
                print("error");
		}
	}
	
    override func didReceiveMemoryWarning()
	{
        super.didReceiveMemoryWarning()
    }
	
	
	// MARK - IBACTION
	
	@IBAction func closeTapped(sender: AnyObject)
	{
		self .dismissViewControllerAnimated(true, completion: nil)
	}
}
