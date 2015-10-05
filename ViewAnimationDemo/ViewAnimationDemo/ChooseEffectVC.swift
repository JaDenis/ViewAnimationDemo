//
//  ChooseEffectVC.swift
//  ViewAnimationDemo
//
//  Created by Massimo Polimeni on 03/04/15.
//  Copyright (c) 2015 Massimo Polimeni. All rights reserved.
//

import UIKit

class ChooseEffectVC: UIViewController
{
	// MARK: - VIEW LIFE CYCLE
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	// MARK - SEGUE
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
	{
        let viewController:EffectVC = segue.destinationViewController as! EffectVC
		viewController.effect = segue.identifier!
	}

}

