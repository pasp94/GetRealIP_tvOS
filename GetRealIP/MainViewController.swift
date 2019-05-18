//
//  MainViewController.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 19/02/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   
   @IBOutlet weak var logoImageView: UIImageView!
   @IBOutlet weak var getIpButton: UIButton!
   
   @IBOutlet weak var basicInfoTableView: UITableView!
   @IBOutlet var customDataSource: TableviewDataSourceDelegate!
   
   private let indicator = ActivityIndicator.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   
   @IBAction func getIpButtonPressed(_ sender: UIButton) {
      
//      self.indicator.show()
      
      SessionManager.shared.getTVInfo(success: { (info) in
         DispatchQueue.main.async {
            self.customDataSource.setTableInfo(info: info.dictionaryInfo)
            self.basicInfoTableView.reloadData()
//            self.indicator.remove()
         }
      }, failure: { error in
         print(error.localizedDescription)
      })
   }
}
