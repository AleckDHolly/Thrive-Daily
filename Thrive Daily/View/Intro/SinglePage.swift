//
//  SinglePage.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-15.
//

import SwiftUI
import Lottie

struct SinglePage: View {
    var page: Page
    
    var body: some View {
        VStack {
            LottieView(animation: .named(page.lottie))
                .looping()
                .frame(height: 300)
                
            Text(page.title ?? "")
                .font(.largeTitle)
                .bold()
            
            Text(page.phrase)
                .font(.title)
                .fontWeight(.semibold)
                .padding(5)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SinglePage(page: pages[7])
}
