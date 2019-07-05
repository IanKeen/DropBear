import DropBear

class Tab1ViewControllerRobot: RobotBase, AccessibleRobot {
    typealias Container = Containers.TabBarController
    typealias Element = AccessibilityIdentifiers.Tab1ViewController
}

class Tab2ViewControllerRobot: RobotBase, AccessibleRobot {
    typealias Container = Containers.TabBarController
    typealias Element = AccessibilityIdentifiers.Tab2ViewController
}

extension RunningRobot where Current == Tab2ViewControllerRobot {
    func pushTableViewController() -> NextRobot<TableViewRobot> {
        return tap(.tab2button).nextRobot()
    }
}

class TabBarRobot: RobotBase, Robot, TabBarController {
    typealias Container = Containers.NavigationController
}

extension RunningRobot where Current == TabBarRobot {
    func selectTab1() -> NextRobot<Tab1ViewControllerRobot> {
        return nextRobot(forTab: 0)
    }
    func selectTab2() -> NextRobot<Tab2ViewControllerRobot> {
        return nextRobot(forTab: 1)
    }
}
