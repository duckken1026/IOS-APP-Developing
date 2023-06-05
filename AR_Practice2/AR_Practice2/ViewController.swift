//
//  ViewController.swift
//  AR_Practice2
//
//  Created by 鄭傳脩 on 2023/6/5.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var faceLabel: UILabel!
    @IBOutlet weak var labelView: UIView!
    var analysis = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelView.layer.cornerRadius = 10
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        guard ARFaceTrackingConfiguration.isSupported else{
            fatalError("faceTrcaking is not working.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARFaceTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
 */
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let faceMesh = ARSCNFaceGeometry(device:sceneView.device!)
        let node = SCNNode(geometry: faceMesh)
        node.geometry?.firstMaterial?.fillMode = .lines
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if let faceAnchor = anchor as? ARFaceAnchor,let faceGeometry = node.geometry as? ARSCNFaceGeometry{
            faceGeometry.update(from: faceAnchor.geometry)
            expression(anchor: faceAnchor)
            DispatchQueue.main.async {
                self.faceLabel.text = self.analysis
            }
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func expression(anchor:ARFaceAnchor){
        let smileLeft = anchor.blendShapes[.mouthSmileLeft]
        let smileRight = anchor.blendShapes[.mouthSmileRight]
        let cheekPuff = anchor.blendShapes[.cheekPuff]
        let browInnerUp = anchor.blendShapes[.browInnerUp]
        let eyeBlinkLeft = anchor.blendShapes[.eyeBlinkLeft]
        self.analysis = ""
        
        if((smileLeft?.decimalValue ?? 0.0) + (smileRight?.decimalValue ?? 0.0)) > 0.9{
            self.analysis = "正在微笑"
        }
        
        if cheekPuff?.decimalValue ?? 0.0 > 0.1 {
            self.analysis = "鼓起臉頰"
        }
        
        if browInnerUp?.decimalValue ?? 0.0 > 0.1{
            self.analysis = "抬起眉毛"
        }
        if eyeBlinkLeft?.decimalValue ?? 0.0 > 0.1{
            self.analysis = "眨左眼"
        }
        
    }
}
