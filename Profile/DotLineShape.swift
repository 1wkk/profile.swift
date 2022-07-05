//
//  DotLineShape.swift
//  Profile
//
//  Created by Eureka on 2022/7/5.
//

import SwiftUI

struct DotLineShape: Shape {
    
    enum LineStyle { case top, full, bottom }
    
    var lineWidth : CGFloat = 10
    var dotDiameter : CGFloat = 30
    var style : LineStyle = .full
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x: rect.midX -  dotDiameter / 2,
                                   y: style == .bottom ? rect.minY + rect.height * 0.1 :
                                    style == .top ? rect.maxY - rect.height * 0.4 : rect.midY - dotDiameter / 2,
                                   width: dotDiameter, height: dotDiameter))
        path.addRect(
            CGRect(
                x: rect.midX - lineWidth / 2,
                y: style == .bottom ? rect.minY + rect.height * 0.1 : rect.minY,
                width: lineWidth,
                height: style == .full ? rect.height : style == .top ? rect.height * 0.6 : rect.height * 0.9
            )
        )
        return path
    }
}

struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 0) {
            DotLineShape(style: .bottom).background(.blue)
            DotLineShape().background(.cyan)
            DotLineShape(style: .top).background(.indigo)
        }
    }
}
