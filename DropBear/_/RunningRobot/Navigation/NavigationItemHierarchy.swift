//
//  NavigationItemHierarchy.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

public protocol NavigationItemHierarchy {
    associatedtype NavigationElement
    associatedtype Parent
    associatedtype Root
    associatedtype Previous

    var parent: Parent { get }
    var root: Root { get }
    var previous: Previous { get }
}

public struct NavigationItem<NavigationElement, Parent, Root, Previous>: NavigationItemHierarchy {
    public let parent: Parent
    public let root: Root
    public let previous: Previous
}

extension NavigationItem: TabItemHierarchy where Parent: TabItemHierarchy {
    public var tabController: Parent.TabController { parent.tabController }
}

extension NavigationItem: ModalHierarchy where Parent: ModalHierarchy {
    public var presenter: Parent.Presenter { parent.presenter }
}
