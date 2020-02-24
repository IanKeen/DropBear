import XCTest

public struct Alert<Button: AlertButton> {
    public typealias ApplicationSource = (_ current: XCUIApplication) -> XCUIApplication

    public let source: ApplicationSource
    public let assertion: ElementAssertion

    public init(source: @escaping ApplicationSource, assertion: ElementAssertion) {
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
