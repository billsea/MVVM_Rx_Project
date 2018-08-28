//
//  Socket.swift
//  MVVM_POP_RxSwift_BasicApp
//
//  Created by Loud on 8/28/18.
//  Copyright © 2018 William Seaman. All rights reserved.
//

import Foundation

struct Socket {
	var name : String?
	var position : Int?
	var delay : Int?
	var voltage : Int?
	
	static var northAmerica : [Socket] = {
		let positionOne = Socket(name: "one", position: 0, delay: 0, voltage: 120)
		let positionTwo = Socket(name: "two", position: 1, delay: 0, voltage: 120)
		let positionThree = Socket(name: "three", position: 2, delay: 0, voltage: 120)
		let positionFour = Socket(name: "four", position: 3, delay: 0, voltage: 120)

		return [positionOne,positionTwo,positionThree,positionFour]
	}()
}
