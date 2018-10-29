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
   let disposeBag = DisposeBag()
	 let americanSockets = Variable<[Socket]>([])
	
	init() {
		americanSockets.value = Socket.northAmerica
	}
  
  func updateTest(){
   // Update a single value in Variable subject
   americanSockets.value.first?.name.value = "First Value Updated!"

    //  use CompactMap(aka FlatMap) to update one or more values in Variable subject
    americanSockets.value.compactMap{ socket -> (Socket) in
      if socket.position.value == 1 {
        socket.name.value = "Second Value Update!"
        debugPrint(socket.name.value)
      }
      return socket
    }
  }
}
