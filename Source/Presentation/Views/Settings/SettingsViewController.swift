//
//  SettingsViewController.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

enum SettingsRow {
    case logout
}

class SettingsViewController: BaseViewController<SettingsPresenter> {

    // MARK: - Views

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.Base.background
        tableView.tableFooterView = versionView
        return tableView
    }()

    let versionView: UIView = {
        let label = UILabel()
        let stack = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.regular()
        label.textAlignment = .center
        label.text = "Version \(Bundle.main.versionNumber) (\(Bundle.main.buildNumber))"
        stack.addAutoLayout(subview: label)
        label.addAllEdgesConstraint(to: stack)
        return stack
    }()

    // MARK: - Vars

    let settingsRows: [SettingsRow] = [.logout]

    // MARK: - Lifecycle

    override func loadView() {
        view  = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension SettingsViewController {
    func getTitle(row: SettingsRow) -> String {
        switch row {
        case .logout:
            return "settings_cell_title_logout".localized
        }
    }
}

extension SettingsViewController: SettingsView {}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsRows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let row = settingsRows[indexPath.row]
        cell.textLabel?.text = getTitle(row: row)
        cell.textLabel?.textColor = UIColor.Font.primary
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = settingsRows[indexPath.row]
        switch row {
        case .logout:
            presenter.logout()
        }
    }
}
