//
//  ModalHierarchy.swift
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

extension Modal: NavigationHierarchy where Presenter: RunningRobotType, Presenter.ViewHierarchy: NavigationHierarchy {
    public typealias NavigationElement = Presenter.ViewHierarchy.NavigationElement

    public var parent: Presenter.ViewHierarchy.Parent { presenter.viewHierarchy.parent }
}

extension Modal: NavigationItemHierarchy where Presenter: RunningRobotType, Presenter.ViewHierarchy: NavigationItemHierarchy {
    public var parent: Presenter.ViewHierarchy.Parent { presenter.viewHierarchy.parent }
    public var root: Presenter.ViewHierarchy.Root { presenter.viewHierarchy.root }
    public var previous: Presenter.ViewHierarchy.Previous { presenter.viewHierarchy.previous }

}
