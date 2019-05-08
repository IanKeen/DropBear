import DropBear

class Tab1ViewControllerRobot<Context: ContextType, Previous: Robot>: RunningRobot<Context, Previous>, AccessibleRobot {
    typealias Element = AccessibilityIdentifiers.Tab1ViewController
}

class Tab2ViewControllerRobot<Context: ContextType, Previous: Robot>: RunningRobot<Context, Previous>, AccessibleRobot {
    typealias Element = AccessibilityIdentifiers.Tab2ViewController

    func pushTableViewController() -> TableViewRobot<NavigationController, Tab2ViewControllerRobot> {
        return tap(.tab2button).makeRobot()
    }
}

class TabBarRobot<Previous: Robot>: RunningRobot<NavigationController, Previous>, TabBarControllerRobot {
    func selectTab1() -> Tab1ViewControllerRobot<TabBarController, TabBarRobot> {
        return makeRobot(forTab: 0)
    }
    func selectTab2() -> Tab2ViewControllerRobot<TabBarController, TabBarRobot> {
        return makeRobot(forTab: 1)
    }
}
