//
//  NotesPage.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-16.
//

import SwiftUI

struct NotesPage: View {
    let noteTitle: String
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { index in
                    NavigationLink(destination: NotesTakingPage(notesTakingTitle: "\(index+1)")) {
                        Text("\(index+1)")
                    }
                }
            }
            .navigationTitle(noteTitle)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("5 notes")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "folder.badge.plus")
                            .foregroundStyle(Color("textColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    NotesPage(noteTitle: "Notes 1")
}
