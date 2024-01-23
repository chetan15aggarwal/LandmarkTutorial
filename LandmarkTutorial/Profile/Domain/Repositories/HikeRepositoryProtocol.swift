//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

protocol HikeRepositoryProtocol {
    func fetchHikeList(limit: Int, offset: Int) async throws -> [HikeEntity]
}
