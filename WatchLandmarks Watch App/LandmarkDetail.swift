//
// WatchLandmarks Watch App
// Created by Chetan Aggarwal.


import SwiftUI

struct LandmarkDetail: View {
        
    var landmark: LandmarkModel
    
    //TODO: Check how to pass the integer here
    var landmarkIndex: Int {
        return 1
        //modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        //TODO: This will update the value
        //check how to implement through model
//        @ObservedObject var modelData = modelData
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)

//                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
//                    Text("Favorite")
//                }
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
