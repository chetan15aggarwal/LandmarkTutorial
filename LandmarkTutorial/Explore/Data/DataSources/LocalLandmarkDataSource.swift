//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

class LocalLandmarkDataSource {
    func fetchLandmarkList(limit: Int, offset: Int) async throws -> [LandmarkResponse] {
        let urlString = Constants.localLandmarkLocation
        return LocalUtils.shared.load(urlString)
    }
}
