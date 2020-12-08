// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

protocol CoachInteractorInputable {
    var remoteDataService: CoachRemoteDataServiceInputable? { get set }
    var localDataService: CoachLocalDataServiceInputable? { get set }
    var presenter: CoachInteractorOutputable? { get set }
    func fetchAchievements()
    func getAllAchievements() -> [Achievement]
    func achievementsCount() -> Int
    func getImageData(atIndex index: Int) -> Data?
    func achievement(forIndex index: Int) -> Achievement?
    func fetchImge(atIndex index: Int)
    func fetchTitle() -> String?
}
