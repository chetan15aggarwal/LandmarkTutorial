//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    
    private let getHikeUseCase: GetHikeListUseCase
    
    init(_ getHikeUseCase: GetHikeListUseCase) {
        self.getHikeUseCase = getHikeUseCase
    }
    @Published var hikeList: [Hike] = [Hike]()
    @Published var profile = Profile.default
    
    func loadHikeList() {
        Task {
            do {
                let hikeEntityList = try await getHikeUseCase.execute(limit: 20, offset: 20)
                hikeList += hikeEntityList.compactMap({ hike in Hike(from: hike) })
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
