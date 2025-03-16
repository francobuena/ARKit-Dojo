import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: String?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelConfirmedForPlacement {
            print("DEBUG: adding model to scene - \(model)")
            
            let fileName = model + ".usdz"
            let modelEntity = try! ModelEntity.loadModel(named: fileName)
            let anchorEntity = AnchorEntity(plane: .any)
            anchorEntity.addChild(modelEntity)
            
            uiView.scene.addAnchor(anchorEntity)
            
            // Reset the model placed on the scene
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
        }
    }
}

