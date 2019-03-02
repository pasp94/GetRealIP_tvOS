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
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   
   @IBAction func getIpButtonPressed(_ sender: UIButton) {
      SessionManager.shared.getTVInfo(success: { (info) in
         print(info.provider)
         print(info.ipAddress)
      }, failure: { error in
         print(error.localizedDescription)
      })
   }
}
