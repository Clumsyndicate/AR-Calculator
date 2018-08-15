//
//  GraphViewController.swift
//  AR Calculator
//
//  Created by Johnson Zhou on 06/07/2018.
//  Copyright © 2018 Johnson Zhou. All rights reserved.
//

import UIKit
import ARKit

class GraphViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showWorldOrigin]
        
        
        
    }
    
    fileprivate var toEstablishCoordinateSystem: Bool = false
    
    @IBAction func establishSys(_ sender: UIButton) {
        toEstablishCoordinateSystem = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Set plane detection mode
        configuration.planeDetection = [.horizontal, .vertical]
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    @IBInspectable
    var axisLength: Double = 0.5
    
    @IBInspectable
    var lineRadius: CGFloat = 0.01
    
    // Override to create and configure nodes for anchors added to the view's session.
    
    var previousNode: SCNNode?
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let pointOfView = sceneView.pointOfView else { return }
        
        if toEstablishCoordinateSystem {
            
            previousNode?.removeFromParentNode()
            
            let position = SCNVector3(pointOfView.simdWorldFront)
            print(position)
            
            
            
            let parent_node = SCNNode()
            
            //
            
            let cyl = SCNCylinder(radius: lineRadius, height: 1.0)
            let cyl_node_x = SCNNode(geometry: cyl)
            cyl_node_x.position = position
            
            cyl_node_x.geometry?.materials.first?.diffuse.contents = UIColor.orange
            
            parent_node.addChildNode(cyl_node_x)
            
            
            let cyl_y = SCNCylinder(radius: lineRadius, height: 1.0)
            let cyl_node_y = SCNNode(geometry: cyl_y)
            cyl_node_y.position = position
            cyl_node_y.rotation = SCNVector4(1, 0, 0, Double.pi / 2)
            cyl_node_y.geometry?.materials.first?.diffuse.contents = UIColor.green
            parent_node.addChildNode(cyl_node_y)
            
            let cyl_z = SCNCylinder(radius: lineRadius, height: 1.0)
            let cyl_node_z = SCNNode(geometry: cyl_z)
            cyl_node_z.position = position
            cyl_node_z.rotation = SCNVector4(0, 0, 1, Double.pi / 2)
            cyl_node_z.geometry?.materials.first?.diffuse.contents = UIColor.red
            parent_node.addChildNode(cyl_node_z)
            
            drawFunction(scene: scene, parentNode: parent_node, location: position)
            
            
            
            scene.rootNode.addChildNode(parent_node)

            previousNode = parent_node
            
            
            toEstablishCoordinateSystem = false
        }
    }
    
    
    fileprivate func drawFunction(scene: SCNScene, parentNode: SCNNode, location: SCNVector3) {
        
        let function  = SCNCylinder(radius: lineRadius, height: 1.0)
        function.materials.first?.diffuse.contents = UIColor.purple
        let funcNode = SCNNode(geometry: function)
        
        guard let offsetOfStartingPoint = startingPoint else {
            return
        }
        
        funcNode.position = location + offsetOfStartingPoint
        
        funcNode.simdRotate(by: rotation, aroundTarget: funcNode.simdPosition)
        
        parentNode.addChildNode(funcNode)
    }
    
    var a, b, c, x, y, z: Double!
    var startingPoint: SCNVector3!
    var rotation: simd_quatf!  // Euler's Angle
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        let alertvc = UIAlertController(title: "An error has occured!", message: "Please restart the app", preferredStyle: .alert)
        present(alertvc, animated: true, completion: nil)
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SCNVector3 {
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3Make(left.x + right.x , left.y + right.y, left.z + right.z)
    }
}
