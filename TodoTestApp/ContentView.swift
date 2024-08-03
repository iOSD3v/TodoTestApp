//
//  ContentView.swift
//  TodoTestApp
//
//  Created by Fahimah on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [String] = [
        "go to gym",
        "warm up",
        "tredmill",
        "bike",
        "bolgarian lounge",
        "squat",
        "deadlift",
    ]
    func addItem() {
        todos.append(newItem)
        newItem = ""
    }
    
    @State var showingAlert = false
    @State var newItem = ""
    
    var body: some View {
        
        NavigationStack {
            List($todos, id: \.self, editActions: .all) { $item in
                Text(item)
            }
            .navigationTitle("My To-do List")
            .navigationBarItems(
                trailing: Button(action: {
                    showingAlert = true
                }, label: {
                    Text("Add")
                })
            )
            
        }.alert("what are you gonna do?", isPresented: $showingAlert) {
            TextField("write here", text: $newItem)
            Button(action: {
                addItem()
            }, label: {
                Text("OK")
            })
                
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
