//
//  StringExtension.swift
//  SeekMax
//
//  Created by Sunil Maurya on 23/04/24.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return self.count >= 8
    }
    
    static func getStringOfClass(objectClass: AnyClass) -> String {
        let className = String(describing: objectClass.self)
        return className
    }
}
