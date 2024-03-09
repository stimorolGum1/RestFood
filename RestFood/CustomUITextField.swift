//
//  CustomUITextField.swift
//  RestFood
//
//  Created by Danil on 07.03.2024.
//

import UIKit

class CustomTextField: UITextField {
    var textPadding = UIEdgeInsets(
        top: 1,
        left: 5,
        bottom: 1,
        right: 1
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
