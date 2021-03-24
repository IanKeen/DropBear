//
//  RunningRobot+Modal.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

public protocol ModalHierarchy {
    associatedtype Presenter

    var presenter: Presenter { get }
}

public struct Modal<Presenter>: ModalHierarchy {
    public let presenter: Presenter
}

extension RunningRobot {
    public typealias ModalRobot<Content: Robot> = RunningRobot<
        Configuration,
        Modal<RunningRobot>,
        Content
    >
}

extension RunningRobot.NextRobotAction {
    public static var modal: RunningRobot.NextRobotAction<Modal<RunningRobot>, Next> {
        return .init(hierarchy: { .init(presenter: $0) }, next: Next.init)
    }
}
extension RunningRobot where ViewHierarchy: ModalHierarchy {
    public func dismissModal() -> ViewHierarchy.Presenter {
        return viewHierarchy.presenter
    }
}
