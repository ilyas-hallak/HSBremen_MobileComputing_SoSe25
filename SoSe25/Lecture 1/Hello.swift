//
//  Hello.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 23.04.25.
//

import SwiftUI

struct Hello: View {
    var body: some View {
        Image(systemName: "person.circle")
        Text("Hello, World!")            
    }
}

#Preview {
    Hello()
}


class CustomStack {
    init(action: () -> Void) {
        print("button")
    }
}

func createStack() -> CustomStack {
    CustomStack {
        print("created")
    }
}

func createStack2() -> CustomStack {
    return CustomStack(action: {
        print("created2")
    })
}


