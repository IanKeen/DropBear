import XCTest

extension ContextElement where Context == None {
    public static var navigationTitle: ContextElement {
        return .init { $0.navigationBars.staticTexts.firstMatch }
    }
}

extension ContextElement where Context == NavigationController {
    public static var navigationTitle: ContextElement {
        return .init { $0.navigationBars.staticTexts.firstMatch }
    }
}
