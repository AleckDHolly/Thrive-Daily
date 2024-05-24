//
//  Notes.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Notes: View {
    var body: some View {
        NavigationStack {
                VStack {
                    List {
                        NavigationLink(destination: NotesPage(noteTitle: "All notes")) {
                            HStack {
                                Image(systemName: "folder")
                                Text("All notes")
                            }
                        }
                        
                        ForEach(0..<7) { index in
                            NavigationLink(destination: NotesPage(noteTitle: "\(index+1)")) {
                                HStack {
                                    Image(systemName: "folder")
                                    Text("\(index+1)")
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Notes")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .modifier(DismissButton())
                .modifier(BottomBar(count: 8, category: "Folders"))
                .navigationTitle("Folders")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Notes()
}
