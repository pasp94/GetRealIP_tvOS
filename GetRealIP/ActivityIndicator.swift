//
//  ActivityIndicator.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 18/05/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import UIKit

class ActivityIndicator {
   
   static let shared = ActivityIndicator()
   
   public private(set) var isShowing = false
   
   private var spinner = UIActivityIndicatorView(style: .whiteLarge)
   private var view: UIView {
      let frame = UIScreen.main.bounds
      let view = UIView(frame: frame)
      view.backgroundColor = UIColor(white: 0.1, alpha: 0.6)
      self.spinner.center = view.center
      self.spinner.startAnimating()
      view.addSubview(spinner)
      
      return view
   }
   
   private let application = UIApplication.shared
   
   private init() {}
   
   public func show() {
      if !isShowing {
         self.isShowing = true
         self.application.beginIgnoringInteractionEvents()
         self.application.keyWindow?.addSubview(self.view)   
      }
   }
   
   public func remove() {
      if isShowing {
         self.view.removeFromSuperview()
         self.application.endIgnoringInteractionEvents()
         self.isShowing = false
      }
   }

}
