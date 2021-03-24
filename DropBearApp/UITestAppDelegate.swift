import UIKit
import DropBearSupport
import TestKit

class UITestAppDelegate: AppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        // Bootstrap app for the UI test being executed
        Dependencies.configure(UITestConfiguration(DropBearTestConfiguration.self))
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Speed up tests
        application.keyWindow!.layer.speed = 100

        requireSoftwareKeyboard()
    }
}

extension Dependencies {
    static func configure(_ config: TestConfiguration<DropBearTestConfiguration>?) {
        guard let config = config else { return }

        Dependencies.authenticator = config.authenticator
        Dependencies.keyValueStorage = config.keyValueStore
        Dependencies.$listDataSource.updateFactory { config.listDataSource }
        Dependencies.itemDetailPresentationMode = config.itemDetailPresentationMode
    }
}
