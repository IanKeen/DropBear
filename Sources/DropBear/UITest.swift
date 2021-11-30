import XCTest

/// A preconfigured `XCTestCase` for UI tests.
open class UITest: XCTestCase {
    open override func setUp() {
        super.setUp()

        continueAfterFailure = false
    }
}
