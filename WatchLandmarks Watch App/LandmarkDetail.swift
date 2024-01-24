//
// WatchLandmarks Watch App
// Created by Chetan Aggarwal.


import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var viewModel: LandmarkExploreViewModel
    var landmark: LandmarkModel
    
    var landmarkIndex: Int {
        viewModel.landmarkList.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)

                Toggle(isOn: $viewModel.landmarkList[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                Divider()
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                Text(landmark.state)
                    .font(.caption)
                Divider()
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

#Preview {
    return LandmarkDetail(landmark: landmarkItemsForPreview[0])
}
