//
//  Never.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension Never: RawRepresentable {
    public init?(rawValue: String) {
        return nil
    }
    public var rawValue: String {
        switch self { }
    }
}
