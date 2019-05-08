import XCTest

extension XCUIElement {
    @discardableResult
    public func assert(_ assertion: ElementAssertion, _ rest: ElementAssertion..., file: StaticString = #file, line: UInt = #line) -> Self {
        return assert([assertion] + rest, file: file, line: line)
    }

    func assert(_ assertions: [ElementAssertion], file: StaticString = #file, line: UInt = #line) -> Self {
        for assertion in assertions {
            if !assertion.assertion(self) {
                let customMessage = assertion.message.map({ ":\n\($0)" }) ?? ""
                let message = "Assertion '\(assertion.name)' failed\(customMessage)"
                XCTFail(message, file: file, line: line)
                break
            }
        }

        return self
    }
}
