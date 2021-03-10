//
//  Robot.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import XCTest

/// A `Robot` is the core building block of your UI test suite.
///
/// It represents a logical grouping of elements within the view hierarchy.
/// Most commonly this will be a `UIViewController` or a `View`.
///
/// It could represent smaller parts of the UI such as `UIAlertController` or `Alert`s
/// It can also represent larger, composed parts of the screen such as a `UIViewController` or `View` made up of _other_ `UIViewController`s or `View`s
///
/// What each `Robot` represents sis defined by its `Element` type. This can be any `RawRepresentable` with a `RawValue` of `String`.
/// So any `String` backed `enum` or other custom type that satisfies this requirement.
///
/// If needed, you can also use [ElementSet](x-source-tag://ElementSet) to combine more than one of these types if needed.
///
/// - Tag: Robot
public protocol Robot {
    associatedtype Element: RawRepresentable where Element.RawValue == String

    var source: XCUIElement { get }

    init(source: XCUIElement)
}
