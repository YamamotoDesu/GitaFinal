//
//  BhagavadGitaApp.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/02/27.
//

import SwiftUI

@main
struct BhagavadGitaApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
