import DropBear

class ScrollableStackRobot: RobotBase, AccessibleRobot {
    typealias Container = Containers.NavigationController
    typealias Element = AccessibilityIdentifiers.ScrollableStackViewController
}

extension RunningRobot where Current == ScrollableStackRobot {
    func pushTabBar() -> NextRobot<TabBarRobot> {
        return tap(.button3).nextRobot()
    }
}
