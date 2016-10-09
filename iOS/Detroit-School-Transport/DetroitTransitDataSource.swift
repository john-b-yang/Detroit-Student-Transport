//
//  DetroitTransitDataSource.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/9/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import Foundation
import UIKit

// stops array that is returned should contain all the stop metadata as well, not just stop IDs
func retrieveStopsNearLocation() {
    let url = URL(string: "https://ddot-beta.herokuapp.com/api/api/where/stops-for-route/DDOT_6419.json?key=MHACKS8")
    
    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
        guard error == nil else {
            print(error)
            return
        }
        guard let data = data else {
            print("Data is empty")
            return
        }
        
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        print(json)
    }
    
    task.resume()
}


// returns all stop metadata too
//func retrieveStopsOnRoute(String route) -> [String: ] {
//    var result = {}
//    let url = URL(string: "https://ddot-beta.herokuapp.com/api/api/where/stops-for-route/DDOT_6419.json?key=MHACKS8")
//    
//    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//        guard error == nil else {
//            print(error)
//            return
//        }
//        guard let data = data else {
//            print("Data is empty")
//            return
//        }
//        
//        result = try! JSONSerialization.jsonObject(with: data, options: [])["data"]["references"]["stops"]
//        print(json)
//    }
//    
//    task.resume()
//   
//}
//
//func retrieveEarliest
