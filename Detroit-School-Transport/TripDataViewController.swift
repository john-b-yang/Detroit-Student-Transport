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

class TripDataViewController: UIViewController {
    
    @IBOutlet weak var headerBackground: UIView!
    @IBOutlet weak var startBackground: UIView!
    @IBOutlet weak var lineBackground: UIView!
    @IBOutlet weak var stopBackground: UIView!
    @IBOutlet weak var endBackground: UIView!
    @IBOutlet weak var buttonBackground: UIView!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instantiateBackground(backgroundView: headerBackground)
        instantiateBackground(backgroundView: startBackground)
        instantiateBackground(backgroundView: lineBackground)
        instantiateBackground(backgroundView: stopBackground)
        instantiateBackground(backgroundView: endBackground)
        
        headerBackground.backgroundColor = UIColor.init(hexString: "F4989C")
    }
    
    func instantiateBackground(backgroundView: UIView) {
        backgroundView.layer.cornerRadius = 5
        backgroundView.backgroundColor = UIColor.gray
    }
}
