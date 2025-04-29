//
//  GetParksCount.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//


class GetParksCountUseCase {
// ...
    let repository: ParkRepository
    
    init(repository: ParkRepository) {
        self.repository = repository
    }
    
    func getParksCount() -> Int {
        repository
            .getAllParks()
            .filter { $0.name.count > 0 } // filter empty names
            .count // get count after filter
    }
}
