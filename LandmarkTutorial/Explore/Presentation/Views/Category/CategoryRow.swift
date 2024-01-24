//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [LandmarkModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)

                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    return CategoryRow(
        categoryName: landmarkItemsForPreview[0].category.rawValue,
        items: Array(landmarkItemsForPreview.prefix(2))
    )
}
