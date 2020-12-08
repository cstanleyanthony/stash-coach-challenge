// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

class CoachInteractor: CoachInteractorInputable, CoachRemoteDataServiceOutputable {
    
    var remoteDataService: CoachRemoteDataServiceInputable?
    var localDataService: CoachLocalDataServiceInputable?
    
    weak var presenter: CoachInteractorOutputable?
    
    private var achievements = [Achievement]()
    private var overview: OverviewItems?
    
    init(remoteDataService: CoachRemoteDataServiceInputable? = nil,
         localDataService: CoachLocalDataServiceInputable? = nil,
         presenter: CoachInteractorOutputable? = nil) {
        
        self.remoteDataService = remoteDataService
        self.presenter = presenter
    }
    
    func fetchAchievements() {
        remoteDataService?.fetchAchievements()
    }
    
    func failureFetchingData() {
        presenter?.failedFetchingAchievements()
    }
    
    /// Receives the raw data from a data service. Can be used when a dedicated method to fetch data is not needed.
    /// - Description: Use this method when fetching a one off chunk of data and can parse it manually.
    func fetchedData(data: Data) {
        
    }
     
    /// Runtime O(n + n + n)
    func fetchedAchievements(data: Data) {
        let loggerCategory = "Interactor fetched data decode"
        do {
            let achievements = try JSONDecoder().decode(Achievements.self, from: data)
            let levelFiltered = achievements.achievements.filter{ Int($0.level) != nil }
            self.achievements = levelFiltered.sorted { Int($0.level)! < Int($1.level)! }
            for (index, achievement) in self.achievements.enumerated() {
                if achievement.imageData == nil {
                    fetchImge(atIndex: index)
                }
            }
            presenter?.fetchedAchievements()
        }
        catch let err {
            LoggerService.log(category: loggerCategory, message: "Failed to decode achievements data:", value: err.localizedDescription)
            presenter?.failedFetchingAchievements()
        }
        
        do {
            let overview = try JSONDecoder().decode(Overview.self, from: data)
            self.overview = overview.overview
        }
        catch let err {
            LoggerService.log(category: loggerCategory, message: "Failed to decode overview data:", value: err.localizedDescription)
        }
    }
    
    func fetchTitle() -> String? {
        return overview?.title
    }
    
    func fetchedImage(data: Data) {
        // Handle image directly if desired.
    }
    
    func achievementsCount() -> Int {
        return achievements.count
    }
    
    func getImageData(atIndex index: Int) -> Data? {
        return achievements[index].imageData
    }
    
    func getAllAchievements() -> [Achievement] {
        return self.achievements
    }
    
    func achievement(forIndex index: Int) -> Achievement? {
        guard checkIndexInBounds(index)
        else {
            return nil
        }
        return achievements[index]
    }
    
    func fetchImge(atIndex index: Int) {
        if let achievement = self.achievement(forIndex: index) {
            remoteDataService?.fetchImageResource(fromUrlString: achievement.imageUrl) { [weak self] data in
                self?.achievements[index].imageData = data
                self?.presenter?.fetchedAchievements()
            }
        }
    }
    
    private func checkIndexInBounds(_ index: Int) -> Bool {
        return index >= 0 && index < achievements.count
    }
    
}
