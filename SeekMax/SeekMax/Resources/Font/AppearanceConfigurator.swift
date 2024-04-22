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
        // Bold text of size 34pt
        LargeTitleLabel.appearance().font = UIFont.largeTitle

        // Bold text of size 28pt
        Title1Label.appearance().font = UIFont.title1

        // Bold text of size 22pt
        Title2Label.appearance().font = UIFont.title2

        // Bold text of size 20pt
        Title3Label.appearance().font = UIFont.title3

        // Bold text of size 17pt
        HeadLineLabel.appearance().font = UIFont.headLine

        // Regular text of size 17pt
        BodyLabel.appearance().font = UIFont.body

        // Regular text of size 15pt
        CalloutLabel.appearance().font = UIFont.callout

        // Bold text of size 15pt
        SubHeadLabel.appearance().font = UIFont.subHead

        // Regular text of size 12pt
        CaptionLabel.appearance().font = UIFont.caption
    }
}
