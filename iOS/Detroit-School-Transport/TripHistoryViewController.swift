//
//  TripHistory.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/8/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class TripHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //UI Elements
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var submitBackground: UIView!
    @IBOutlet weak var destinationTableView: UITableView!
    
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
        
        //TableView
        self.destinationTableView.delegate = self
        self.destinationTableView.dataSource = self
        destinationTableView.layer.cornerRadius = 10
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

    //MARK: Table View Material
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.destinationTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DestinationTableViewCell
        
        cell.numberBackgroundView.layer.cornerRadius = 20
        cell.numberLabel.text = "\(indexPath.section + 1)"
        cell.fromLabel.text = "From: Destination \(indexPath.section)"
        cell.toLabel.text = "To: Destination \(indexPath.section + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.count)
    }
}
