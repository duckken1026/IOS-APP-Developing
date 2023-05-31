//
//  ContentView.swift
//  ARkitPractice
//
//  Created by 鄭傳脩 on 2023/5/26.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let anchor = AnchorEntity(plane: .horizontal)
        let boxMaterial = SimpleMaterial(color: .red, isMetallic: false)
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.1),materials: [boxMaterial])
        anchor.addChild(box)
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
