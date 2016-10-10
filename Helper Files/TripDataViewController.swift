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

/*
 FCFDAF - Yellow
 F4989C - Red
 60E1E0 - Blue
 D1FFC6 - Green
 */
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
        
        instantiateBackground(backgroundView: startBackground)
        instantiateBackground(backgroundView: lineBackground)
        instantiateBackground(backgroundView: stopBackground)
        instantiateBackground(backgroundView: endBackground)
        
        headerBackground.backgroundColor = UIColor.init(hexString: "C7EBF0")
    }
    
    func instantiateBackground(backgroundView: UIView) {
        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = UIColor.gray
    }
}
