//
//  Quote.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-18.
//

import SwiftUI

struct Quote: View {
    let tags: [String]?
    let quote: String?
    let author: String?
    @State var isLiked: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("\(tags?.joined(separator: ", ") ?? "")")
                    .italic()
                
                Spacer()
                
                Button {
                    isLiked.toggle()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.title2)
                }
                .foregroundStyle(Color("textColor"))
            }
            .padding(.top)
            .padding(.horizontal)
            
            Text("\"\(quote ?? "")\"")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Text("\(author ?? "")")
                .font(.title3)
                .underline()
                .italic()
                .padding(.trailing)
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .modifier(QuoteBackground())
        .onTapGesture(count: 2) {
            withAnimation {
                isLiked = true
            }
        }
    }
}

#Preview {
    Quote(tags: ["Philosophy", "Friendship"], quote: "I do not care", author: "Aleck", isLiked: true)
        .environmentObject(ColorViewModel())
}
