//
//  Introduction.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-15.
//

import SwiftUI

struct Introduction: View {
    @AppStorage("first_time") var firstTime: Bool = true
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(pages) { page in
                    VStack {
                        SinglePage(page: page)
                        pages.last == page ?
                        NavigationLink(destination: HomePage().navigationBarBackButtonHidden()) {
                            Button {
                                firstTime = false
                            } label: {
                                Text("Start")
                                    .foregroundStyle(Color("textColor"))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding()
                            }
                        }
                        : nil
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

#Preview {
    Introduction()
}
