//
//  FirebaseAnalyticsManager.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/03/20.
//

import Firebase
import Foundation

final class FirebaseAnalyticsManager: AnalyticsEventLoggerProtocol {
    func initialize() {}

    func logEvent(event: EventProtocol) {
        Analytics.logEvent(event.name, parameters: event.param)
    }
}
