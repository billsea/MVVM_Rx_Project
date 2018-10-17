//
//  DisplayTableViewController.swift
//  MVVM_POP_RxSwift_BasicApp
//
//  Created by Loud on 8/28/18.
//  Copyright © 2018 William Seaman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DisplayTableViewController: UIViewController{
	
  @IBOutlet weak var tableView: UITableView!
	
	//RxSwift
	let socketsViewModel = SocketsViewModel()
	let disposeBag = DisposeBag()

  let example = ExampleClass()
  let model = GoogleModel()
  
	override func viewDidLoad() {
			super.viewDidLoad()

      testRxFunction()
    
      setupCellConfiguration()
	}
  
  func testRxFunction(){
    //1
    //example.runExample()
    
    //2
//    example.runJustExample()
//    example.observableJust.subscribe(onCompleted: {
//      print("I'm done")
//    }).disposed(by: disposeBag)
    
    //3
    //Remember about [weak self]/[unowned self] to prevent retain cycles!
//    model.createGoogleDataObservable()
//      .subscribe({  [weak self] (element) in
//        debugPrint(element)
//      })
//      .addDisposableTo(disposeBag)
    
    
   }
 



	// MARK: loads table view cells - and updates when view model changes - Reactive setup (RxSwift)
	private func setupCellConfiguration() {
	socketsViewModel.americanSockets.asObservable().bind(to: tableView
		.rx
		.items(cellIdentifier: "cell",
					 cellType: UITableViewCell.self)) {
						row, socket, cell in
						cell.textLabel?.text = socket.name
		}
		.disposed(by: disposeBag)

	}
	
	
	@IBAction func updateModel() {
		let s = Socket(name: "one", position: 0, delay: 0, voltage: 120)
    
		socketsViewModel.americanSockets.value.append(s)
		//socketsViewModel.sockets.value.remove(at: 1)
		//socketsViewModel.sockets.value.insert(s, at: 3)
    
    
   
    
  
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Navigation

	/*
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			// Get the new view controller using segue.destinationViewController.
			// Pass the selected object to the new view controller.
	}
	*/

}
