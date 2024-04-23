//
//  Button.swift
//  SeekMax
//
//  Created by Sunil Maurya on 23/04/24.
//

import Foundation
import UIKit

class Button: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        var font: UIFont?
        switch self {
        case is PrimaryButtonFilled:
            font = UIFont.subHead
        default:
            break
        }
        
        self.titleLabel?.font = font
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        UIView.performWithoutAnimation {
            super.setTitle(title, for: .normal)
            self.layoutIfNeeded()
        }
    }
}

// MARK: - Primary Button
class PrimaryButtonFilled: Button {

    override var isEnabled: Bool {
        didSet {
            configure()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        commomInit()
    }

    func commomInit() {

        self.clipsToBounds = true
        self.tintColor = .primaryButton
        self.backgroundColor = .primaryButton
        self.setTitleColor(.textReversed, for: .normal)
    }

    func configure() {
        self.backgroundColor = isEnabled ? UIColor.primaryButton : UIColor.bgSecondary
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
