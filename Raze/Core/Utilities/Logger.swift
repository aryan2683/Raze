import Foundation
import OSLog

protocol Logging {
    func debug(_ message: String, metadata: [String: String])
    func info(_ message: String, metadata: [String: String])
    func error(_ message: String, metadata: [String: String])
}

struct AppLogger: Logging {
    private let logger: Logger

    init(category: String) {
        let subsystem = Bundle.main.bundleIdentifier ?? "Raze"
        self.logger = Logger(subsystem: subsystem, category: category)
    }

    func debug(_ message: String, metadata: [String: String] = [:]) {
        logger.debug("\(message, privacy: .public) \(Self.format(metadata), privacy: .public)")
    }

    func info(_ message: String, metadata: [String: String] = [:]) {
        logger.info("\(message, privacy: .public) \(Self.format(metadata), privacy: .public)")
    }

    func error(_ message: String, metadata: [String: String] = [:]) {
        logger.error("\(message, privacy: .public) \(Self.format(metadata), privacy: .public)")
    }

    private static func format(_ metadata: [String: String]) -> String {
        guard !metadata.isEmpty else { return "" }
        return metadata
            .sorted(by: { $0.key < $1.key })
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: " ")
    }
}

