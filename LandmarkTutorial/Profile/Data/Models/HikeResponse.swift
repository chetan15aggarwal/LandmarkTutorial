//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct HikeResponse: Codable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    struct Observation: Codable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
