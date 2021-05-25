//
//  IntergrowView.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//


import UIKit

final class IntergrowView: UIView {
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logoIntergrow")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.bold()
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()

    // MARK: - Inits

    init() {
        super.init(frame: .zero)
        initView()
        applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension IntergrowView {
    func initView() {
        addSubview(logoImageView)
        addSubview(titleLabel)
    }

    func applyConstraints() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            logoImageView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 0.7),
            logoImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.aspectRatioConstraint(1/3)
        ])
    }
}

