//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Abiodun Osagie on 31/03/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    // MARK: - FUNCTIONS
    
    func save() {
        dump(notes)
    }
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("ADD NEW NOTE", text: $text)
                Button{
                    // 1. Only run the button's action when the text field is not empty
                    guard text.isEmpty == false else { return }
                    
                    // 2. Create a new note item and initialize it with the text value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. Add the new note item to the notes array (append)
                    notes.append(note)
                    // 4. Make the text field empty
                    text = ""
                    // 5. Save the notes (function)
                    save()
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundStyle(.yellow)
                        .font(
                            .system(
                                size: 20,
                                weight: .semibold,
                                design: .rounded
                            )
                        )
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundStyle(.accent)
            }//: HSTACK
            
            Spacer()
            
            Text("\(notes.count)")
        }//: VSTACK
        .navigationTitle("Notes")
        
    }
}


// MARK: - PREVIEW
#Preview {
    ContentView()
}
