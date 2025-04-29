//
//  Park.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

class Park {
    
    var description: String {
        name.count > 0 ? name : "- no name -"
    }
    
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
}
