//
//  ViewController.swift
//  AsyncOperationExample
//
//  Created by Admin on 16.06.2019.
//  Copyright © 2019 goncharov denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let operationQueue = OperationQueue()
        let sumOperation = SumOperation(firstNumber: 5, secondNumber: 6)
        let handlerOperation = BlockOperation {
            [unowned sumOperation] in
            print("handler")
            sleep(3)
            print(sumOperation.result)
        }
        
        handlerOperation.addDependency(sumOperation)
        operationQueue.addOperation(sumOperation)
        operationQueue.addOperation(handlerOperation)
    }


}

