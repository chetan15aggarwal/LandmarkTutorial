//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct HikeEntity : Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        
        init(from response: HikeResponse.Observation) {
            distanceFromStart = response.distanceFromStart
            elevation = response.elevation
            pace = response.pace
            heartRate = response.heartRate
        }
    }
    
    init(from response: HikeResponse) {
        id = response.id
        name = response.name
        distance = response.distance
        difficulty = response.difficulty
        observations = response.observations.map { Observation(from: $0) }
    }
}
