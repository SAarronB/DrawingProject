//
//  DrawingView.swift
//  DrawingProject
//
//  Created by Bonilla, Sean on 11/1/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class DrawingView : UIView
{

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) -> Void {
        createStickFigure().stroke()
        drawTurtle1()
        drawTurtle2()
    }
    
    private func createStickFigure() -> UIBezierPath
    {
        let figure : UIBezierPath = UIBezierPath()
        UIColor.red.setStroke()
        figure.lineWidth = 3.0
        figure.addArc(withCenter: CGPoint(x: 200, y: 200),
                      radius: CGFloat(20),
                      startAngle: CGFloat(0),
                      endAngle: CGFloat(2) * CGFloat.pi,
                      clockwise: true)
        figure.move(to: CGPoint(x: 200, y: 220))
        figure.addLine(to: CGPoint(x: 200, y: 270))
        figure.move(to: CGPoint(x: 180, y: 240))
        figure.addLine(to: CGPoint(x: 220, y: 240))
        figure.move(to: CGPoint(x: 200, y: 270))
        figure.addLine(to: CGPoint(x: 180, y: 300))
        figure.move(to: CGPoint(x: 200, y: 270))
        figure.addLine(to: CGPoint(x: 220, y: 300))
        return figure
    }
    
    private func drawTurtle1() -> Void
    {
        let logo = UIBezierPath()
        UIColor.white.setFill()
        logo.move(to: CGPoint(x:50, y: 250))
        logo.addLine(to: CGPoint(x: 100, y: 300))
        logo.addLine(to: CGPoint(x: 50, y: 300))
        logo.close()
        logo.fill()
    }
    
    private func drawTurtle2() -> Void
    {
        let logo = UIBezierPath()
        UIColor.black.setFill()
        logo.move(to: CGPoint(x:200, y: 250))
        logo.addLine(to: CGPoint(x: 50, y: 400))
        logo.addLine(to: CGPoint(x: 100, y: 300))
        logo.close()
        logo.fill()
    }

}
