// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A protocol to be used by local and remote data services for output from the data service.
/// Allows the data service to send the data back to the interactor.
protocol CoachDataServiceOutputProtocol: class {
    func failureFetchingData()
    func fetchedData(data: Data)
}
