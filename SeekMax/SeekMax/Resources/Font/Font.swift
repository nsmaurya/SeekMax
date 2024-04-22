//
//  Font.swift
//  SeekMax
//
//  Created by Sunil Maurya on 22/04/24.
//

import Foundation
import UIKit

protocol Font {

    // Get Normal font
    func of(size: CGFloat) -> UIFont?

    // Get Dynamic Font
    func of(
        textStyle: UIFont.TextStyle,
        defaultSize: CGFloat,
        maxSize: CGFloat?
    ) -> UIFont?
}

extension Font where Self: RawRepresentable, Self.RawValue == String {

    func of(size: CGFloat) -> UIFont? {
        return UIFont(name: rawValue, size: size)
    }

    func of(
        textStyle: UIFont.TextStyle,
        defaultSize: CGFloat,
        maxSize: CGFloat? = nil
    ) -> UIFont? {

        guard let font = of(size: defaultSize) else { return nil }
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        if let maxSize = maxSize {
            return fontMetrics.scaledFont(for: font, maximumPointSize: maxSize)
        } else {
            return fontMetrics.scaledFont(for: font, maximumPointSize: defaultSize)
        }
    }
}

extension UIFont {

    static var largeTitle: UIFont? {
        return AppFont.bold.of(textStyle: .largeTitle, defaultSize: 34)
    }

    static var title1: UIFont? {
        return AppFont.bold.of(textStyle: .title1, defaultSize: 28)
    }

    static var title2: UIFont? {
        return AppFont.bold.of(textStyle: .title2, defaultSize: 22)
    }

    static var title3: UIFont? {
        return AppFont.bold.of(textStyle: .title3, defaultSize: 20)
    }

    static var headLine: UIFont? {
        return AppFont.semibold.of(textStyle: .headline, defaultSize: 17)
    }

    static var body: UIFont? {
        return AppFont.regular.of(textStyle: .body, defaultSize: 17)
    }

    static var callout: UIFont? {
        return AppFont.regular.of(textStyle: .callout, defaultSize: 15)
    }

    static var subHead: UIFont? {
        return AppFont.semibold.of(textStyle: .subheadline, defaultSize: 15)
    }

    static var caption: UIFont? {
        return AppFont.regular.of(textStyle: .caption1, defaultSize: 12)
    }
}
