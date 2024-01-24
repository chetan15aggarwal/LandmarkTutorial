//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct ProfileSummary: View {
    @StateObject var viewModel = ProfileModule().provideProfileViewModel()

    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Season: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badge")
                        .font(.headline)
                    ScrollView(.horizontal){
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    if !viewModel.hikeList.isEmpty {
                        HikeView(hike: viewModel.hikeList[0])
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
}
