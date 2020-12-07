// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A URL service enum to build URLs for network requests.
/// - `baseUrl`:  A default base url to be used with the case based paths
/// - `url`:  A computed property that gets built from the case of itself
/// - `url(withBase:path:)`:  A method that can use a different base url and a non case based path,
/// - `url(withBase:)`:  A method to use a different base url with an existing case based path.
enum URLService: String, URLServiceable {
    
    case achievements = "/achievements"
    
    var baseUrl: String {
        return "https://server.stash.com"
    }
    
    var url: URL? {
        return URL(string: baseUrl + self.rawValue)
    }
    
    func url(withBase base: String, path: String) -> URL? {
        return URL(string: base + path)
    }
    
    func url(withBase base: String) -> URL? {
        return URL(string: base + self.rawValue)
    }
}
