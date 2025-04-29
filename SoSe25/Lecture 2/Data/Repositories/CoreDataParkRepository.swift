//
//  CoreDataParkRepository.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

import CoreData

class CoreDataParkRepository: ParkRepository {
    
    func fetchAllParksHeavyLoad() async -> [Park] {
        return await withCheckedContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                continuation.resume(returning: self.api.fetchParks())
            }
          }
    }
    
    private var context: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
    
    private let api = ParkAPI()
    
    func fetchAllParks() {
        guard parksAlreadyExist() == false else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let parks = self.api.fetchParks()
            for park in parks {
                self.create(park: park)
            }
        }
    }
    
    func getAllParks() -> [Park] {
        let fetchRequest: NSFetchRequest<ParkEntity> = ParkEntity.fetchRequest()
        let parks = (try? context.fetch(fetchRequest)) ?? []
        
        return parks.map {
            Park(name: $0.name ?? "- no name -")
        }
    }
    
    func create(park: Park) {
        let entity = ParkEntity(context: context)
        entity.name = park.name
        try? context.save()
    }
    
    func delete(park: Park) {
        
    }
    
    private func parksAlreadyExist() -> Bool {
        let parks = getAllParks()
        return parks.count > 2
    }
}
