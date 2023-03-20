//
//  AppDelegate.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/03/20.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()

        return true
    }
}
