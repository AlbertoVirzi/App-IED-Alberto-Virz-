//
//  Evento.swift
//  Alberto Virzì
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

class Evento: OggettoAcquistabile {
    
    
    var descrizione: String?
    
    var data: Date?
    
    var indirizzo: String?
    
    var coordinate: CLLocationCoordinate2D?
    
    var oggettiAcquistabili: [OggettoAcquistabile]?
    
}
