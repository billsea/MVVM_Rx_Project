//
//  SocketViewModel.swift
//  MVVM_POP_RxSwift_BasicApp
//
//  Created by Loud on 8/28/18.
//  Copyright © 2018 William Seaman. All rights reserved.
//

import Foundation
import RxSwift

final class SocketsViewModel {
	 let americanSockets = Variable<[Socket]>([])
	
	init() {
		americanSockets.value = Socket.northAmerica
	}
}
