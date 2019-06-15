//
//  SumOperation.swift
//  AsyncOperationExample
//
//  Created by Admin on 16.06.2019.
//  Copyright © 2019 goncharov denis. All rights reserved.
//

import Foundation

class SumOperation: Operation {
    enum State: String {
        case isReady, isExecuting, isFinished
    }
    
    private var state: State = .isReady {
        willSet {
            willChangeValue(forKey: newValue.rawValue)
            willChangeValue(forKey: state.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
    
    public var result: Int?
    public var firstNumber: Int
    public var secondNumber: Int
    
    init(firstNumber: Int, secondNumber: Int) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        super.init()
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override var isReady: Bool {
        return super.isReady && state == .isReady
    }
    
    override var isExecuting: Bool {
        return state == .isExecuting
    }
    
    override var isFinished: Bool {
        return state == .isFinished
    }
    
    override func start() {
        if isCancelled {
            state = .isFinished
            return
        }
        main()
        state = .isExecuting
    }
    
    override func cancel() {
        super.cancel()
        state = .isFinished
    }
    
    override func main() {
        AsyncUtils.sum(lhs: firstNumber, rhs: secondNumber) {
            [unowned self](sum: Int) in
            self.result = sum
            print(sum)
            self.state = .isFinished
        }
        print("main execute")
    }
}
