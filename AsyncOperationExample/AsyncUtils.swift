//
//  AsyncUtils.swift
//  AsyncOperationExample
//
//  Created by Admin on 16.06.2019.
//  Copyright © 2019 goncharov denis. All rights reserved.
//

import Foundation

class AsyncUtils {
    static func sum(lhs: Int, rhs: Int, completion: @escaping ((Int) -> Void)) {
        DispatchQueue.global().async {
            sleep(5)
            let sum = lhs + rhs
            completion(sum)
        }
    }
}
