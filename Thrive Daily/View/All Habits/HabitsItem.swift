//
//  HabitsItem.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-20.
//

import SwiftUI

struct HabitsItem: View {
    @State var checked: Bool = false
    let item: String
    
    var body: some View {
        Button {
            checked.toggle()
        } label: {
            HStack {
                Image(systemName: checked ? "checkmark.circle" : "circle")
                Text(item)
            }
            .padding(.vertical, 4)
            .font(.title2)
            .foregroundStyle(Color("textColor"))
        }
    }
}

#Preview {
    HabitsItem(item: "Item")
}
