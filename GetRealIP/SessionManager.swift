//
//  SessionManager.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 19/02/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import UIKit

class SessionManager: NSObject {
   
   static let shared = SessionManager()
   
   private let ipApiURLString = "http://ip-api.com/json"
   
   private override init(){}
   
   public func getTVInfo(success: @escaping (DeviceIPInfo)->(), failure: @escaping (Error) -> ()) {
      guard let ipApiURL = URL(string: ipApiURLString) else { return }
      
      _ = URLSession.shared.dataTask(with: ipApiURL) { responseData, responseURL, responseError in
         if let error = responseError {
            failure(error)
         } else {
            guard let data = responseData else { return }
            do {
               let deviceInfo = try JSONDecoder().decode(DeviceIPInfo.self, from: data)
               success(deviceInfo)
            } catch let jsonErr{
               print("Error serializing JSON:", jsonErr)
            }
         }
      }.resume()
   }
}
