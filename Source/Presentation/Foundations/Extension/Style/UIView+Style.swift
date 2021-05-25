//
//  UIView+Style.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

extension UIView {

  //MARK: - Rounded

  func rounded() {
      self.clipsToBounds = true
      DispatchQueue.main.async { self.layer.cornerRadius = self.frame.height/2 }
  }

  func rounded(radius: CGFloat) {
      self.clipsToBounds = true
      DispatchQueue.main.async { self.layer.cornerRadius = radius }
  }

  //MARK: - Shadow

  func addShadow(color: UIColor = .black, opacity: Float = 0.3, offset: CGSize = .zero, radius: CGFloat = 5) {
      self.layer.shadowColor = color.cgColor
      self.layer.shadowOpacity = opacity
      self.layer.shadowOffset = offset
      self.layer.shadowRadius = radius
  }

  //MARK: - Blur Effect

  func addBlurEffect(_ style: UIBlurEffect.Style = .dark) {
    let blurredEffectView = UIVisualEffectView(effect: UIBlurEffect(style: style))
    self.insertSubview(blurredEffectView, at: 0)
    //        blurredEffectView.addAllEdgesConstraint(to: contentInfoView)
    blurredEffectView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blurredEffectView.heightAnchor.constraint(equalTo: self.heightAnchor),
      blurredEffectView.widthAnchor.constraint(equalTo: self.widthAnchor),
    ])
  }

  //MARK: - Dashed Line

  func dashedLine(withRadius cornerRadius: CGFloat, borderWidth: CGFloat, color: UIColor, size: NSNumber) {
    guard !containDashedLine() else { return }
    let layerBorder = CAShapeLayer()
    layerBorder.strokeColor = color.cgColor
    layerBorder.lineDashPattern = [size, size]
    layerBorder.frame = layerBorder.bounds
    layerBorder.fillColor = nil
    layerBorder.lineWidth = borderWidth
    layerBorder.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
    self.layer.addSublayer(layerBorder)
  }

  func removeDashedLine() {
    self.layer.sublayers?.forEach({ subLayer in
      if let shapeLayer = subLayer as? CAShapeLayer, shapeLayer.lineDashPattern != nil {
        subLayer.removeFromSuperlayer()
        return
      }
    })
  }

  private func containDashedLine() -> Bool {
    let isContaint = self.layer.sublayers?.contains(where: { subLayer -> Bool in
      if let shapeLayer = subLayer as? CAShapeLayer, shapeLayer.lineDashPattern != nil {
        return true
      }
      return false
    })
    return isContaint ?? false
  }
}

