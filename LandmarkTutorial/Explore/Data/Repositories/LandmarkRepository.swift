//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct LandmarkRepository: LandmarkRepositoryProtocol {
    static let shared = LandmarkRepository()
    private let landmarkDataSource = LocalLandmarkDataSource()
    
    func fetchLandmarkList(limit: Int, offset: Int) async throws -> [LandmarkEntity] {
        let landmarks = try await landmarkDataSource.fetchLandmarkList(limit: limit, offset: offset)
        let landmarkEntities = landmarks.compactMap { landmark in
            return LandmarkEntity(from: landmark)
        }
        return landmarkEntities
    }
}
