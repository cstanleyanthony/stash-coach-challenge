// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

protocol CoachPresenterInputable {
    var interactorInput: CoachInteractorInputable? { get set }
    func viewDidLoad()
    func getItemCount() -> Int
    func getItem(atIndex index: Int) -> Achievement?
    func getLevel(atIndex index: Int) -> String?
    func getImageData(atIndex index: Int) -> Data?
    
}
