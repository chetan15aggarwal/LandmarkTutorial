//
// MacLandmarks
// Created by Chetan Aggarwal.


import SwiftUI

struct ContentView: View {
    var body: some View {
        let viewModel = LandmarkExploreViewModel()
        
        LandmarkList()
            .environmentObject(viewModel)
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
}
