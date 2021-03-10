import Combine
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var bag = Set<AnyCancellable>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Dependencies.session.publisher
            .removeDuplicates()
            .sink { value in
                switch value {
                case .loggedOut:
                    Dependencies.reset()
                case .loggedIn:
                    break
                }
            }
            .store(in: &bag)

        let window = RootWindow()
        window.rootViewController = .init()
        self.window = window
        return true
    }
}
