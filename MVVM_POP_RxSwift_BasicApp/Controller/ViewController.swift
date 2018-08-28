//
//  ViewController.swift
//  MVVM_POP_RxSwift_BasicApp
//
//  Created by Loud on 8/27/18.
//  Copyright © 2018 William Seaman. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		//test rxswift
		_ = Observable.of("Hello RxSwift")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

