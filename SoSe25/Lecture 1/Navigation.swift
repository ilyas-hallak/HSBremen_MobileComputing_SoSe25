//
//  Navigation.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 24.04.25.
//

import SwiftUI

struct Navigation: View {
    
    @State private var parks: [ParkItem] = [
        ParkItem(name: "Yosemite"),
        ParkItem(name: "Grand Canyon"),
        ParkItem(name: "Yellowstone"),
    ]
    
    var body: some View {
        NavigationStack {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationTitle("Parks")
            .navigationDestination(for: ParkItem.self) { park in
                ParkDetails(park: park)
            }
        }
    }
}

struct ParkDetails: View {
    let park: ParkItem
    
    var body: some View {
        Text(park.name)
    }
}

#Preview {
    Navigation()
}

class ParkItem: Identifiable {
    let id = UUID()
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


extension ParkItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: ParkItem, rhs: ParkItem) -> Bool {
        lhs.id == rhs.id
    }
}
