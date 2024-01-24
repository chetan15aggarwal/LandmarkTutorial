//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import SwiftUI

struct CategoryItem: View {
    var landmark: LandmarkModel

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    return CategoryItem(landmark: landmarkItemsForPreview[0])
}
