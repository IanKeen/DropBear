//
//  Result+Extension.swift
//  DomainKit
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension Result where Success == Void {
    public static var success: Result { .success(()) }
}
