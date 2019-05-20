//
//  MappaControlle.swift
//  Alberto Virzì
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
//Framework che gestisce le mappe
import MapKit

class MappaControlle: UIViewController {
    
    //Classe che gestise le informazioni dell'utente
    let manager = CLLocationManager()
    
    //MARK - Outlets
    @IBOutlet weak var MapView: MKMapView!
    
    //MARK - Setup
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //CAmbio il titolo
        navigationItem.title = "Mappa"
        
        //Richiesta utorizazione condivisione posizione
        manager.requestWhenInUseAuthorization()
        //Mostra la mia posizione sulla mappa
        MapView.showsUserLocation = true
        
        //Aggiungo i pin sulla mappa
        for evento in Database.eventi {
            
            //Creo il pin
            let pin = PinMappa.init(conEvento:evento)
            
            //lo aggiungo sulla mappa
            MapView.addAnnotation(pin)
            
        }
        
    }


}
