//
//  GradientHelper.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

final class GradientGelper {
    static func get(frame: CGRect) -> CAGradientLayer {
     // let colors = getGradientColors()
      //let cgColors = colors.map { $0.cgColor}

      let gradient = CAGradientLayer()

      gradient.startPoint = GradientPoint.topRight.point
      gradient.endPoint = GradientPoint.bottomLeft.point
      gradient.drawsAsynchronously = true
      //gradient.colors = cgColors
      gradient.frame = frame
      return gradient
    }

//    private static func getGradientColors() -> [UIColor] {
//        return [WaveView.color, .white]
//    }
}

private enum GradientPoint: Int {
    case left
    case top
    case right
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight

    var point: CGPoint {
        switch self {
        case .left: return CGPoint(x: 0.0, y: 0.5)
        case .top: return CGPoint(x: 0.5, y: 0.0)
        case .right: return CGPoint(x: 1.0, y: 0.5)
        case .bottom: return CGPoint(x: 0.5, y: 1.0)
        case .topLeft: return CGPoint(x: 0.0, y: 0.0)
        case .topRight: return CGPoint(x: 1.0, y: 0.0)
        case .bottomLeft: return CGPoint(x: 0.0, y: 1.0)
        case .bottomRight: return CGPoint(x: 1.0, y: 1.0)
        }
    }
}
