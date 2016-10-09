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
import Firebase

class EmergencyViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var submitBackground: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = FIRDatabase.database().reference()
        let user = "John"
        self.ref.child("users/\(user)/emergency").setValue("true")
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        submitBackground.layer.cornerRadius = 100
        
        displayAlert(alertTitle: "Warning", alertMessage: "Please do the following\n1. Seek Safety\n2. Call for help\n3. Stay in Place")
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
    
    func displayAlert(alertTitle: String, alertMessage: String){
        //        var alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        //        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        //        self.presentViewController(alert, animated: true, completion: nil)
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
