//
//  MainViewController.swift
//  GetRealIP
//
//  Created by Pasquale Spisto on 19/02/2019.
//  Copyright © 2019 pasp_. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MainViewController: UIViewController {
   
   @IBOutlet weak var logoImageView: UIImageView!
   @IBOutlet weak var getIpButton: UIButton!
   
   @IBOutlet weak var basicInfoTableView: UITableView!
   @IBOutlet var customDataSource: TableviewDataSourceDelegate!
   @IBOutlet weak var map: MKMapView!
   
   private let indicator = ActivityIndicator.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   private func setPinOnMap(lat: Double, lon: Double) {
      let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
      let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
      let region = MKCoordinateRegion(center: location, span: span)
      
      let annotation = MKPointAnnotation()
      annotation.coordinate = location
      
      map.mapType = .standard
      map.setRegion(region, animated: true)
      map.addAnnotation(annotation)
   }
   
   @IBAction func getIpButtonPressed(_ sender: UIButton) {
      
//      self.indicator.show()
      
      SessionManager.shared.getTVInfo(success: { (info) in
         DispatchQueue.main.async {
            self.customDataSource.setTableInfo(info: info.dictionaryInfo)
            self.basicInfoTableView.reloadData()
            
            self.setPinOnMap(lat: info.latitude, lon: info.longitude)
            
            
//            self.indicator.remove()
         }
      }, failure: { error in
         print(error.localizedDescription)
      })
   }
}
