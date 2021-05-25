//
//  TitleWithDatePickerView.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

protocol TitleWithDatePickerViewDelegate: AnyObject {
    func dateDidChange(sender: TitleWithDatePickerView, date: Date)
}

final class TitleWithDatePickerView: UIView {

    // MARK: - Views

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.bold()
        return label
    }()

    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.Base.primary.cgColor
        return textField
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.addTarget(nil, action: #selector(datePickerDidChange), for: .valueChanged)
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.tintColor = UIColor.Base.primary
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,
                                                   datePicker])
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    // MARK: - Vars

    weak var delegate: TitleWithDatePickerViewDelegate?

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }

    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }

    var textFieldFont: UIFont? {
        get {
            return textField.font
        }
        set {
            textField.font = newValue
        }
    }

    var date: Date {
        get {
            return datePicker.date
        }
        set {
            datePicker.date = newValue
        }
    }

    // MARK: - Inits

    init() {
        super.init(frame: .zero)
        initView()
        applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDatePicker(dateMode: UIDatePicker.Mode) {
        datePicker.datePickerMode = dateMode
    }

    // MARK: - Actions

    @objc func datePickerDidChange(sender: UIDatePicker) {
        delegate?.dateDidChange(sender: self, date: sender.date)

        if sender.datePickerMode != .time {
            UIApplication.topViewController()?.dismiss(animated: true, completion: nil)
        }
    }
}

private extension TitleWithDatePickerView {
    func initView() {
        addAutoLayout(subview: stackView)
    }

    func applyConstraints() {
        stackView.addAllEdgesConstraint(to: self, constant: (8,8,8,8))
    }
}

//MARK: - DatePicker setup
extension TitleWithDatePickerView {
    func setInputViewDatePicker(dateMode: UIDatePicker.Mode) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker()
        datePicker.addTarget(nil, action: #selector(datePickerDidChange), for: .valueChanged)
        datePicker.datePickerMode = dateMode
        datePicker.preferredDatePickerStyle = .wheels
        textField.inputView = datePicker //3

        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0,
                                              width: screenWidth,
                                              height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                       target: nil,
                                       action: nil)

        let cancel = UIBarButtonItem(title: "Cancel",
                                     style: .plain,
                                     target: nil,
                                     action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done",
                                        style: .plain,
                                        target: nil,
                                        action: #selector(tapDone))
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        textField.inputAccessoryView = toolBar
    }

    @objc func tapDone() {
        if let datePicker = textField.inputView as? UIDatePicker {
            date = datePicker.date
            textField.text = getDateString(picker: datePicker)
        }
        textField.resignFirstResponder()
    }

    private func getDateString(picker: UIDatePicker) -> String {
        let format: CommonDateFormat = picker.datePickerMode == .time ? .systemTime : .systemDate
        return picker.date.toString(format: format)
    }

    @objc func tapCancel() {
        textField.resignFirstResponder()
    }
}

