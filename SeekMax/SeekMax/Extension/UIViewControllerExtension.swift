//
//  UIViewControllerExtension.swift
//  SeekMax
//
//  Created by Sunil Maurya on 24/04/24.
//

import UIKit
extension UIViewController {
    
    func showAlertViewWithMessageAndActionHandler(_ title: String, message: String, actionHandler: (() -> Void)?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message,
                                                    preferredStyle: UIAlertController.Style.alert)
            let alAction = UIAlertAction(title: "Ok", style: .default) { _ in
                if actionHandler != nil {
                    actionHandler?()
                }
            }
            alertController.addAction(alAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
