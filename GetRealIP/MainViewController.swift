//
//  MainViewController.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 19/02/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      SessionManager.shared.getTVInfo(success: { (info) in
         print(info.query)
      }, failure: { error in
         print(error.localizedDescription)
      })
   }
}
