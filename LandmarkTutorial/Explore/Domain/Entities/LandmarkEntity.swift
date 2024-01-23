//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation
import MapKit
import SwiftUI

struct LandmarkEntity: Codable, Identifiable {
    
    struct CoordinateEntity: Codable {
        var longitude: Double
        var latitude: Double
    }
    
    var name: String
    var category: String
    var city: String
    var state: String
    var id: Int
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var coordinates: CoordinateEntity
    var description: String
    var imageName: String
    
    init(from landmarkResponse: LandmarkResponse) {
        name = landmarkResponse.name
        category = landmarkResponse.category
        city = landmarkResponse.city
        state = landmarkResponse.state
        id = landmarkResponse.id
        isFeatured = landmarkResponse.isFeatured
        isFavorite = landmarkResponse.isFavorite
        park = landmarkResponse.park
        coordinates = CoordinateEntity(longitude: landmarkResponse.coordinates.longitude, latitude: landmarkResponse.coordinates.latitude)
        description = landmarkResponse.description
        imageName = landmarkResponse.imageName
    }
}


