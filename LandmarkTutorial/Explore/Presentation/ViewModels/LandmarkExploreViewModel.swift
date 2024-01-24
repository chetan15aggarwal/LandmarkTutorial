//
// LandmarkTutorial
// Created by Chetan Aggarwal.


import Foundation

@MainActor
class LandmarkExploreViewModel: ObservableObject {
    
    //Use case
    private let getLandmarkUseCase: GetLandmarkListUseCase
    
    init(_ useCase: GetLandmarkListUseCase) {
        getLandmarkUseCase = useCase
    }
    
    //Publish objects for Categories
    @Published var landmarkList: [LandmarkModel] = [LandmarkModel]()
    @Published var offset: Int = 20
    @Published var showingProfile = false
    
    //Publish objects for Listing
    @Published var showFavoritesOnly = false
    @Published var filter = FilterCategory.all
    @Published var selectedLandmark: LandmarkModel?
        
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        var id: FilterCategory { self }
    }
    
    //Computed properties
    var categories: [String: [LandmarkModel]] {
        Dictionary(grouping: landmarkList, by: {$0.category.rawValue})
    }
    
    var features: [LandmarkModel] {
        landmarkList.filter { $0.isFeatured }
    }
    
    //Methods
    func handleOnAppear(landmark: LandmarkModel) {
        guard landmarkList.last == landmark else { return }
        loadLandmarkList()
    }
    
    func loadLandmarkList() {
        Task {
            do {
                let landmarkEntityList = try await getLandmarkUseCase.execute(limit: 20, offset: offset)
                landmarkList += landmarkEntityList.compactMap({ landmark in LandmarkModel(from: landmark) })
                increaseOffset(value: Constants.pokeApiLandmarkListlimit)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func increaseOffset(value: Int) {
        offset += value
    }
}
