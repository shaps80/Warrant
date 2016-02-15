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
  
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    _ = try? signInCell.validate()
    return true
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  
}
