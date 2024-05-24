//
//  QuoteData.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-16.
//

import Foundation

struct QuoteData: Decodable, Hashable {
    let content: String
    let author: String
    let tags: [String]
}

class QuoteFetcher: ObservableObject {
    @Published var quoteData: QuoteData?
    @Published var errorMessage: String?
    @Published var multipleQuotes: [QuoteData?] = []
    
    init() {
        fetchMultipleQuotes()
    }
    
    func fetchMultipleQuotes() {
        for _ in 0..<5 {
            guard let url = URL(string: "https://api.quotable.io/random") else {
                errorMessage = "Invalid URL"
                return
            }
            
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self.errorMessage = "No data received"
                    }
                    return
                }
                
                do {
                    let quote = try JSONDecoder().decode(QuoteData.self, from: data)
                    DispatchQueue.main.async {
                        self.multipleQuotes.append(quote)
                        self.quoteData = self.multipleQuotes[0]
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error decoding data: \(error.localizedDescription)"
                    }
                }
            }.resume()
        }
    }
}
