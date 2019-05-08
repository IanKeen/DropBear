import XCTest

/// A `Robot` represents the actions that can be performed on a given screen
public protocol Robot {
    associatedtype Context: ContextType

    var app: XCUIApplication { get }
}

public protocol ContextType { }

public class None: ContextType { }
public class NavigationController: ContextType { }
public class TabBarController: ContextType { }

extension RunningRobot where Context == NavigationController {
    public func popNavigationController(file: StaticString = #file, line: UInt = #line) -> Previous {
        if app.navigationBars.buttons.count == 0 {
            XCTFail("Unable to find a navigation button", file: file, line: line)
        }

        app.navigationBars.buttons.element(boundBy: 0).tap()
        return previous
    }
}

extension RunningRobot where Context == TabBarController {
    public func backToTabBarController(file: StaticString = #file, line: UInt = #line) -> Previous {
        return previous
    }
}
