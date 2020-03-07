import XCTest

/// A `Robot` represents the actions that can be performed on a given screen
public protocol Robot {
    associatedtype Element: RawRepresentable = String where Element.RawValue == String

    var app: XCUIApplication { get }

    init(app: XCUIApplication)
}

extension Robot {
    /// Waits for the provided amount of time before continuing with the test
    public func wait(_ duration: TimeInterval) -> Self {
        Thread.sleep(forTimeInterval: duration)
        return self
    }
}


/// A pre-made base class you can use to avoid some `Robot` boilerplate code
/// It does not conform to `Robot` so consumers are still required to do so
open class RobotBase: Launchable, Assertable, Actionable {
    public let source: XCUIElement

    public required init(source: XCUIElement) {
        self.source = source
    }
}

public class RestrictedRobotBase {
    public let source: XCUIElement

    public required init(source: XCUIElement) {
        self.source = source
    }
}

extension RawRepresentable where RawValue == String {
    public func element(in application: XCUIApplication, hierarchy: [XCUIElement.ElementType], file: StaticString, line: UInt) -> XCUIElement {
        return application.element(identifier: rawValue, in: hierarchy, file: file, line: line)
    }
}

extension String: RawRepresentable {
    public init?(rawValue: String) { self = rawValue }
    public var rawValue: String { return self }

    public func element(in application: XCUIApplication, hierarchy: [XCUIElement.ElementType], file: StaticString, line: UInt) -> XCUIElement {
        return application.element(identifier: self, in: hierarchy, file: file, line: line)
    }
}
