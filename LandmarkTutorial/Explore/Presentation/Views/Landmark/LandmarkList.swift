//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var viewModel: LandmarkExploreViewModel
    @State var selectedLandmark: LandmarkModel?

    var filteredLandmarks: [LandmarkModel] {
        viewModel.landmarkList.filter { landmark in
            (!viewModel.showFavoritesOnly || landmark.isFavorite)
            && (viewModel.filter == .all || viewModel.filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = viewModel.filter == .all ? "Landmarks" : viewModel.filter.rawValue
        return viewModel.showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        viewModel.landmarkList.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                    .focusedValue(\.selectedLandmark, $viewModel.landmarkList[index ?? 0])
                }
            }
            #if os(macOS)
            .task { viewModel.loadLandmarkList() }
            #endif
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .navigationTitle("Landmarks")
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $viewModel.filter) {
                            ForEach(LandmarkExploreViewModel.FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $viewModel.showFavoritesOnly) {
                            Text("Favourites Only")
                        }
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
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
