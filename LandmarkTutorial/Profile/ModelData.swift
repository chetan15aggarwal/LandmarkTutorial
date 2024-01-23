//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation
import Combine

class ModelData {
    var hikes: [Hike] = LocalUtils.shared.load("hikeData.json")
    var profile = Profile.default
}
