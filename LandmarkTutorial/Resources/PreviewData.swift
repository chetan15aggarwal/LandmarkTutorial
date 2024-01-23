//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

let landmark1 = LandmarkModel(id: 1, name: "Turtle Rock", park: "Joshua Tree National Park", state: "California", description: "this is the best place to visit", isFavorite: true, isFeatured: true, category: .rivers, imageName: "turtlerock", coordinates: LandmarkModel.Coordinates(latitude: -116.166868, longitude: 34.011286))

let landmark2 = LandmarkModel(id: 2, name: "Silver Salmon Creek", park: "Joshua Tree National Park", state: "California", description: "this is the best place to visit", isFavorite: false, isFeatured: false, category: .lakes, imageName: "silversalmoncreek", coordinates: LandmarkModel.Coordinates(latitude: -152.665167, longitude: 59.980167))
let landmarkItemsForPreview = [landmark1, landmark2]


let hikeData1 = Hike(from: 1001,
                     name: "1001",
                     distance: 4.5,
                     difficulty: 3,
                     observations: [Hike.Observation(
                        from: 0,
                        elevation: 291.65263635636268..<309.26016677925196,
                        pace: 396.08716481908732..<403.68937873525232,
                        heartRate: 117.16351898665887..<121.95815455919609
                     )])
let hikeItemsForPreview = [hikeData1]
