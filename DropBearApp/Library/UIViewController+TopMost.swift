//
//  UIViewController+TopMost.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-09.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import UIKit

extension UIViewController {
    var topMostViewController: UIViewController {
        switch self {
        case let controller as UINavigationController:
            return (controller.visibleViewController ?? controller.topViewController ?? controller).topMostViewController

        case let controller as UITabBarController:
            return (controller.selectedViewController ?? controller).topMostViewController

        default:
            return self
        }
    }
}

extension UIWindow {
    var topMostViewController: UIViewController? {
        return rootViewController?.topMostViewController
    }
}
