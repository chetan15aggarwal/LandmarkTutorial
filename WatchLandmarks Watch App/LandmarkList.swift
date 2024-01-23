//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject private var viewModel: LandmarkExploreViewModel
    
    var filteredLandmarks: [LandmarkModel] {
        viewModel.landmarkList.filter { landmark in
            (!viewModel.showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                
                Toggle(isOn: $viewModel.showFavoritesOnly) {
                    Text("Favourites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .task { viewModel.loadLandmarkList() }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
