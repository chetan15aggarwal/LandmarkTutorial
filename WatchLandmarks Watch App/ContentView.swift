//
// WatchLandmarks Watch App
// Created by Chetan Aggarwal.


import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .environmentObject(LandmarkExploreViewModel())
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    return ContentView()
}
