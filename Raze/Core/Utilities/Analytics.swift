import Foundation

protocol AnalyticsTracking {
    func track(_ event: AnalyticsEvent)
}

enum AnalyticsEvent: Equatable {
    case screenViewed(name: String)
    case tap(name: String)
    case error(name: String)
}

struct NoopAnalyticsTracker: AnalyticsTracking {
    func track(_ event: AnalyticsEvent) { }
}

