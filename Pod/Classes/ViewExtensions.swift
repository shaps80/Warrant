//
//  ViewValidators.swift
//  Warrant
//
//  Created by Shaps Mohsenin on 14/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import ObjectiveC

struct ValidatorAssociation {
  static var Validator: UInt8 = 1
  static var DependantViews: UInt8 = 2
  static var Enabled: UInt8 = 3
}

extension UITextField: ViewValidating {

  /**
   Validates the textField's Validator
   
   - throws: Throws an error if validation failed
   */
  public func validate() throws {
    try dependantViews?.validate(.All)
    try validator?.validate(text)
  }
  
  /// Get/set the validator associated with this textField
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  /// Get/set the dependantViews associated with this textField
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

extension UITextView: ViewValidating {
  
  /**
   Validates the textView's Validator
   
   - throws: Throws an error if validation failed
   */
  public func validate() throws {
    try dependantViews?.validate(.All)
    try validator?.validate(text)
  }
  
  /// Get/set the validator associated with this textView
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  /// Get/set the dependantViews associated with this textView
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

extension UITableViewCell: ViewValidating {
  
  /**
   Validates the cell's Validator
   
   - throws: Throws an error if validation failed
   */
  public func validate() throws {
    do {
      try dependantViews?.validate(.All)
      enabled = true
    } catch {
      enabled = false
      throw error
    }
  }
  
  /**
   Get/set whether or not this cell should be enabled. The default implementation disables selection and sets the alpha values to 0.3 for textLabel, detailTextLabel, imageView and accessoryView.
   
   - parameter enabled: True if enabled, false otherwise
   */
  public func setEnabled(enabled: Bool) {
    selectionStyle = enabled ? .Default : .None
    textLabel?.alpha = enabled ? 1 : 0.3
    detailTextLabel?.alpha = enabled ? 1 : 0.3
    imageView?.alpha = enabled ? 1 : 0.3
    accessoryView?.alpha = enabled ? 1 : 0.3
  }
  
  /// Get/set the validator associated with this cell
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  /// Get/set the dependantViews associated with this cell
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

extension UIButton: ViewValidating {
  
  /**
   Validates the button's Validator
   
   - throws: Throws an error if validation failed
   */
  public func validate() throws {
    do {
      try dependantViews?.validate(.All)
      enabled = true
    } catch {
      enabled = false
      throw error
    }
  }
  
  /// Get/set the validator associated with this button
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  /// Get/set the dependantViews associated with this button
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

