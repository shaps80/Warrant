//
//  SignInCell.swift
//  Warrant
//
//  Created by Shaps Mohsenin on 14/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

@IBDesignable
class SignInCell: UITableViewCell {
  
  @IBInspectable var enabled: Bool = true {
    didSet {
      selectionStyle = enabled ? .Default : .None
      textLabel?.textColor = enabled ? UIColor.blackColor() : disabledTextColor
      detailTextLabel?.textColor = enabled ? UIColor.blackColor() : disabledTextColor
    }
  }
  
  @IBInspectable var disabledTextColor: UIColor = UIColor(white: 0, alpha: 0.2) {
    didSet {
      textLabel?.textColor = disabledTextColor
      detailTextLabel?.textColor = disabledTextColor
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    
    let view = UIView()
    view.backgroundColor = tintColor
    selectedBackgroundView = view
  }
  
}
