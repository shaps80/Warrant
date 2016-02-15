//
//  Validator.swift
//  Pods
//
//  Created by Shaps Mohsenin on 14/02/2016.
//
//

import Foundation

extension NSError {
  convenience init(message: String?) {
    self.init(domain: "validation.error", code: -1, userInfo: [NSLocalizedDescriptionKey: message ?? "Invalid value"])
  }
}

@objc public protocol Validating: NSObjectProtocol {

  var errorMessage: String? { get set }
  func validate(value: AnyObject?) throws
  
}

public class Validator: NSObject, Validating {

  @IBInspectable public var errorMessage: String?
  public func validate(value: AnyObject?) throws { /* implement in subclass */ }
  
}

@objc public protocol ViewValidating: NSObjectProtocol {
  
  func validate() throws
  optional func setEnabled(enabled: Bool)
  
  var dependantViews: [ViewValidating]? { get set }
  var validator: Validator? { get set }
  
}

extension ViewValidating {
  
  public var enabled: Bool {
    get { return objc_getAssociatedObject(self, &ValidatorAssociation.Enabled) as? Bool ?? true }
    set {
      objc_setAssociatedObject(self, &ValidatorAssociation.Enabled, newValue, .OBJC_ASSOCIATION_ASSIGN)
      setEnabled?(newValue)
    }
  }
  
  public func validate() throws {
    try dependantViews?.validate(.All)
  }
  
}

extension SequenceType where Generator.Element : ViewValidating {
  
  public func validate(rule: ValidationRule) throws {
    var isValid = false
    
    for view in self {
      do {
        try view.validate()
        isValid = true
      } catch {
        if rule == .All {
          throw NSError(message: "")
        }
      }
    }
    
    if !isValid {
      throw NSError(message: nil)
    }
  }
  
}

extension SequenceType where Generator.Element : Validating {
  
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

