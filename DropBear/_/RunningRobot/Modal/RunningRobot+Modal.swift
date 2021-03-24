//
//  RunningRobot+Modal.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

extension RunningRobot {
    public typealias ModalNavigationRobot<NavigationElement, Next: Robot> = RunningRobot<
        Configuration,
        Modal<
            RunningRobot,
            NavigationController<NavigationElement, ViewHierarchy>
        >,
        Next
    >
}

extension RunningRobot.NextRobotAction {
    public static func modal<NewHierarchy>(
        _ containing: RunningRobot.NextRobotAction<NewHierarchy, Next>
    ) -> RunningRobot.NextRobotAction<Modal<RunningRobot, NewHierarchy>, Next> {
        return .init(
            hierarchy: { robot in
                let contentHierarchy = containing.hierarchy(robot)
                return .init(presenter: robot, content: contentHierarchy)
            },
            next: Next.init
        )
    }
}

extension RunningRobot where ViewHierarchy: ModalHierarchy {
    public func dismissModal(performDownwardSwipe: Bool = true, file: StaticString = #file, line: UInt = #line) -> ViewHierarchy.Presenter {
        guard performDownwardSwipe else { return viewHierarchy.presenter }

        source.swipeDown()

        return viewHierarchy.presenter
    }
}
