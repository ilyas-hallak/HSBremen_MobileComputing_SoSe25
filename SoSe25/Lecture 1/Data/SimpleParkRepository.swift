//
//  SimpleParkRepository.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 30.04.25.
//

import CoreData

class SimpleParkRepository {
    
    private let context = PersistenceController.shared.container.viewContext
    
    func createParkEntity(name: String) {
        let entitiy = ParkEntity(context: context)
        entitiy.name = name
        try? context.save()
    }
    
    func delete(park: ParkEntity) {
        context.delete(park)
        try? context.save()
    }
}
