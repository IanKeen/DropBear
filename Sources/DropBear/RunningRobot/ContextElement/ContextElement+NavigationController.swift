import XCTest

extension ContextElement where Context == NoContext {
    public static var navigationTitle: ContextElement {
        return .init { $0.navigationBars.staticTexts.firstMatch }
    }
}

extension ContextElement where Context: NavigationControllerContext {
    public static var navigationTitle: ContextElement {
        return .init { $0.navigationBars.staticTexts.firstMatch }
    }
}
