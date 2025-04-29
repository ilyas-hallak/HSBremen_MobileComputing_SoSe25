//
//  CreateParkUseCase.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

class CreateParkUseCase {
    
    var repository: ParkRepository
    
    init(repository: ParkRepository) {
        self.repository = repository
    }
    
    func execute(_ park: Park) {
        self.repository.create(park: park)
    }    
}
