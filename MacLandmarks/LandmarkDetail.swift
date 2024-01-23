//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI
import MapKit

struct LandmarkDetail: View {
    
    @EnvironmentObject var viewModel: LandmarkExploreViewModel
    var landmark: LandmarkModel
    var landmarkIndex: Int {
        viewModel.landmarkList.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
    var body: some View {
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)

                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }

            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $viewModel.landmarkList[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        VStack(alignment: .leading)  {
                            Text(landmark.park)
                            Spacer()
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkItemsForPreview[0])
    }
}
