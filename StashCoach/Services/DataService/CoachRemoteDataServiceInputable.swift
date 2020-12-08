// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A protocol to request data from a remote data service.
protocol CoachRemoteDataServiceInputable: class, CoachDataServiceInputable {
    var remoteOutputManager: CoachRemoteDataServiceOutputable? { get set }
    func fetchImageResource(fromUrlString url: String, completion: FetchCompletion)
    func fetchData(fromUrl url: URL?, completion: FetchCompletion)
}
