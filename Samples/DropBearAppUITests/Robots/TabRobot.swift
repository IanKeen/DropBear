import DropBear

class Tab1ViewControllerRobot: RobotBase, Robot {
    typealias Element = AccessibilityIdentifiers.Tab1ViewController
}

class Tab2ViewControllerRobot: RobotBase, Robot {
    typealias Element = AccessibilityIdentifiers.Tab2ViewController
}

extension RunningRobot where Current == Tab2ViewControllerRobot {
    func pushTableViewController() -> NavigationRobot<NoNavigationElement, TableViewRobot> {
        return tap(.tab2button).nextRobot(action: .push)
    }
}

class TabRobot: RobotBase, TabBarRobot { }

extension RunningRobot where Current == TabRobot {
    func selectTab1() -> TabItemRobot<NoNavigationElement, Tab1ViewControllerRobot> {
        return nextRobot(action: .tab(0))
    }
    func selectTab2() -> TabItemRobot<NoNavigationElement, Tab2ViewControllerRobot> {
        return nextRobot(action: .tab(1))
    }
}
