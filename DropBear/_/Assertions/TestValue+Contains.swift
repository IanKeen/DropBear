//
//  TestValue+Contains.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Foundation

public struct TestValueContains {
    public let contains: (String, String) -> Bool

    public init(contains: @escaping (String, String) -> Bool) {
        self.contains = contains
    }
}

extension TestValueContains {
    public static var caseInsensitive: TestValueContains {
        return .init { $0.localizedStandardContains($1) }
    }
    public static var caseSensitive: TestValueContains {
        return .init { $0.contains($1) }
    }
}
