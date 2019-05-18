//
//  DeviceIPInfo.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 19/02/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import Foundation

typealias Codable = Encodable & Decodable

struct DeviceIPInfo: Codable {
   let provider : String // "AS3269 Telecom Italia S.p.a.",
   let city: String // "San Giuseppe Vesuviano",
   let country: String // "Italy",
   let countryCode: String //": "IT",
   let isp: String //": "INTERBUSINESS",
   let latitude: Double //": 40.8356,
   let longitude: Double //": 14.5049,
   let org: String//": "NAS DHCP Pool Padova",
   let ipAddress: String //query": "79.43.152.153",
   let regionNumber: String //"region": "72",
   let regionName: String //": "Campania",
   let status: String //": "success",
   let timezone: String//": "Europe/Rome",
   let zip: String//": "80047"
   
   private enum CodingKeys : String, CodingKey {
      case provider = "as"
      case city
      case country
      case countryCode
      case isp
      case latitude = "lat"
      case longitude = "lon"
      case org
      case ipAddress = "query"
      case regionNumber = "region"
      case regionName
      case status
      case timezone
      case zip
   }
   
   var dictionaryInfo: [String: Any] {
      return ["ipAddress": ipAddress,
              "provider": provider,
              "city": city,
              "zip": zip,
              "status": status]
   }
}

/*
 
 "as": "AS3269 Telecom Italia S.p.a.",
 "city": "San Giuseppe Vesuviano",
 "country": "Italy",
 "countryCode": "IT",
 "isp": "INTERBUSINESS",
 "lat": 40.8356,
 "lon": 14.5049,
 "org": "NAS DHCP Pool Padova",
 "query": "79.43.152.153",
 "region": "72",
 "regionName": "Campania",
 "status": "success",
 "timezone": "Europe/Rome",
 "zip": "80047"
 
 */
