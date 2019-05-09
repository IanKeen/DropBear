import XCTest

/// A `Robot` represents the actions that can be performed on a given screen
public protocol Robot {
    associatedtype Container: ContainerType

    var app: XCUIApplication { get }
}
