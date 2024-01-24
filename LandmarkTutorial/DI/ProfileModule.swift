//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

struct ProfileModule {
    func provideHikeDataSource() -> LocalHikeDataSource {
        //pass the network service object if required to the datasource through constructor
        return LocalHikeDataSource()
    }
    
    func provideHikeRepository(_ datasource: LocalHikeDataSource) -> HikeRepositoryProtocol {
        return HikeRepository(datasource)
    }
    
    func provideHikeUseCase(_ repository: HikeRepositoryProtocol) -> GetHikeListUseCase {
        return GetHikeListUseCase(repository: repository)
    }
    
    @MainActor
    func provideProfileViewModel() -> ProfileViewModel {
        let datasource = provideHikeDataSource()
        let repository = provideHikeRepository(datasource)
        let useCase = provideHikeUseCase(repository)
        return ProfileViewModel(useCase)
    }
}
