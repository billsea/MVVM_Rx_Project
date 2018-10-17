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
  let variableString = Variable("initString")
  
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
  
  
  //Variable - reads the last emitted value imperatively
  func runVariableExample() {
    //Getting the value
    print(variableString.value)
    
    //Setting the value
    variableString.value = "newString"
    
    //VARIABLE - Observing the value
    variableString.asObservable()
      .subscribe(onNext: { text in
        print(text)
      })
      .addDisposableTo(disposeBag)
  }
  
}

final class GoogleModel2 {
  //Behavior subject will repeat only the one last value. Moreover it’s initiated with a starting value, unlike the other subjectss
  public let googleString = BehaviorSubject<String>(value: "")
  private let disposeBag = DisposeBag()
  
  func fetchNewString() {
    
    let observable = Observable<String>.create({ (observer) -> Disposable in
      
      let session = URLSession.shared
      let task = session.dataTask(with: URL(string:"https://www.google.com")! as URL) { (data, response, error) in
        
        // We want to update the observer on the UI thread
        DispatchQueue.main.async() {
          if let err = error {
            // If there's an error, send an Error event and finish the sequence
            observer.onError(err)
          } else {
            let googleString = NSString(data: data!, encoding: 1 ) as String?
            //Emit the fetched element
            observer.onNext(googleString!)
            //Complete the sequence
            observer.onCompleted()
          }
        }
      }
      
      task.resume()
      return Disposables.create {
        task.cancel()
      }
    })
    
    // Bind the observable to the subject
    observable
      .bind(to: googleString)
      .disposed(by: disposeBag)
  }
}


