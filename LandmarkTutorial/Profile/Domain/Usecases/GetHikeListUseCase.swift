//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

class GetHikeListUseCase {
    let repository: HikeRepositoryProtocol
    
    init(repository: HikeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [HikeEntity] {
        return try await repository.fetchHikeList(limit: limit, offset: offset)
    }
}
