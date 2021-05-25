//
//  SegmentedControl+Style.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

extension UISegmentedControl {
    func fontBold(for state: UIControl.State, size: CGFloat = 20, color: UIColor) {
        let boldTextAttributes = [
            NSAttributedString.Key.font: UIFont.avenirNextBold(ofSize: 20),
            NSAttributedString.Key.foregroundColor: color
        ]

        setTitleTextAttributes(boldTextAttributes, for: state)
    }

    func fontMedium(for state: UIControl.State, size: CGFloat = 20, color: UIColor) {
        let boldTextAttributes = [
            NSAttributedString.Key.font: UIFont.avenirNextMedium(ofSize: 20),
            NSAttributedString.Key.foregroundColor: color
        ]

        setTitleTextAttributes(boldTextAttributes, for: state)
    }

    func fontRegular(for state: UIControl.State, size: CGFloat = 18, color: UIColor) {
        let normalTextAttributes = [
            NSAttributedString.Key.font: UIFont.avenirNextRegular(ofSize: size),
            NSAttributedString.Key.foregroundColor: color
        ]

        setTitleTextAttributes(normalTextAttributes, for: state)
    }
}

