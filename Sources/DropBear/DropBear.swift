import Foundation

public enum DropBear {
    public static let defaultWaitTime: TimeInterval = 5

    public static func poll(until predicate: @escaping () -> Bool, timeout: TimeInterval) {
        var fulfilled = false

        let timer = DispatchSource.makeTimerSource(flags: [.strict], queue: DispatchQueue.global(qos: .userInitiated))
        timer.schedule(deadline: .distantFuture, repeating: .milliseconds(5), leeway: .milliseconds(5))
        timer.setEventHandler(handler: { })

        let observer = CFRunLoopObserverCreateWithHandler(nil, CFRunLoopActivity.allActivities.rawValue, true, 0) { _, _ in
            fulfilled = predicate()
            if (fulfilled) { CFRunLoopStop(CFRunLoopGetCurrent()) }
        }
        CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, .defaultMode)
        timer.resume()
        CFRunLoopRunInMode(.defaultMode, timeout, false)
        CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, .defaultMode)

        timer.cancel()
    }
}

