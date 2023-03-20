//
//  ContentViewModel.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/03/01.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Injected private var logger: BGLoggerType
    @Injected private var analyticsManager: AnalyticsManagerProtocol

//    init(logger: BGLoggerType = BGLogger()) {
//        self.logger = logger
//    }

    func onAppear() {
        logger.info("View is loaded")
        print(API.baseURL)
//        analyticsManager.logEvent(event: Event(name: "onbording_test_2"))
        analyticsManager.logEvent(event: AnalyticsEvent.clickButtonEvent)
    }
}
