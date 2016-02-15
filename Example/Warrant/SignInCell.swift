//
//  SignInCell.swift
//  Warrant
//
//  Created by Shaps Mohsenin on 14/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Warrant

@IBDesignable
class SignInCell: UITableViewCell {

  override func awakeFromNib() {
    super.awakeFromNib()
    
    let view = UIView()
    view.backgroundColor = tintColor
    selectedBackgroundView = view
  }
  
}
