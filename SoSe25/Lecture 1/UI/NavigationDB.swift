//
//  Navigation.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 24.04.25.
//

import SwiftUI
import CoreData

struct NavigationDB: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var showingAlert = false
    @State private var inputText = ""
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var parks: FetchedResults<ParkEntity>
    
    private let repository = SimpleParkRepository()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(parks, id: \.self) { park in
                    NavigationLink(park.name ?? "", value: park)
                        .swipeActions(content: {
                            Button(role: .destructive, action: {
                                repository.delete(park: park)
                            }, label: {
                                Image(systemName: "trash")
                            })
                        })
                }
            }
            .navigationTitle("Parks")
            .navigationDestination(for: ParkEntity.self) { park in
                ParkDetailsDB(park: park)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .alert("Important message", isPresented: $showingAlert) {
                Alert()
            }
        }
    }
    
    @ViewBuilder
    private func Alert() -> some View {
        TextField("TextField", text: $inputText)
        Button("OK", role: .cancel) {
            repository.createParkEntity(name: inputText)
        }
    }
    
    
}

struct ParkDetailsDB: View {
    
    let park: ParkEntity
    
    var body: some View {
        Text(park.name ?? "- no name set -")
    }
}
