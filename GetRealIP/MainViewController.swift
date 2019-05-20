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
   @IBOutlet var positionLabels: [UILabel]!
    
    private var mapFocusGuide: UIFocusGuide!
   
   override func viewDidLoad() {
      super.viewDidLoad()
        self.setFocusGuide()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      for label in positionLabels {
         label.text = ""
      }
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
   
   private func setPositionLabels(_ info: DeviceIPInfo) {
      self.positionLabels[0].text = info.city
      self.positionLabels[1].text = "\(info.regionName), \(info.country)"
   }
    
    private func setFocusGuide() {
        self.mapFocusGuide = UIFocusGuide()
        self.view.addLayoutGuide(self.mapFocusGuide)
        mapFocusGuide.rightAnchor.constraint(equalTo: map.leftAnchor).isActive = true
        mapFocusGuide.leftAnchor.constraint(equalTo: basicInfoTableView.rightAnchor).isActive = true
        mapFocusGuide.bottomAnchor.constraint(equalTo: basicInfoTableView.bottomAnchor).isActive = true
        mapFocusGuide.topAnchor.constraint(equalTo: map.topAnchor).isActive = true
    }
   
   private func showPopup(_ error: Error) {
      let alertViewController = UIAlertController(title: "Info", message: error.localizedDescription, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Chiudi", style: .cancel, handler: nil)
      alertViewController.addAction(okAction)
      
      self.present(alertViewController, animated: true)
   }
   
   @IBAction func getIpButtonPressed(_ sender: UIButton) {
//      ActivityIndicator.shared.show()
      
      SessionManager.shared.getTVInfo(success: { (info) in
         DispatchQueue.main.async {
            self.customDataSource.setTableInfo(info: info.dictionaryInfo)
            self.basicInfoTableView.reloadData()
            self.setPositionLabels(info)
            
            self.setPinOnMap(lat: info.latitude, lon: info.longitude)
            
//            ActivityIndicator.shared.remove()
         }
      }, failure: { error in
         self.showPopup(error)
      })
   }
}
