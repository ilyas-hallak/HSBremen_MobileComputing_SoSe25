//
//  DeleteParskUseCase.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 30.04.25.
//


class DeleteParkUseCase {
    
    var repository: ParkRepository
    
    init(repository: ParkRepository) {
        self.repository = repository
    }
    
    func deletePark(park: Park) {
        repository.delete(park: park)
    }
}
