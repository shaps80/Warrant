//
//  ViewController.swift
//  Warrant
//
//  Created by Shaps on 02/14/2016.
//  Copyright (c) 2016 Shaps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
}
