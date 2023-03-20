//
//  AnalyticsManager.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/03/20.
//

import Foundation

protocol EventProtocol {
    var name: String { get }
    var param: [String: Any] { get }
}

// struct Event: EventProtocol {
//    var name: String
//    var param: [String: Any] = [:]
// }

enum AnalyticsEvent {
    case clickButtonEvent
    case chapteredTapped(name: String)
}

extension AnalyticsEvent: EventProtocol {
    var name: String {
        switch self {
        case .clickButtonEvent:
            return "click_button_event"
        case .chapteredTapped:
            return "chapter_tapped"
        }
    }

    var param: [String: Any] {
        switch self {
        case .clickButtonEvent:
            return [:]
        case let .chapteredTapped(name):
            return ["name": name]
        }
    }
}

protocol AnalyticsEventLoggerProtocol {
    func initialize()
    func logEvent(event: EventProtocol)
}

protocol AnalyticsManagerProtocol {
    func logEvent(event: EventProtocol)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    private let logger: AnalyticsEventLoggerProtocol

    init(logger: AnalyticsEventLoggerProtocol) {
        self.logger = logger
    }

    func logEvent(event: EventProtocol) {
        logger.logEvent(event: event)
    }
}
