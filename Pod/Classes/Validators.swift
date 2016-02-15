//
//  RegexValidator.swift
//  Warrant
//
//  Created by Shaps Mohsenin on 14/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

public class RegexValidator: Validator {
  
  @IBInspectable public var regexPattern: String?
  
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

public final class EmailValidator: RegexValidator {
  
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

public enum ValidationRule: Int {
  case All
  case Any
}

public final class CompoundValidator: Validator {
  
  @IBOutlet public var validators: [Validator]?
  public var rule: ValidationRule = .All
  
  public init(validators: [Validator]) {
    self.validators = validators
  }
  
  override public func validate(value: AnyObject?) throws {
    if let validators = validators {
      try validators.validate(value, rule: rule)
      return
    }
    
    throw NSError(message: nil)
  }
  
}

public final class NonEmptyValidator: Validator {
  
  override init() {
    super.init()
    errorMessage = "The value is empty"
  }
  
  override public func validate(value: AnyObject?) throws {
    if let value = value {
      if value.respondsToSelector("isEmpty") {
        if let isValid = value.valueForKey("isEmpty") as? Bool {
          if !isValid {
            throw NSError(message: errorMessage)
          }
        }
      }
      
      if value.respondsToSelector("length") {
        if let length = value.valueForKey("length") as? Int {
          if length == 0 {
            throw NSError(message: errorMessage)
          }
        }
      }
      
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

public final class BlockValidator: Validator {
  
  var validationBlock: ((AnyObject?) throws -> Void)?
  
  public convenience init(block: AnyObject? throws -> Void) {
    self.init()
    validationBlock = block
  }
  
  override public func validate(value: AnyObject?) throws {
    try validationBlock?(value)
  }
  
}

