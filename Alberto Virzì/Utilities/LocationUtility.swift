//
//  LocationUtility.swift
//  Alberto Virzì
//
//  Created by IED Student on 27/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

class LocationUtility {
    
    static func distanza(da: CLLocationCoordinate2D?, a: CLLocationCoordinate2D?) -> CLLocationDistance? {
        
        //Controllo che i dati passati siano validi
        guard let da = da, let a = a else {
            
            //Condizione non valida
            return nil
            
        }
        
        guard controlloCoordinate(da), controlloCoordinate(a) else {
            
            //Condizione non valida
            return nil
            
        }
        
        //Calcola la distanza
        let locationDa = CLLocation(latitude: da.latitude, longitude: da.longitude)
        let locationA = CLLocation(latitude: a.latitude, longitude: a.longitude)
        
        return locationDa.distance(from: locationA)
        
        
    }
    
    //avvia la navigazione con la mappa di sistema
    static func navigaVerso(evento: Evento?) {
        
        guard let coordinate = evento?.coordinate, controlloCoordinate(coordinate) else {
            return
        }
        
        //Passo le coordinate agli oggetti di sistema per le mappe
        let placemark = MKPlacemark.init(coordinate: coordinate)
        
        let item = MKMapItem.init(placemark: placemark)
        item.name = evento?.nome
        
        item.openInMaps(launchOptions: nil)
        
    }
    
    //Restituisce true se le coordinate passate sono valide
    static func controlloCoordinate(_ coordinate: CLLocationCoordinate2D?) -> Bool {
        
        //Controllo che i dati passati siano validi
        guard let coordinate = coordinate else {
            
            //Condizione non valida
            return false
            
        }
        
        guard CLLocationCoordinate2DIsValid(coordinate) else {
            
            //Condizione non valida
            return false
            
        }
        
        guard coordinate.latitude != 0.0, coordinate.longitude != 0.0 else {
            
            //Condizione non valida
            return false
            
        }
        
        return true
        
    }

}
