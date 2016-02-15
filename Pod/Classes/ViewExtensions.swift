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
  
  public func validate() throws {
    try dependantViews?.validate(.All)
    try validator?.validate(text)
  }
  
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

extension UITextView: ViewValidating {
  
  public func validate() throws {
    try dependantViews?.validate(.All)
    try validator?.validate(text)
  }
  
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

extension UITableViewCell: ViewValidating {
  
  public func validate() throws {
    do {
      try dependantViews?.validate(.All)
      enabled = true
    } catch {
      enabled = false
      throw error
    }
  }
  
  public func setEnabled(enabled: Bool) {
    selectionStyle = enabled ? .Default : .None
    textLabel?.alpha = enabled ? 1 : 0.3
    detailTextLabel?.alpha = enabled ? 1 : 0.3
  }
  
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

extension UIButton: ViewValidating {
  
  public func validate() throws {
    do {
      try dependantViews?.validate(.All)
      enabled = true
    } catch {
      enabled = false
      throw error
    }
  }
  
  @IBOutlet public var validator: Validator? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Validator) as? Validator }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.Validator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
  @IBOutlet public var dependantViews: [ViewValidating]? {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.DependantViews) as? [ViewValidating] }
    set { objc_setAssociatedObject(self, &ValidatorAssociation.DependantViews, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }
  
}

