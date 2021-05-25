//
//  String+DateFormat.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation

// TODO: To Change for the bershka formats.
enum CommonDateFormat: String, CaseIterable {
    case onlyDateWithoutTime = "dd/MM/yyyy"
    case dateTime = "yyyy-MM-dd HH:mm"
    case dayMonthYear = "dd MMMM yyyy"
    case onlyTime = "HH:mm"
    case dayMonth = "d MMMM"
    case dateExtended = "yyyy-MM-dd HH:mm:ss Z"
    case monthShort = "MM"
    case monthExtended = "MMMM"
    case dateExtendedTwo = "yyyy-MMMM-dd'T'HH:mm:ssZ"
    case dayShort = "dd"
    case backend = "yyyy-MM-dd"
    case systemTime
    case systemDate
}

private struct BackendDateFormat {
    static let one = "yyyy-MM-dd HH:mm:ss"
    static let two = "yyyy-MM-dd"
}

extension String {

    func getDate() -> Date? {
        let dateFormat = DateFormatter()

        dateFormat.dateFormat = BackendDateFormat.one
        if let date = dateFormat.date(from: self) {
            return date
        }

        dateFormat.dateFormat = BackendDateFormat.two
        if let date = dateFormat.date(from: self) {
            return date
        }

        for format in CommonDateFormat.allCases {
            dateFormat.dateFormat = format.rawValue
            if let date = dateFormat.date(from: self) {
                return date
            }
        }

        return nil
    }

    func dateToShow(_ outputType: CommonDateFormat) -> String {
        let dateFormat = DateFormatter()
        if let date = self.getDate() {

            switch outputType {
            case .systemTime:
                dateFormat.timeStyle = .short
            case .systemDate:
                dateFormat.dateStyle = .long
            default:
                dateFormat.dateFormat = outputType.rawValue
            }

            return dateFormat.string(from: date)
        }

        return ""
    }

    func dateToBackend() ->String {
        let dateFormat = DateFormatter()

        if let date = self.getDate() {
            dateFormat.dateFormat = BackendDateFormat.two
            return dateFormat.string(from: date)
        }

        return ""
    }

    func showAge() -> String {
        let now = Date()
        let calendar = Calendar.current

        if let birthday = self.getDate() {
            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
            if let age = ageComponents.year {
                return "\(age) Years"
            }
        }

        return ""
    }

    func getAge() -> Int? {
        let now = Date()
        let calendar = Calendar.current

        if let birthday = self.getDate() {
            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
            if let age = ageComponents.year {
                return age
            }
        }
        return nil
    }
}

extension Date {
    func toString(format: CommonDateFormat) -> String {
        let dateFormat = DateFormatter()

        switch format {
        case .systemTime:
            dateFormat.timeStyle = .short
        case .systemDate:
            dateFormat.dateStyle = .long
        default:
            dateFormat.dateFormat = format.rawValue
        }

        return dateFormat.string(from: self)
    }
}

