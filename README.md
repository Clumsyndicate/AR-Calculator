# AR-Calculator

The AR Calculator is an iOS application that graphs lines and planes in the 3D space that ARKit provides to intuitively view the different 3d equations. It takes equations of both scalar and vector form.

## Installation

Intall Xcode IDE on MacOS. Clone this project and open AR-Calculator.xcodeproj. You will have to provide your own personal developer license to run the project.

## Understanding the workings of the AR Calculator

### Draw a line from a scalar equation in 3D space

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{x-x_0}{a}=\frac{y-y_0}{b}=\frac{z-z_0}{c}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{x-x_0}{a}=\frac{y-y_0}{b}=\frac{z-z_0}{c}" title="\frac{x-x_0}{a}=\frac{y-y_0}{b}=\frac{z-z_0}{c}" /></a>

The above equation is the scalar form of a line in 3-dimensional Cartesian coordinate system. The user will input six parameters, and AR Calculator will graph the line in an AR-simulated coordinate system.

## Basics of ARKit

Starting to play with ARKit is simple. In Xcode, choose *Create a new Project* and *Augmented Reality App*. The bare bone structure will be set up for you. The hierarchy of an ARKit app is ViewController > ARSceneView (can be configured by WorldConfiguration) > Scene.rootNode > SCNNodes > SCNGeometry. Just create Nodes with the geometry you want, and then add them to the rootNode of the Scene. 

### Drawing the coordinate axes

The three axes are drawn with geometries as SCNCylinder. The default cylinder is upright, which is the y axis in the ARSceneView. So the x axis and the z axis are simply rotated 90 degrees in their respective directions. 

### Drawing the line 
