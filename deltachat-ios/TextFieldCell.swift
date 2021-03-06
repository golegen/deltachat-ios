//
//  TextFieldCell.swift
//  deltachat-ios
//
//  Created by Friedel Ziegelmayer on 27.12.18.
//  Copyright © 2018 Jonas Reinsch. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
  let textField = UITextField()

  init(description: String, placeholder: String) {
    super.init(style: .value1, reuseIdentifier: nil)

    textLabel?.text = "\(description):"
    contentView.addSubview(textField)

    textField.translatesAutoresizingMaskIntoConstraints = false

    // see: https://stackoverflow.com/a/35903650
    // this makes the textField respect the trailing margin of
    // the table view cell
    let margins = contentView.layoutMarginsGuide
    let trailing = margins.trailingAnchor
    textField.trailingAnchor.constraint(equalTo: trailing).isActive = true
    textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    textField.textAlignment = .right

    textField.placeholder = placeholder

    selectionStyle = .none

    textField.enablesReturnKeyAutomatically = true
  }

  override func setSelected(_ selected: Bool, animated _: Bool) {
    if selected {
      textField.becomeFirstResponder()
    }
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  static func makeEmailCell() -> TextFieldCell {
    let emailCell = TextFieldCell(description: "Email", placeholder: "you@example.com")

    emailCell.textField.keyboardType = .emailAddress
    // switch off quicktype
    emailCell.textField.autocorrectionType = .no
    emailCell.textField.autocapitalizationType = .none

    return emailCell
  }

  static func makePasswordCell() -> TextFieldCell {
    let passwordCell = TextFieldCell(description: "Password", placeholder: "your IMAP password")

    passwordCell.textField.textContentType = UITextContentType.password
    passwordCell.textField.isSecureTextEntry = true

    return passwordCell
  }

  static func makeNameCell() -> TextFieldCell {
    let nameCell = TextFieldCell(description: "Name", placeholder: "new contacts nickname")

    nameCell.textField.autocapitalizationType = .words
    nameCell.textField.autocorrectionType = .no
    // .namePhonePad doesn't support autocapitalization
    // see: https://stackoverflow.com/a/36365399
    // therefore we use .default to capitalize the first character of the name
    nameCell.textField.keyboardType = .default

    return nameCell
  }

  static func makeConfigCell(label: String, placeholder: String) -> TextFieldCell {
    let nameCell = TextFieldCell(description: label, placeholder: placeholder)

    nameCell.textField.autocapitalizationType = .words
    nameCell.textField.autocorrectionType = .no
    // .namePhonePad doesn't support autocapitalization
    // see: https://stackoverflow.com/a/36365399
    // therefore we use .default to capitalize the first character of the name
    nameCell.textField.keyboardType = .default

    return nameCell
  }
}
