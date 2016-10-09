//
//  CompletedViewController.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/9/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import UIKit

class CompletedViewController: UIViewController {
    
    @IBOutlet weak var redoBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redoBackground.layer.cornerRadius = 30
    }
}
