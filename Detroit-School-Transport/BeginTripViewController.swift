//
//  BeginTripViewController.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/8/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import Firebase

class BeginTripViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var trackButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var locationManager: CLLocationManager!
    //var tripHistory = [CLLocationCoordinate2D: Timer]() //CLLocationCoordinate2D doesn't conform?
    var tripHistory = [Int: Date]()
    
    var timer = Timer()
    var binaryCounter = 0b0000
    
    var test: [[Double]] = [[10, 10], [20, 20], [30, 30], [40, 40], [50, 50]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Getting Permission to use User's Location
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        trackButton.titleLabel?.text = "Begin Tracking"
        trackButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    /*
     Here we start keeping track of the user's location and comparing it against the
     bus route coordinates.
    */
    @IBAction func didTapTrackButton(_ sender: AnyObject) {
        print("Record")
        let pauseTime = 1.0
        timer = Timer(timeInterval: pauseTime, target: self, selector: #selector(BeginTripViewController.compareLocation), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @IBAction func didTapStopButton(_ sender: AnyObject) {
        timer.invalidate()
    }
    
    
    func compareLocation() {
        let currentLocation = locationManager.location
        print("Interval")
        for element in test {
            let latDifference = abs(Double((currentLocation?.coordinate.latitude)!) - element[0]) //Must be amended later
            let longDifference = abs(Double((currentLocation?.coordinate.longitude)!) - element[1]) //Must be amended later
            let epsilon: Double = 20 //Error margin of coordinates
            if (latDifference < epsilon && longDifference < epsilon) {
                //tripHistory[currentLocation] = currentLocation?.timestamp //MARK: Doesn't work (key issue)
                tripHistory[0] = currentLocation?.timestamp
            }
        }
    }
}
