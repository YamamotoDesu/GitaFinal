//
//  FirebaseAnalyticsManager.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/03/20.
//

import Firebase
import Foundation

class FirebaseAnalyticsManager {
    static let shared = FirebaseAnalyticsManager()

    func logEvent(name: String, param: [String: Any]) {
        Analytics.logEvent(name, parameters: param)
    }
}
