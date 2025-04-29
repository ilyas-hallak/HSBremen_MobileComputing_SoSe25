//
//  FetchParskUseCase.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

class FetchParskUseCase {
    
    var repository: ParkRepository
    
    init(repository: ParkRepository) {
        self.repository = repository
    }
    
    func fetchParks() {
        repository.fetchAllParks()
    }
}
