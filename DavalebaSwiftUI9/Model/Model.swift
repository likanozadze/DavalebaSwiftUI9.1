//
//  Model.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import Foundation

// MARK: - NewsResponse

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source

struct Source: Decodable {
    let id: String?
    let name: String
}
