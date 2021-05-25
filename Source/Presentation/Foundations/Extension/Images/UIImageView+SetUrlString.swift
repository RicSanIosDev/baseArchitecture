//
//  UIImageView+SetUrlString.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(stringURL: String?, placeholder: UIImage? = nil) {
        tintColor = UIColor.Font.primary
        let placeholder = placeholder != nil ? placeholder : UIImage(systemName: "photo.fill")
        if let stringUrl = stringURL, let url = URL(string: stringUrl) {
            self.kf.setImage(with: url, placeholder: placeholder)
        } else {
            self.image = placeholder
        }
    }
}
