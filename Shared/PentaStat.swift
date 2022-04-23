//
//  PentaStat.swift
//  funny creature therapy session
//
//  Created by jamie on 4/23/22.
//

import SwiftUI

let PENTA_MIN : Double = 0.0;
let PENTA_MAX : Double = 1.0;

let THETA_DELTA : Double = .pi * 0.4;

struct PentaStat : Shape {
    var stats = [Double](repeating: 1.0, count: 5);
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY);
        let radius = Double.minimum(rect.width / 2, rect.height / 2);
        var res = Path();
        
        var theta = -Double.pi / 2 - THETA_DELTA;
        res.move(to: statToPoint(in: center, in: stats[4] * radius, in: theta));
        for i in 0..<5 {
            res.addLine(to: statToPoint(in: center, in: stats[i % 5] * radius, in: theta));
            theta += THETA_DELTA;
        }
        
        res.closeSubpath()
        
        return res;
    }
    
    /**
     * Converts a stat field to a point.
     * @param rect - bounding rectangle for path
     * @param val - stat val (PENTA\_MIN - PENTA\_MAX)
     * @param theta - angle from 0 to 2PI
     * @returns placed point
     */
    func statToPoint(in center: CGPoint, in radius: Double, in theta: Double) -> CGPoint
     {
         let xOffset = cos(theta) * radius + center.x;
         let yOffset = sin(theta) * radius + center.y;
         
         return CGPoint(x: xOffset, y: yOffset);
    }
}

struct PentaStat_preview: PreviewProvider {
    static var previews: some View {
        var penta = PentaStat();
        penta.stats[1] = 0.315;
        penta.stats[3] = 0.612;
        penta.stats[2] = 0.005;
        
        return ZStack {
            penta
                .fill(Color.green);
            
            ForEach(0..<4) { i in
                penta.scale(CGFloat(i) / 4.0)
                    .stroke(Color.white)
            }
            
            penta
                .stroke(Color.red, lineWidth:16);
        }
        .previewInterfaceOrientation(.portrait)
        
    }
}
