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

let landmark1 = LandmarkModel(id: 1, name: "Turtle Rock", park: "Joshua Tree National Park", state: "California", description: "this is the best place to visit", isFavorite: true, isFeatured: true, category: .rivers, imageName: "turtlerock", coordinates: LandmarkModel.Coordinates(latitude: -116.166868, longitude: 34.011286))

let landmark2 = LandmarkModel(id: 2, name: "Silver Salmon Creek", park: "Joshua Tree National Park", state: "California", description: "this is the best place to visit", isFavorite: false, isFeatured: false, category: .lakes, imageName: "silversalmoncreek", coordinates: LandmarkModel.Coordinates(latitude: -152.665167, longitude: 59.980167))
let landmarkItemsForPreview = [landmark1, landmark2]
