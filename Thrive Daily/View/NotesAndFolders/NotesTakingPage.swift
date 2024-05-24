//
//  NotesTakingPage.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-17.
//

import SwiftUI

struct NotesTakingPage: View {
    let notesTakingTitle: String
    @State var title: String = ""
    @State var bodyText: String = ""
    @FocusState private var focusField: Field?
    enum Field: Int, Hashable {
        case title, body
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $bodyText)
                    .focused($focusField, equals: .body)
                    .padding(.horizontal, 10)
            }
            .navigationTitle(notesTakingTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    NotesTakingPage(notesTakingTitle: "1st Note")
}
