//
//  Quotes.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Quotes: View {
    @EnvironmentObject private var quoteFetcher: QuoteFetcher
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if quoteFetcher.multipleQuotes.isEmpty {
                    ProgressView()
                } else {
                    GeometryReader { geo in
                        ScrollView {
                            ForEach(quoteFetcher.multipleQuotes, id: \.self) { quote in
                                
                                Group {
                                    Quote(tags: quote?.tags, quote: quote?.content, author: quote?.author, isLiked: false)
                                }
                                .padding(.bottom, 20)
                                .padding(.top, 20)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Quotes")
            .navigationBarTitleDisplayMode(.inline)
            .modifier(DismissButton())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                Text("Double tap to like a quote.")
                    .presentationDetents([.fraction(0.1)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    Quotes()
        .environmentObject(ColorViewModel())
        .environmentObject(QuoteFetcher())
}
