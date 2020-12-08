// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A remote data service that makes requests to get the data.
/// A build configuration compiler flag is used to differentiate between the DEBUG and RELEASE configurations.
/// The data can come from either a local JSON file or a remote server sending back JSON data.
class CoachRemoteDataService: CoachRemoteDataServiceInputable {
    
    weak var remoteOutputManager: CoachRemoteDataServiceOutputable?
    
    init(remoteOutputManager: CoachRemoteDataServiceOutputable? = nil) {
        self.remoteOutputManager = remoteOutputManager
    }
    
    /// Fetches achievements from either a local json file or a remote server, depending on the build configuration
    func fetchAchievements() {
        
        #if DEBUG
        fetchLocalJSON() { [weak self] data in
            self?.remoteOutputManager?.fetchedAchievements(data: data)
        }
        #else
        fetchRemoteJSON() { [weak self] data in
            self?.remoteOutputManager?.fetchedAchievements(data: data)
        }
        #endif
    }
    
    func fetchImageResource(fromUrlString url: String, completion: FetchCompletion = nil) {
        
        let loggerCategory = "Remote data service resource fetch"
        LoggerService.log(category: loggerCategory, message: "Fetching a resource")
        
        /// If a completion is provided, use that one, if not use one to send the data back to the output manager.
        fetchData(fromUrl: URL(string: url), completion: completion ?? { [weak self] data in
            self?.remoteOutputManager?.fetchedImage(data: data)
        })
    }
    
    private func fetchLocalJSON(completion: FetchCompletion = nil) {
        
        let loggerCategory = "Remote data service local fetch"
        LoggerService.log(category: loggerCategory,
                          message: "Fetching local JSON file.")
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "achievements",
                                   withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            LoggerService.log(category: loggerCategory,
                              level: .error,
                              message: "Failed to fetch local JSON file.")
            remoteOutputManager?.failureFetchingData()
            return
        }
        
        remoteOutputManager?.fetchedAchievements(data: data)
    }
    
    private func fetchRemoteJSON(completion: FetchCompletion = nil) {
        let loggerCategory = "Remote data service remote fetch"
        LoggerService.log(category: loggerCategory, message: "Fetching remote JSON.")
        
        fetchData(fromUrl: URLService.achievements.url)
    }
    
    /// Fetches data from a remote resource. A private method to be used by internal or extended methods.
    /// - Parameters:
    ///     - fromUrl: A URL optional. The URL will be checked before running task.
    ///     - completion: A completion optional that is used to call back to a method receiving the data. Usually used by a remote output manager
    func fetchData(fromUrl url: URL?, completion: FetchCompletion = nil) {
        
        let loggerCategory = "Remote data service fetch data"
        LoggerService.log(category: loggerCategory,
                          message: "Fetching data for url:",
                          value: "\(String(describing: url))")
        
        guard let url = url
        else {
            LoggerService.log(category: loggerCategory,
                              message: "Failed to create URL")
            remoteOutputManager?.failureFetchingData()
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            
            guard error == nil
            else {
                LoggerService.log(category: loggerCategory,
                                  message: "Fetching remote data request failed with error:",
                                  value: error.debugDescription)
                self?.remoteOutputManager?.failureFetchingData()
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse
            else {
                LoggerService.log(category: loggerCategory,
                                  message: "Fetching remote data failed to initialize data or response.")
                self?.remoteOutputManager?.failureFetchingData()
                return
            }
            
            if response.statusCode == 200 {
                DispatchQueue.main.async {
                    self?.remoteOutputManager?.fetchedData(data: data)
                    completion?(data)
                }
            }
            else {
                LoggerService.log(category: loggerCategory,
                                  message: "Fetching remote data failed with non 200 status code:",
                                  value: "\(response.statusCode)")
                self?.remoteOutputManager?.failureFetchingData()
                return
            }
            
        }.resume()
    }
}
