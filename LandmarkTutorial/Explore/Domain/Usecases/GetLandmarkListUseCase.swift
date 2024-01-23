//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

class GetLandmarkListUseCase {
    let landmarkRepository: LandmarkRepositoryProtocol
    
    init(landmarkRepository: LandmarkRepositoryProtocol) {
        self.landmarkRepository = landmarkRepository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [LandmarkEntity] {
        return try await landmarkRepository.fetchLandmarkList(limit: limit, offset: offset)
    }
}
