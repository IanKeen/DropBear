import DropBearSupport
import UIKit

let delegate = isUITesting
    ? UITestAppDelegate.self
    : AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(delegate))
