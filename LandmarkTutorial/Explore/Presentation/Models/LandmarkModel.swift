//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation
import MapKit
import SwiftUI

struct LandmarkModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool

    var category: Category
    enum Category: String, Codable, CaseIterable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    //Image handling
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    //Location Coordinates handling
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    init(id: Int, name: String, park: String, state: String, description: String, isFavorite: Bool, isFeatured: Bool, category: Category, imageName: String, coordinates: Coordinates) {
        self.id = id
        self.name = name
        self.park = park
        self.state = state
        self.description = description
        self.isFavorite = isFavorite
        self.isFeatured = isFeatured
        self.category = category
        self.imageName = imageName
        self.coordinates = coordinates
    }
    
    init(from landmarkEntity: LandmarkEntity) {
        self.id = landmarkEntity.id
        self.name = landmarkEntity.name
        self.park = landmarkEntity.park
        self.state = landmarkEntity.state
        self.description = landmarkEntity.description
        self.isFavorite = landmarkEntity.isFavorite
        self.isFeatured = landmarkEntity.isFeatured
        self.category = Category(rawValue: landmarkEntity.category) ?? .lakes
        self.imageName = landmarkEntity.imageName
        self.coordinates = Coordinates(latitude: landmarkEntity.coordinates.latitude, longitude: landmarkEntity.coordinates.longitude)
    }
}
