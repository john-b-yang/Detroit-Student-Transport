//
//  TripDataViewController.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/8/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class TripDataViewController: UIViewController, UITextFieldDelegate {
    
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
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let dropdown = DropDown.init(framea: CGRect(x: textField.frame.origin.x + 35, y: textField.frame.origin.y + 110, width: textField.frame.width, height: 200), SetArray: DataArray)
        self.view.addSubview(dropdown)
        let property = dropdown.AddArray
        print(property)
        return false;
    }
}
