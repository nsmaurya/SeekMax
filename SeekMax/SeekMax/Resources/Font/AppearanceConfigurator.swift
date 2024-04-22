//
//  AppearanceConfigurator.swift
//  SeekMax
//
//  Created by Sunil Maurya on 22/04/24.
//

import Foundation
import UIKit

enum InterFont: String, Font {

    case regular  = "Inter-Regular"
    case medium   = "Inter-Medium"
    case semibold = "Inter-SemiBold"
    case bold     = "Inter-Bold"
}

enum AppFont: Font, RawRepresentable {

    typealias RawValue = String

    case bold
    case regular
    case semibold
    case medium

    init?(rawValue: String) {
        switch rawValue {
        case "bold":       self = .bold
        case "regular":    self = .regular
        case "semibold":   self = .semibold
        case "medium":     self = .medium
        default:           self = .regular
        }
    }

    var rawValue: String {
        switch self {
        case .bold:
            return InterFont.bold.rawValue
        case .regular:
            return InterFont.regular.rawValue
        case .semibold:
            return InterFont.semibold.rawValue
        case .medium:
            return InterFont.medium.rawValue
        }
    }
}

class AppearanceConfigurator {

    static func bootstrapAppearance() {
        bootstrapLabels()
    }

    private static func bootstrapLabels() {
        
    }
}
