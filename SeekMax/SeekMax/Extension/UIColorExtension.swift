//
//  UIColorExtension.swift
//  SeekMax
//
//  Created by Sunil Maurya on 22/04/24.
//

import UIKit

extension UIColor {
    
    static func color(named: String) -> UIColor {
        if let color = UIColor(named: named) {
            return color
        }
        return .black
    }
}
