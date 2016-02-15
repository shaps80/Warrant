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
  
  @IBOutlet var signInCell: SignInCell!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    validate()
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    validate()
    return true
  }
  
  func validate() {
    do {
      try signInCell.validate()
    } catch {
      print(error)
    }
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  
}
