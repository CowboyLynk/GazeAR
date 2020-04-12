//
//  CircleView.swift
//  GazeAR
//
//  Created by Cowboy Lynk on 4/12/20.
//  Copyright © 2020 Cowboy Lynk. All rights reserved.
//

import Foundation
import UIKit

class CircleView: UIView {
    var circleLayer: CAShapeLayer!
    let borderWidth: CGFloat = 5

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
//        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = UIColor.clear

        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - borderWidth)/2, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)

        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.systemBlue.cgColor
        circleLayer.lineWidth = borderWidth;

        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0

        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
    }
    
    func updateCircle(progress: CGFloat) {
        circleLayer.strokeEnd = progress
    }
}
