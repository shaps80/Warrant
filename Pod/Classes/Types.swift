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

import Foundation

extension NSError {
  
  /**
   Convenience initializer to create a validation error
   
   - parameter message: The message to associate with this error
   
   - returns: A newly configured NSError
   */
  convenience init(message: String?) {
    self.init(domain: "validation.error", code: -1, userInfo: [NSLocalizedDescriptionKey: message ?? "Invalid value"])
  }
  
}


/**
 *  Defines a protocol for supporting validation
 */
@objc public protocol Validating: NSObjectProtocol {

  /// Get/set the error message to use when this validator fails
  var errorMessage: String? { get set }
  
  /**
   Validates the specified value.
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  func validate(_ value: AnyObject?) throws
  
}


/// The base validator class. All validators should subclass this. It is provided to enable IBInspector support
open class Validator: NSObject, Validating {

  /// Get/set the error message associated with this validator
  @IBInspectable open var errorMessage: String?
  
  /**
   Validates the specified value
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  open func validate(_ value: AnyObject?) throws { /* implement in subclass */ }
  
}


/**
 *  Defines a protocol for supporting view validation
 */
@objc public protocol ViewValidating: NSObjectProtocol {

  /**
   Validates the associated view
   
   - throws: Throws an error is validation fails
   */
  func validate() throws
  
  /**
   Gives the receiver an opporunity to react to validation changes
   
   - parameter enabled: True if validation succeeded, false otherwise
   */
  @objc optional func setEnabled(_ enabled: Bool)
  
  /// Get/ste the views that must pass validation in order for this view to validate
  var dependantViews: [ViewValidating]? { get set }
  
  /// Get/set the validator associated with this view
  var validator: Validator? { get set }
  
}

extension ViewValidating {
  
  /// Default implementation. Enables/disables the view depending on whether or not it can be validated
  public var enabled: Bool {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Enabled) as? Bool ?? true }
    set {
      objc_setAssociatedObject(self, &ValidatorAssociation.Enabled, newValue, .OBJC_ASSOCIATION_ASSIGN)
      setEnabled?(newValue)
    }
  }
  
  /**
   Default implementation. Validates the view
   
   - throws: Throws an error if validation fails
   */
  public func validate() throws {
    try dependantViews?.validate(.all)
  }
  
}

extension Sequence where Iterator.Element : ViewValidating {
  
  /**
   Validates all view validators in this sequence
   
   - parameter rule: The rule to use for validation (.All = all validators must pass, .Any = at least one validator must pass)
   
   - throws: Throws an error if validation fails
   */
  public func validate(_ rule: ValidationRule) throws {
    var isValid = false
    var message: String?
    
    for view in self {
      message = view.validator?.errorMessage
      
      do {
        try view.validate()
        isValid = true
      } catch {
        if rule == .all {
          throw NSError(message: message)
        }
      }
    }
    
    if !isValid {
      throw NSError(message: message)
    }
  }
  
}

extension Sequence where Iterator.Element : Validating {
  
  /**
   Validates all validators in this sequence
   
   - parameter value: The value to validate
   - parameter rule:  The rule to use for validation (.All = all validators must pass, .Any = at least one validator must pass)
   
   - throws: Throws an error if validation fails
   */  
  public func validate(_ value: AnyObject?, rule: ValidationRule) throws {
    for validator in self {
      do {
        try validator.validate(value)
      } catch {
        if rule == .all {
          throw NSError(message: validator.errorMessage)
        }
      }
    }
  }
  
}

