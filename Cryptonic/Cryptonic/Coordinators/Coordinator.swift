//
//  Coordinator.swift
//  Cryptic
//
//  Created by Karen Teja on 10/27/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate{
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
}
