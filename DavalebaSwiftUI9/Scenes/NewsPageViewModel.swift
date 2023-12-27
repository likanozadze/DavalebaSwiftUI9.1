//
//  NewsPageViewModel.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import SwiftUI

final class NewsPageViewModel: ObservableObject {
   @Published var articles: [Article] = []
    var error: String?

    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: - Network Call
    
    func fetchNews() {
     
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0cd6dcb5ba864105afee3a7a7c44e9d6"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: NewsResponse.self, completion: { result in
            switch result {
            case .success(let data):
                self.articles = data.articles
               // print("Data fetched successfully: \(data)")
            case .failure(let error):
               // print("Error fetching data: \(error)")
                self.error = error.localizedDescription
            }
        })
    }
    
}
