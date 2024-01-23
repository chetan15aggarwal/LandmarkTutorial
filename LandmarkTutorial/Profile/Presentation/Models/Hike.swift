//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct Hike: Codable, Hashable, Identifiable {
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
        
        init(from entity: HikeEntity.Observation) {
            distanceFromStart = entity.distanceFromStart
            elevation = entity.elevation
            pace = entity.pace
            heartRate = entity.heartRate
        }
        
        init(from distanceFromStart: Double, elevation: Range<Double>, pace: Range<Double>, heartRate: Range<Double>) {
            self.distanceFromStart = distanceFromStart
            self.elevation = elevation
            self.pace = pace
            self.heartRate = heartRate
        }
    }
    
    init(from hikeEntity: HikeEntity) {
        id = hikeEntity.id
        name = hikeEntity.name
        distance = hikeEntity.distance
        difficulty = hikeEntity.difficulty
        observations = hikeEntity.observations.map { Observation(from: $0) }
    }

    init(from id: Int, name: String, distance: Double, difficulty: Int, observations: [Observation]) {
        self.id = id
        self.name = name
        self.distance = distance
        self.difficulty = difficulty
        self.observations = observations
    }
}
