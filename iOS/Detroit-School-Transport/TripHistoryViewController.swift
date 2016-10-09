//
//  TripHistory.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/8/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import Firebase

class TripHistoryViewController: UIViewController {
    
    //UI Elements
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var submitBackground: UIView!
    
    //Firebase
    var ref: FIRDatabaseReference!
    var distance:Double = 0
    var time:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distance = 6.7
        time = 18
        //Labels
        distanceLabel.text = "Total Distance: \(distance) miles"
        timeLabel.text = "Total Time: \(time) minutes"
        
        //background
        submitBackground.layer.cornerRadius = 100
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
}
