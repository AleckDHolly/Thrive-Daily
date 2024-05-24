//
//  DailyQuote.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-16.
//

import SwiftUI

struct DailyQuote: View {
    @EnvironmentObject private var quoteFetcher: QuoteFetcher
    @State private var isLiked: Bool = false
    
    var body: some View {
        VStack {
            if let quoteData = quoteFetcher.quoteData {
                
                Quote(tags: quoteData.tags, quote: quoteData.content, author: quoteData.author, isLiked: false)
                
            } else if let errorMessage = quoteFetcher.errorMessage {
                Text("\(errorMessage)")
                    .font(.title2)
                    .padding()
                    .frame(height: 200)
                    .modifier(QuoteBackground())
            } else {
                ProgressView()
                    .frame(height: 200)
                    .modifier(QuoteBackground())
            }
        }
        
    }
}

#Preview {
    DailyQuote()
        .environmentObject(ColorViewModel())
        .environmentObject(QuoteFetcher())
}
