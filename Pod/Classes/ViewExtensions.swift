/*
  Copyright © 2015 Shaps Mohsenin. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY SHAPS MOHSENIN `AS IS' AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
  EVENT SHALL THE APP BUSINESS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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

