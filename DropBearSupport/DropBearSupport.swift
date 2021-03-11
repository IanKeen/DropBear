//
//  DropBearSupport.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

/// Returns `true` if a DropBear UI test is active, otherwise `false`
///
/// - Tag: isUITesting
public var isUITesting: Bool {
    return ProcessInfo.processInfo.environment["UITesting"] != nil
}
