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
            ParksScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
