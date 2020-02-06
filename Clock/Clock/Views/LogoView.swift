//
//  LogoView.swift
//  Clock
//
//  Created by John Holowesko on 2/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

@IBDesignable
class LogoView: UIView {
    let color: UIColor = UIColor.red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let innerRect = rect.insetBy(dx: 40, dy: 20)

        let oneThirdOfWidth: CGFloat = ceil(innerRect.width / 3.0)
        let twoThirdsOfHeight: CGFloat = ceil(innerRect.height * 2.0 / 3.0)
        let legWidth: CGFloat = 20.0
        
        //First Leg
        
        let firstLegRect = CGRect(x: 0.0,
                                  y: innerRect.height - twoThirdsOfHeight,
                                  width: oneThirdOfWidth,
                                  height: twoThirdsOfHeight)
        
        self.drawNoteLegPath(rect: firstLegRect, legWidth: legWidth, context: context)
        
        //Second Leg
        
        let secondLegRect = CGRect(x: oneThirdOfWidth * 2.0,
                                   y: 0.0,
                                   width: oneThirdOfWidth,
                                   height: twoThirdsOfHeight)
        
        self.drawNoteLegPath(rect: secondLegRect, legWidth: legWidth, context: context)
        
        //Top
        let lineWidth: CGFloat = legWidth
        
        context.beginPath()
        context.setStrokeColor(color.cgColor)
        context.setLineWidth(lineWidth)
        context.move(to: CGPoint(x: oneThirdOfWidth - legWidth * 2.0 / 3.0, y: innerRect.height - twoThirdsOfHeight))
        context.addLine(to: CGPoint(x: innerRect.size.width - legWidth * 2.0 / 3.0, y: 0.0))
        context.strokePath()
    }
    
    private func drawNoteLegPath(rect: CGRect, legWidth: CGFloat, context: CGContext) {
        let rectForCircle: CGRect = CGRect(x: rect.origin.x + 0.0,
                                           y: rect.origin.y + rect.size.height - rect.size.width,
                                           width: rect.size.width,
                                           height: rect.size.width)
        
        let legWidth: CGFloat = legWidth
        
        let rectForLeg: CGRect = CGRect(x: rect.origin.x + rect.size.width - legWidth,
                                        y: rect.origin.y + 0.0,
                                        width: legWidth,
                                        height: rect.size.height - rect.size.width / 2.0)
        
        context.beginPath()
        context.addEllipse(in: rectForCircle)
        context.addRect(rectForLeg)
        context.setFillColor(color.cgColor)
        context.fillPath()
    }
}
