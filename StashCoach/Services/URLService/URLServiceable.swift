// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A protocol to be used for a URL service.
/// - Description: Is typically used with an enum where the paths are raw values of the cases.
protocol URLServiceable {
    var baseUrl: String { get }
    var url: URL? { get }
    func url(withBase base: String, path: String) -> URL?
}
