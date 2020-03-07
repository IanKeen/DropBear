import XCTest

public struct Alert<Button: AlertButton> {
    public typealias Source = (_ current: XCUIElement) -> XCUIElement

    public let source: Source
    public let assertion: ElementAssertion

    public init(source: @escaping Source, assertion: ElementAssertion) {
        self.source = source
        self.assertion = assertion
    }
}

public protocol AlertType {
    associatedtype AlertButtonType: AlertButton

    var assertion: ElementAssertion { get }
}

extension Alert: AlertType {
    public typealias AlertButtonType = Button
}
