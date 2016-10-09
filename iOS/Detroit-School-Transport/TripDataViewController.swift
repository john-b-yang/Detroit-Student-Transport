//
//  TripDataViewController.swift
//  Detroit-School-Transport
//
//  Where you enter in information about trip, landing page. 
//
//  Created by John Yang on 10/8/16.
//  Copyright © 2016 John Yang. All rights reserved.
//



import Foundation
import Firebase
import UIKit
import CoreLocation

class TripDataViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var headerBackground: UIView!
    @IBOutlet weak var startBackground: UIView!
    @IBOutlet weak var lineBackground: UIView!
    @IBOutlet weak var stopBackground: UIView!
    @IBOutlet weak var endBackground: UIView!
    @IBOutlet weak var buttonBackground: UIView!
    @IBOutlet weak var goButton: UIButton!
    
    
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var lineTextField: UITextField!
    @IBOutlet weak var stopTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var DataArray:NSMutableArray=["First","Second","Third","Fourth"]
    var ref: FIRDatabaseReference!
    
    public var property:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        retrieveBusStops()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        //Background Views
        instantiateBackground(backgroundView: startBackground)
        instantiateBackground(backgroundView: lineBackground)
        instantiateBackground(backgroundView: stopBackground)
        instantiateBackground(backgroundView: endBackground)
    
        startBackground.backgroundColor = UIColor.init(hexString: "F4989C")
        lineBackground.backgroundColor = UIColor.init(hexString: "60E1E0")
        stopBackground.backgroundColor = UIColor.init(hexString: "DBF4A7")
        endBackground.backgroundColor = UIColor.init(hexString: "F4D35E")
        
        greetingLabel.text = "Hello, John"
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TripDataViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func firebaseConfig() {
        var name = ""
        ref.child("users").child("John").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            name = value?["name"] as! String
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func instantiateBackground(backgroundView: UIView) {
        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = UIColor.gray
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status and drop into background
        view.endEditing(true)
    }
}
