//
//  UIColor+BaseColor.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import Foundation
import UIKit


// MARK: - Base
extension UIColor {

    struct Base {
        public static var primary: UIColor {
            return UIColor(red: 47/255, green: 107/255, blue: 46/255, alpha: 1)
        }

        public static var background: UIColor {
            return .white
        }
    }
}

// MARK: - NavBar
extension UIColor {

    struct NavBar {
        public static var background: UIColor {
            return UIColor(red: 77/255, green: 168/255, blue: 178/255, alpha: 1)
            //            return UIColor(red: 77/255, green: 150/255, blue: 100/255, alpha: 1)
        }

        public static var items: UIColor {
            return .white
        }
    }
}

// MARK: - TabBar
extension UIColor {

    struct TabBar {
        public static var background: UIColor {
            return UIColor(red: 77/255, green: 168/255, blue: 178/255, alpha: 1)
           // return UIColor(red: 47/255, green: 107/255, blue: 46/255, alpha: 1)
        }

        public static var selectedItem: UIColor {
            return .white
        }
    }
}

// MARK: - Font
extension UIColor {

    struct Font {
        public static var primary: UIColor {
            return Base.primary
        }

        public static var secundary: UIColor {
            return .white
        }

        public static var description: UIColor {
            return .lightGray
        }
    }

    public static var personalTime: UIColor {
        return UIColor(red: 235/255, green: 220/255, blue: 220/255, alpha: 1)
    }

    public static var pointsBalance: UIColor {
        return UIColor(red: 245/255, green: 215/255, blue: 181/255, alpha: 1)
    }

    public static var vacationsDays: UIColor {
        return UIColor(red: 248/255, green: 227/255, blue: 103/255, alpha: 1)
    }
}


