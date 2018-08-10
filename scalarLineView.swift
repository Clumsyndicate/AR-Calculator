//
//  scalarLineView.swift
//  AR Calculator
//
//  Created by Johnson Zhou on 07/08/2018.
//  Copyright © 2018 Johnson Zhou. All rights reserved.
//

import UIKit

@IBDesignable
class scalarLineView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    @IBInspectable
    var firstFracLineX: CGFloat = 10.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var secondFracLineX: CGFloat = 166.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var thirdFracLineX: CGFloat = 291.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var firstFracLength: CGFloat = 80.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var color: UIColor = UIColor.black
    @IBInspectable
    var lineWidth: CGFloat = 3.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    fileprivate func getFracPath(startingpoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startingpoint)
        path.addLine(to: CGPoint(x: startingpoint.x + firstFracLength, y: startingpoint.y))
        path.lineWidth = 4.0
        
        path.lineCapStyle = .round
        
        
        
        return path
        
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        UIColor.black.setStroke()
        getFracPath(startingpoint: CGPoint(x: firstFracLineX, y: bounds.midY)).stroke()
        getFracPath(startingpoint: CGPoint(x: secondFracLineX, y: bounds.midY)).stroke()
        getFracPath(startingpoint: CGPoint(x: thirdFracLineX, y: bounds.midY)).stroke()

    }
    
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.green

        
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
