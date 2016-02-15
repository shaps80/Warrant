//
//  Validator.swift
//  Pods
//
//  Created by Shaps Mohsenin on 14/02/2016.
//
//

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
  func validate(value: AnyObject?) throws
  
}


/// The base validator class. All validators should subclass this. It is provided to enable IBInspector support
public class Validator: NSObject, Validating {

  /// Get/set the error message associated with this validator
  @IBInspectable public var errorMessage: String?
  
  /**
   Validates the specified value
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  public func validate(value: AnyObject?) throws { /* implement in subclass */ }
  
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
  optional func setEnabled(enabled: Bool)
  
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
    try dependantViews?.validate(.All)
  }
  
}

extension SequenceType where Generator.Element : ViewValidating {
  
  /**
   Validates all view validators in this sequence
   
   - parameter rule: The rule to use for validation (.All = all validators must pass, .Any = at least one validator must pass)
   
   - throws: Throws an error if validation fails
   */
  public func validate(rule: ValidationRule) throws {
    var isValid = false
    var message: String?
    
    for view in self {
      message = view.validator?.errorMessage
      
      do {
        try view.validate()
        isValid = true
      } catch {
        if rule == .All {
          throw NSError(message: message)
        }
      }
    }
    
    if !isValid {
      throw NSError(message: message)
    }
  }
  
}

extension SequenceType where Generator.Element : Validating {
  
  /**
   Validates all validators in this sequence
   
   - parameter value: The value to validate
   - parameter rule:  The rule to use for validation (.All = all validators must pass, .Any = at least one validator must pass)
   
   - throws: Throws an error if validation fails
   */  
  public func validate(value: AnyObject?, rule: ValidationRule) throws {
    for validator in self {
      do {
        try validator.validate(value)
      } catch {
        if rule == .All {
          throw NSError(message: validator.errorMessage)
        }
      }
    }
  }
  
}

