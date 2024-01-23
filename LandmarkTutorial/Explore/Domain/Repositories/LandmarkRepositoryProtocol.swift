//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

protocol LandmarkRepositoryProtocol {
    func fetchLandmarkList(limit: Int, offset: Int) async throws -> [LandmarkEntity]
}
