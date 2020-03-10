import XCTest

/// A `Robot` represents the actions that can be performed on a given screen
public protocol Robot {
    associatedtype Element: RawRepresentable = StringElement where Element.RawValue == String

    var source: XCUIElement { get }

    init(source: XCUIElement)
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

public struct StringElement: RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String
    public init(rawValue: String) { self.rawValue = rawValue }
    public init(stringLiteral value: String) { self.rawValue = value }
}

extension RawRepresentable where RawValue == String {
    public func element(in source: XCUIElement, hierarchy: [XCUIElement.ElementType], file: StaticString, line: UInt) -> XCUIElement {
        return source.element(identifier: rawValue, in: hierarchy, file: file, line: line)
    }
}
