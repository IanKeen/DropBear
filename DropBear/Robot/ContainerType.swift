import XCTest

public protocol ContainerType { }

public class None: ContainerType { }

extension UINavigationController: ContainerType { }
extension UITabBarController: ContainerType { }

extension RunningRobot where Container == UINavigationController {
    public func popNavigationController(required: Bool = true, file: StaticString = #file, line: UInt = #line) -> Previous {
        if !required && app.navigationBars.buttons.count == 0 {
            return previous
        }

        if app.navigationBars.buttons.count == 0 {
            XCTFail("Unable to find a navigation button", file: file, line: line)
        }

        app.navigationBars.buttons.element(boundBy: 0).tap()
        return previous
    }
}

extension RunningRobot where Container == UITabBarController {
    public func backToTabBarController(file: StaticString = #file, line: UInt = #line) -> Previous {
        return previous
    }
}
