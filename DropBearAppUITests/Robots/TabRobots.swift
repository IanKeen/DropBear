import DropBear

class Tab1ViewControllerRobot<Container: ContainerType, Previous: Robot>: RunningRobot<Container, Previous>, AccessibleRobot {
    typealias Element = AccessibilityIdentifiers.Tab1ViewController
}

class Tab2ViewControllerRobot<Container: ContainerType, Previous: Robot>: RunningRobot<Container, Previous>, AccessibleRobot {
    typealias Element = AccessibilityIdentifiers.Tab2ViewController

    func pushTableViewController() -> TableViewRobot<UINavigationController, Tab2ViewControllerRobot> {
        return tap(.tab2button).makeRobot()
    }
}

class TabBarRobot<Previous: Robot>: RunningRobot<UINavigationController, Previous>, TabBarControllerRobot {
    func selectTab1() -> Tab1ViewControllerRobot<UITabBarController, TabBarRobot> {
        return makeRobot(forTab: 0)
    }
    func selectTab2() -> Tab2ViewControllerRobot<UITabBarController, TabBarRobot> {
        return makeRobot(forTab: 1)
    }
}
