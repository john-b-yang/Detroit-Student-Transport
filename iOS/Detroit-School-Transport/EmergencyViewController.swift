//
//  EmergencyViewController.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/9/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class EmergencyViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var submitBackground: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        submitBackground.layer.cornerRadius = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            var region:MKCoordinateRegion = MKCoordinateRegion();
            if let userLocation = locationManager.location?.coordinate {
                region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            } else {
                let location = CLLocationCoordinate2D(latitude: 42.341755, longitude: -83.060150)
                region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            }
            print("MARKER: \(region)")
            self.mapView.showsUserLocation = true
            self.mapView.setRegion(region, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
