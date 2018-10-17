//
//  ExampleClass.swift
//  MVVM_POP_RxSwift_BasicApp
//
//  Created by Loud on 10/16/18.
//  Copyright © 2018 William Seaman. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ExampleClass {
  let disposeBag = DisposeBag()
  let observableJust = Observable<String>.just("Hello again dummy 🐥");
  
  func runExample() {
    
    // OBSERVABLE //
    
    let observable = Observable<String>.create { (observer) -> Disposable in
      DispatchQueue.global(qos: .default).async {
        Thread.sleep(forTimeInterval: 2)
        observer.onNext("Hello dummy 🐣")
        observer.onCompleted()
      }
      return Disposables.create()
    }
    // OBSERVER //
    
    observable.subscribe(onNext: { (element) in
      print(element)
    }).disposed(by: disposeBag)
  }
  
  
  
  func runJustExample(){
    
    observableJust.subscribe(onNext: { (element) in
      print(element)
    }).disposed(by: disposeBag)
    
  }
  
  
}


