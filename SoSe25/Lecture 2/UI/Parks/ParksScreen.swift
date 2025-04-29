//
//  ParksView.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

import SwiftUI
import CoreData

struct ParksScreen: View {
    
    // MARK: States
    
    @State private var showingAlert = false
    @State private var inputText = ""
    @State private var counter: Int = 0
    
    // MARK: ViewModel
    
    private var viewModel = ParksViewModel()
    
    // MARK: Database
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ParkEntity.name, ascending: true)],
        animation: .default)
    private var parks: FetchedResults<ParkEntity>
    
    // MARK: ViewCycle
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(parks, id: \.self) { park in
                    Text(park.name ?? "-")
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .alert("Create Park", isPresented: $showingAlert) {
                Alert()
            }
            .task {
                counter = await viewModel.fetchParksHeavyLoading().count
            }
            .onAppear {
                viewModel.fetchParks()
            }.navigationTitle(viewModel.title)
            
            if counter == 0 {
                Text("data loading...")
            } else {
                Text("heavy loading data: \(counter)")
            }
        }
    }
    
    @ViewBuilder
    private func Alert() -> some View {
        TextField("TextField", text: $inputText)
        Button("OK", role: .cancel) {
            viewModel.createPark(name: inputText)
        }
    }
}

#Preview {
    ParksScreen()
}
