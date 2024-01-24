//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @StateObject var viewModel = ProfileModule().provideProfileViewModel()
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = viewModel.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: viewModel.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = viewModel.profile
                    }
                    .onDisappear {
                        viewModel.profile = draftProfile
                    }
            }
        }
        .task { viewModel.loadHikeList() }
        .padding()
    }
}

#Preview {
    ProfileHost()

}
