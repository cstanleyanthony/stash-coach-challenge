// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

protocol CoachPresenterInputable {
    var view: CoachPresenterOutputable? { get set }
    var interactor: CoachInteractorInputable? { get set }
    var router: CoachRoutable? { get set }
    func viewDidLoad()
    func getItemCount() -> Int
    func getItem(atIndex index: Int) -> Achievement?
    func getLevel(atIndex index: Int) -> String?
    func getImageData(atIndex index: Int) -> Data?
    
}
