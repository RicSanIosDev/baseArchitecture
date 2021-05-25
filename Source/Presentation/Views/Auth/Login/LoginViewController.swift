//
//  LoginViewCOntroller.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

class LoginViewController: BaseViewController<LoginPresenter> {

    // MARK: - Views

    let intergrowView: IntergrowView = {
        let intergrow = IntergrowView()
        intergrow.backgroundColor = .blue
        intergrow.titleLabel.text = "login_title_absence_request_form".localized
        return intergrow
    }()

    var emailTextField: TitleWithTextField = {
        let field = TitleWithTextField()
        field.title = "login_title_email".localized
        field.textFieldFont = UIFont.avenirNextRegular(ofSize: 18)
        return field
    }()

    var passwordTextField: TitleWithTextField = {
        let field = TitleWithTextField()
        field.title = "login_title_password".localized
        field.textFieldFont = UIFont.avenirNextRegular(ofSize: 18)
        field.textField.isSecureTextEntry = true
        return field
    }()

    var loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.rounded(radius: 12)
        button.backgroundColor = UIColor.Base.primary
        button.setTitleColor(.white, for: .normal)
        button.setTitle("login_button_login".localized, for: .normal)
        return button
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField,
                                                   passwordTextField,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        applyConstraints()
    }

    //MARK: - Actions

    @objc func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, let pass = passwordTextField.text else { return }
        presenter.login(email: email, password: pass)
    }
}

extension LoginViewController: LoginView {}

private extension LoginViewController {
    //MARK: - Configs

    private func initViews() {
        view.backgroundColor = .white
        view.addAutoLayout(subview: intergrowView)
        view.addAutoLayout(subview: stackView)
    }

    private func applyConstraints() {

        NSLayoutConstraint.activate([
            intergrowView.topAnchor.constraint(equalTo: view.topAnchor),
            intergrowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            intergrowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            intergrowView.heightAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

