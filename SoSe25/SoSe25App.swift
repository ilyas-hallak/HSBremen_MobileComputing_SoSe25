//
//  SoSe25App.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 23.04.25.
//

import SwiftUI

@main
struct SoSe25App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {

            // Remove the comment marks from the examples, but only one at a time
            
            // Lecture 1 Examples:
            
            // Hello()
            // Navigation()
            NavigationDB()
            
            
            // Lexture 2 Examples
            
            // ParksScreen()
            
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
