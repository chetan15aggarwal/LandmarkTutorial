//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct ExploreModule {
    func provideExploreDataSource() -> LocalLandmarkDataSource {
        //pass the network service object if required to the datasource through constructor
        return LocalLandmarkDataSource()
    }
    
    func provideExploreRepository(_ datasource: LocalLandmarkDataSource) -> LandmarkRepositoryProtocol {
        return LandmarkRepository(landmarkDataSource: datasource)
    }
    
    func provideExploreUseCase(_ repository: LandmarkRepositoryProtocol) -> GetLandmarkListUseCase {
        return GetLandmarkListUseCase(landmarkRepository: repository)
    }
    
    @MainActor
    func provideExploreViewModel() -> LandmarkExploreViewModel {
        let datasource = provideExploreDataSource()
        let repository = provideExploreRepository(datasource)
        let useCase = provideExploreUseCase(repository)
        return LandmarkExploreViewModel(useCase)
    }
}
