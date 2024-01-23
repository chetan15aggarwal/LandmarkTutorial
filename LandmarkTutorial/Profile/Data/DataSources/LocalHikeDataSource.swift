//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

class LocalHikeDataSource {
    func fetchHikeData(limit: Int, offset: Int) async throws -> [HikeResponse] {
        let urlString = Constants.localHikeDataLocation
        return LocalUtils.shared.load(urlString)
    }
}
