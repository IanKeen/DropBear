import XCTest

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
