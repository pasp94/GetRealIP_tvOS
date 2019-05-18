//
//  TableviewDataSourceDelegate.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 02/03/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import UIKit

struct MainInfo {
   var key: String
   var value: String
}

class TableviewDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
   
   private var cellData: [MainInfo] = []
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.cellData.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
      
      cell.textLabel?.text = self.cellData[indexPath.row].key.uppercased()
      cell.detailTextLabel?.text = self.cellData[indexPath.row].value
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let cell = tableView.cellForRow(at: indexPath) else { return }
      
      let alertViewController = UIAlertController(title: cell.textLabel?.text, message: cell.detailTextLabel?.text, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Chiudi", style: .cancel, handler: nil)
      alertViewController.addAction(okAction)
      
      guard let topViewController = self.takeTopViewController() else {
         print("Error in topViewController init")
         return
      }
      
      topViewController.present(alertViewController, animated: true)
   }
   
   private func takeTopViewController() -> UIViewController? {
      guard let root = UIApplication.shared.keyWindow?.rootViewController else {return nil}
      
      return root 
   }
   
   public func setTableInfo(info: [String: Any]) {
      self.cellData.removeAll()
      for (key, value) in info {
         let data = MainInfo(key: key, value: value as! String)
         self.cellData.append(data)
      }
   }
}
