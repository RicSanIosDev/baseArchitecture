//
//  Label+Style.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

extension UILabel {
    func bold(size: CGFloat = 18, color: UIColor = UIColor.Font.primary) {
        self.textColor = color
        self.font = UIFont.avenirNextBold(ofSize: size)
    }

    func medium(size: CGFloat = 18, color: UIColor = UIColor.Font.primary) {
        self.textColor = color
        self.font = UIFont.avenirNextMedium(ofSize: size)
    }

    func regular(size: CGFloat = 12, color: UIColor = UIColor.Font.primary) {
        self.textColor = color
        self.font = UIFont.avenirNextRegular(ofSize: size)
    }

    func set(font: UIFont, partOf string: String) {
        guard let text = text, let selfFont = self.font else { return }
        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: selfFont])

        let textRage = (text as NSString).range(of: string)
        attributedString.setAttributes([NSAttributedString.Key.font: font,
                                        NSAttributedString.Key.foregroundColor: textColor as Any], range: textRage)
        attributedText = attributedString
    }
}
