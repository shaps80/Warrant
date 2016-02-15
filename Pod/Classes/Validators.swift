//
//  RegexValidator.swift
//  Warrant
//
//  Created by Shaps Mohsenin on 14/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

/// A validator that fails if the associated value is empty. The implementation checks if length!=0, count!=0 and isEmpty==false
public final class NonEmptyValidator: Validator {
  
  /**
   A convenience initializer for specifying a default error message
   
   - returns: A newly configured validator
   */
  override init() {
    super.init()
    errorMessage = "The value is empty"
  }
  
  /**
   Validates the specified value
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  override public func validate(value: AnyObject?) throws {
    if let value = value {
      
      // Validate objects that have an isEmpty var
      if value.respondsToSelector("isEmpty") {
        if let isValid = value.valueForKey("isEmpty") as? Bool {
          if !isValid {
            throw NSError(message: errorMessage)
          }
        }
      }
      
      // Validate objects that have a length var
      if value.respondsToSelector("length") {
        if let length = value.valueForKey("length") as? Int {
          if length == 0 {
            throw NSError(message: errorMessage)
          }
        }
      }
      
      // Validate objects that have a count var
      if value.respondsToSelector("count") {
        if let count = value.valueForKey("count") as? Int {
          if count == 0 {
            throw NSError(message: errorMessage)
          }
        }
      }
    }
  }
  
}

/// A validator that fails if the specified regex pattern cannot find a match on the specified value.
public class RegexValidator: Validator {
  
  /// The regex pattern to match
  @IBInspectable public var regexPattern: String?
  
  /**
   Validate the specified value
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  override public func validate(value: AnyObject?) throws {
    if let pattern = regexPattern,
      value = value as? String {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        let range = NSMakeRange(0, value.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let matches = regex.matchesInString(value, options: [], range: range)
        
        if matches.count == 0 {
          throw NSError(message: errorMessage)
        }
    }
  }
  
}


/// A validator that fails if the specified value is not a valid email address
public final class EmailValidator: RegexValidator {
  
  /**
   Convenience initializer that configures a default regex pattern for validating email addresses
   
   - returns: A newly configured email validator
   */
  override init() {
    super.init()
    
    errorMessage = "Invalid email"
    regexPattern =
      "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
      "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
      "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
      "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
      "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
      "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
  }
  
}

/**
 Defines the rules for validating multiple validators
 
 - All: All validators must pass in order for validation to succeed
 - Any: Any validator can pass in order for validation to succeed
 */
public enum ValidationRule: Int {
  case All
  case Any
}

/// A validator for validating multiple validators based on a validation rule
public final class CompoundValidator: Validator {
  
  /// The validators associated with this validator
  @IBOutlet public var validators: [Validator]?
  
  /// The validation rule to apply for validating this validator
  public var rule: ValidationRule = .All
  
  /**
   Initializes this validator with the specified validators
   
   - parameter validators: The validators to validate
   
   - returns: A newly configured validator
   */
  public init(validators: [Validator]) {
    self.validators = validators
  }
  
  /**
   Validates the specified value against all validators associated with this validator
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  override public func validate(value: AnyObject?) throws {
    if let validators = validators {
      try validators.validate(value, rule: rule)
      return
    }
    
    throw NSError(message: errorMessage)
  }
  
}

/// A validator that allows you to provide a block implementation. Useful for arbitrary validation requirements
public final class BlockValidator: Validator {
  
  /// The validation block to execute when this validator is being evaluated
  var validationBlock: ((AnyObject?) throws -> Void)?
  
  /**
   A convenience initializer for specifying a validation block
   
   - parameter block: The block to evaluate
   
   - returns: A newly configured validator
   */
  public convenience init(block: AnyObject? throws -> Void) {
    self.init()
    validationBlock = block
  }
  
  /**
   Validates the specified value using the validation block
   
   - parameter value: The value to validate
   
   - throws: Throws an error if validation fails
   */
  override public func validate(value: AnyObject?) throws {
    try validationBlock?(value)
  }
  
}

