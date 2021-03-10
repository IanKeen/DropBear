//
//  TestValue+Equality.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

public struct TestValueEquality {
    public let equal: (String, String) -> Bool

    public init(equal: @escaping (String, String) -> Bool) {
        self.equal = equal
    }
}

extension TestValueEquality {
    public static var caseInsensitive: TestValueEquality {
        return .init { $0.compare($1, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: nil) == .orderedSame }
    }
    public static var caseSensitive: TestValueEquality {
        return .init { $0.compare($1, options: [.diacriticInsensitive], range: nil, locale: nil) == .orderedSame }
    }
}
