//
//  ErrorViewController.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/9/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import UIKit
import Firebase

class ErrorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var submitBackground: UIView!
    @IBOutlet weak var feedbackTextView: UITextView!
    @IBOutlet weak var feedbackTableView: UITableView!
    
    var ref: FIRDatabaseReference!
    let user = "John"
    var complaints:[String] = ["Bus - Bad Condition", "Bus - No Show", "Bus - Wrong Stop", "Bus - Unsafe Individuals", "Driver - Rude/Uncourteous", "Driver - Late/Unprofessional", "Driver - Reckless"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Firebase
        ref = FIRDatabase.database().reference()
        self.ref.child("users/\(user)/issue").setValue("true")
        
        //Format Views
        feedbackTableView.layer.cornerRadius = 10
        feedbackTextView.layer.cornerRadius = 10
        submitBackground.layer.cornerRadius = 100
        
        //Table View
        self.feedbackTableView.delegate = self
        self.feedbackTableView.dataSource = self
        self.feedbackTableView.allowsMultipleSelection = true
        
        //Keyboard Tap Relation
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TripDataViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkClicked(_ sender: AnyObject) {
        let feedback:String = feedbackTextView.text
        if !(feedback.isEmpty) {
            self.ref.child("users/\(user)/complaint").setValue(feedback)
        }
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status and drop into background
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return complaints.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.feedbackTableView.dequeueReusableCell(withIdentifier: "complaintCell", for: indexPath) as! ComplaintTableViewCell
        cell.complaintLabel.text = complaints[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.count)
    }
}
