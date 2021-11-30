import Foundation
import UIKit
import DropBearSupport

class UITestAppDelegate: AppDelegate {
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.keyWindow!.layer.speed = 100
    }
}
