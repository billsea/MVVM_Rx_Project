//
//  Socket.swift
//  MVVM_POP_RxSwift_BasicApp
//
//  Created by Loud on 8/28/18.
//  Copyright © 2018 William Seaman. All rights reserved.
//

import Foundation
import RxSwift

struct Socket {
	var name : Variable<String>
	var position : Variable<Int>
	var delay : Int?
	var voltage : Int?
	
	static var northAmerica : [Socket] = {
		let positionOne = Socket(name: Variable("one"), position: Variable(0), delay: 0, voltage: 120)
		let positionTwo = Socket(name: Variable("two"), position: Variable(1), delay: 0, voltage: 120)
		let positionThree = Socket(name: Variable("three"), position: Variable(2), delay: 0, voltage: 120)
		let positionFour = Socket(name: Variable("four"), position: Variable(3), delay: 0, voltage: 120)

		return [positionOne,positionTwo,positionThree,positionFour]
	}()
}
