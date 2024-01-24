//
// MacLandmarks
// Created by Chetan Aggarwal.


import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = ExploreModule().provideExploreViewModel()
        
        LandmarkList()
            .environmentObject(viewModel)
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
}
