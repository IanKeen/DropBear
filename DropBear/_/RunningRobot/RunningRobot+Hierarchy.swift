//
//  RunningRobot+Hierarchy.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-22.
//  Copyright © 2021 Mustard. All rights reserved.
//

public struct ViewHierarchyModifier<In, Out> {
    let modify: (In) -> Out
}

extension ViewHierarchyModifier {
    public static var navigation: ViewHierarchyModifier<In, NavigationController<NoNavigationElement, In>> {
        return .init { .init(parent: $0) }
    }
    public static func navigation<T>(elements: T.Type) -> ViewHierarchyModifier<In, NavigationController<T, In>> {
        return .init { .init(parent: $0) }
    }
}

extension ViewHierarchyModifier {
    public static var tabs: ViewHierarchyModifier<In, TabBarController> {
        return .init { _ in .init() }
    }
}
