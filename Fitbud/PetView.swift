//
//  Petv.swift
//  Fitbud
//
//  Created by Joshua Lai on 11/29/24.
//

import SwiftUI
import SpriteKit

struct PetView: View {
    var scene: SKScene {
        let petScene = PetScene(fileNamed: "PetScene") ?? PetScene()
        petScene.scaleMode = .aspectFill
        return petScene
    }
    var body: some View {
        SpriteView(scene: scene)
            .frame(height: UIScreen.main.bounds.height / 3)
            .cornerRadius(25) 
            .shadow(radius: 5)
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
