//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct HikeRepository: HikeRepositoryProtocol {
    static let shared = HikeRepository()
    private let hikeDataSource = LocalHikeDataSource()
    
    func fetchHikeList(limit: Int, offset: Int) async throws -> [HikeEntity] {
        let hikeList = try await hikeDataSource.fetchHikeData(limit: limit, offset: offset)
        let hikeEntities = hikeList.compactMap { hike in
            return HikeEntity(from: hike)
        }
        return hikeEntities
    }
}
