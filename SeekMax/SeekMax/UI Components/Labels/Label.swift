//
//  Label.swift
//  SeekMax
//
//  Created by Sunil Maurya on 22/04/24.
//

import Foundation
import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    func commonInit() {
        // Enable dynamic font
        self.adjustsFontForContentSizeCategory = true
     }
}

/// Bold text of size 34pt
class LargeTitleLabel: Label {}

/// Bold text of size 28pt
class Title1Label: Label {}

/// Bold text of size 22pt
class Title2Label: Label {}

/// Bold text of size 20pt
class Title3Label: Label {}

/// Bold text of size 17pt
class HeadLineLabel: Label {}

/// Regular  text of size 17pt
class BodyLabel: Label {}

/// Regular text of size 15pt
class CalloutLabel: Label {}

/// Bold text of size 15pt
class SubHeadLabel: Label {}

/// Regular text of size 12pt
class CaptionLabel: Label {}
