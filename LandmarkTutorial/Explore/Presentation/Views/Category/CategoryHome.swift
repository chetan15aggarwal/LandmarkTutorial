//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var viewModel: LandmarkExploreViewModel
    
    var body: some View {
        NavigationSplitView {
            List{
                if viewModel.landmarkList.count > 0 {
                    PageView(pages: viewModel.features.map { FeatureCard(landmark: $0) })
                        .listRowInsets(EdgeInsets())
                    
                    ForEach(viewModel.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: viewModel.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    viewModel.showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $viewModel.showingProfile) {
                ProfileHost()
            }
            .task { viewModel.loadLandmarkList() }
        } detail: {
            Text("Select a landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
