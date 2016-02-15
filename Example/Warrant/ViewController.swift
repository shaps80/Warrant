//
//  ViewController.swift
//  Warrant
//
//  Created by Shaps on 02/14/2016.
//  Copyright (c) 2016 Shaps. All rights reserved.
//

import UIKit
import Warrant

class ViewController: UITableViewController, UITextFieldDelegate {
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  @IBOutlet var emailField: UITextField! {
    didSet {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldDidChange:", name: UITextFieldTextDidChangeNotification, object: emailField)
    }
  }
  
  @IBOutlet var passwordField: UITextField! {
    didSet {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldDidChange:", name: UITextFieldTextDidChangeNotification, object: passwordField)
    }
  }
  
  @IBOutlet var signInCell: SignInCell! {
    didSet {
      validate()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let validator = BlockValidator { (value) -> Void in
      if let value = value as? String {
        if value == "123" {
          throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "123 is invalid"])
        }
      }
    }

    _ = try? validator.validate("123")
    
    validate()
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  func validate() {
    do {
      try signInCell.validate()
    } catch {
      print(error)
    }
  }
  
  func textFieldDidChange(sender: UITextField?) {
    validate()
  }
  
}
