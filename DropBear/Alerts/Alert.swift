import XCTest

public struct Alert<Button: AlertButton> {
    public typealias ApplicationSource = (_ current: XCUIApplication) -> XCUIApplication

    public let source: ApplicationSource
    public let text: String

    public init(source: @escaping ApplicationSource, containingText text: String) {
        self.source = source
        self.text = text
    }
}

public protocol AlertType {
    associatedtype AlertButtonType: AlertButton

    var text: String { get }
}

extension Alert: AlertType {
    public typealias AlertButtonType = Button
}

public protocol AlertButton: RawRepresentable {
    func buttonElement(from alert: XCUIElement) -> XCUIElement
}

extension AlertButton where RawValue == String {
    public func buttonElement(from alert: XCUIElement) -> XCUIElement {
        return alert.buttons[rawValue]
    }
}

extension AlertButton where RawValue == Int {
    public func buttonElement(from alert: XCUIElement) -> XCUIElement {
        return alert.buttons.element(boundBy: rawValue)
    }
}
