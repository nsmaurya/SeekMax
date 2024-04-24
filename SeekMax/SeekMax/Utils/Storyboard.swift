//
//  Storyboard.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import Foundation
import UIKit

enum Storyboard: String {

    case main = "Main"

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    func instantiateVC<T: UIViewController>(_ objectClass: T.Type) -> T {
        let storyBoard = self.instance
        let className = String.getStringOfClass(objectClass: objectClass)
        if let storyboard = storyBoard.instantiateViewController(withIdentifier: className) as? T {
            return storyboard
        } else {
            fatalError("\(className) view controller not defined properly.")
        }
    }
}
