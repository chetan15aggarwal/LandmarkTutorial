//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct LandmarkResponse: Codable {
    var name: String
    var category: String
    var city: String
    var state: String
    var id: Int
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var coordinates: CoordinateResponse
    var description: String
    var imageName: String
}

struct CoordinateResponse: Codable {
    var longitude: Double
    var latitude: Double
}
