//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

@main
struct LandmarkTutorialApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif

        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
