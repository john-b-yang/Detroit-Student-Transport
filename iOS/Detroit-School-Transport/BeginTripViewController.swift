//
//  BeginTripViewController.swift
//  Detroit-School-Transport
//
//  Second screen
//
//  Created by John Yang on 10/8/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import Firebase
import FirebaseDatabase

class BeginTripViewController: UIViewController, CLLocationManagerDelegate {
    
    //UI Elements
    @IBOutlet weak var trackButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    
    //Location Management and Trip History
    var locationManager: CLLocationManager!
    var timeArray = [String]()
    var locationDictionary: Dictionary = [String: [String: Double]]()
    
    //Firebase Database Reference
    var ref: FIRDatabaseReference!
    let user = "Megan"
    
    //Background Views
    @IBOutlet weak var startBackground: UIView!
    @IBOutlet weak var finishBackground: UIView!
    @IBOutlet weak var reportBackground: UIView!
    
    //Image aka Gif
    @IBOutlet weak var animationImageView: UIImageView!
    var fading = true
    
    //Timer
    var timer = Timer()
    var binaryCounter = 0b0000
    
    //Test Location Array
    var test: [[Double]] = [[10, 10], [20, 20], [30, 30], [40, 40], [50, 50]] //Delete when real coordinates are used
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Image
        animationImageView.image = UIImage(named: "Bus 1")
        
        //Firebase Database Setup
        ref = FIRDatabase.database().reference()
        
        //Getting Permission to use User's Location
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        //background view color
        startBackground.layer.cornerRadius = 25
        finishBackground.layer.cornerRadius = 25
        reportBackground.layer.cornerRadius = 100
    }
    
    /*
     Here we start keeping track of the user's location and comparing it against the
     bus route coordinates.
    */
    @IBAction func didTapTrackButton(_ sender: AnyObject) {
        print("Record")
        let pauseTime = 1.0
        timer = Timer(timeInterval: pauseTime, target: self, selector: #selector(BeginTripViewController.compareLocation), userInfo: nil, repeats: true)
        let anotherTimer = Timer(timeInterval: 0.1, target: self, selector: #selector(BeginTripViewController.fade), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
        RunLoop.current.add(anotherTimer, forMode: RunLoopMode.commonModes)
    }
    
    @IBAction func didTapStopButton(_ sender: AnyObject) {
        //Turn off timer
        timer.invalidate()
        
        //Send Data to Firebase
        self.ref.child("users/\(user)/age").setValue(18)
        self.ref.child("users/\(user)/name").setValue("\(user) Gamino")
        
        //Artificially populate timeArray and locationArray since they are blank
        timeArray = [String(describing: Date()), String(describing: Date()), String(describing: Date())]
        locationDictionary = ["0": ["lat": 40, "long": 50]]
        
        self.ref.child("users/\(user)/times").setValue(timeArray as NSArray)
        self.ref.child("users/\(user)/locations").setValue(locationDictionary as NSDictionary)
    }
    
    //To be amended
    func compareLocation() {
        let currentLocation = locationManager.location
        print("Interval")
        var counter = 0
        for element in test {
            let latDifference = abs(Double((currentLocation?.coordinate.latitude)!) - element[0]) //Must be amended later
            let longDifference = abs(Double((currentLocation?.coordinate.longitude)!) - element[1]) //Must be amended later
            
            let epsilon: Double = 20 //Error margin of coordinates
            
            if (latDifference < epsilon && longDifference < epsilon) {
                timeArray[counter] = (String(describing: currentLocation?.timestamp))
                locationDictionary[String(counter)] = ["lat": Double((currentLocation?.coordinate.latitude)!), "long": Double((currentLocation?.coordinate.longitude)!)]
                counter += 1
            }
        }
    }
    
    func fade() {
        if(fading) {
            animationImageView.alpha -= 0.2
        } else {
            animationImageView.alpha += 0.2
        }
        if(animationImageView.alpha >= 1 || animationImageView.alpha <= 0.2) {
            fading = !fading
        }
    }
}
