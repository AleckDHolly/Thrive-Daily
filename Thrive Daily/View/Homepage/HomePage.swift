//
//  HomePage.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-16.
//

import SwiftUI

struct HomePage: View {
    @State var showSideMenu = false
    @State private var selectedMenuItem: SideMenuItems? = nil
    @State private var isFullScreenPresented = false
    @EnvironmentObject var color: ColorViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Quote of the day")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal)
                
                DailyQuote()
                
                List {
                    ForEach(SideMenuItems.allCases, id: \.self) { option in
                        Button {
                            selectedMenuItem = option
                            isFullScreenPresented = true
                        } label: {
                            Label(option.title, systemImage: option.imageName)
                        }
                    }
                }
                .foregroundStyle(Color("textColor"))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .fullScreenCover(item: $selectedMenuItem) { item in
                item.view
            }
            .tint(color.selectedColor)
        }
    }
}

#Preview {
    HomePage()
        .environmentObject(ColorViewModel())
        .environmentObject(QuoteFetcher())
}
