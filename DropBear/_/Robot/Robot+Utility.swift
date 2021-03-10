//
//  Robot+Utility.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

extension Robot {
    /// Waits for the provided amount of time before continuing with the test
    public func wait(_ duration: TimeInterval) -> Self {
        Thread.sleep(forTimeInterval: duration)
        return self
    }
}
