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

class MappaControlle: UIViewController, MKMapViewDelegate {
    
    //Classe che gestise le informazioni dell'utente
    let manager = CLLocationManager()
    
    //MARK - Outlets
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var buttonCentraPosizioneUtente: UIButton!
    
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
            
            //
            MapView.delegate = self
            
        }
        
        //UI
        UIutility.arrotondaAngoliCerchio(buttonCentraPosizioneUtente)
        
    }

    // MARK: - MapView Delegate
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        //Controllo se è stato selezionato un oggetto PinMappa
        if let pin = view.annotation as? PinMappa {
            
            //Prendo l'evento rappresentato dal pin
            if let eventoSelezionato = pin.eventoAssociato {
                
                //Calcolo la distanza dell'evento dalla mia posizione
                if let miaPosizione = mapView.userLocation.location {
                    
                    let latitudine = eventoSelezionato.coordinate?.latitude ?? 0.0
                    let longitudine = eventoSelezionato.coordinate?.longitude ?? 0.0
                    
                    let posizioneEvento = CLLocation.init(latitude: latitudine, longitude: longitudine)
                    
                    let distanzaInMetri = miaPosizione.distance(from: posizioneEvento)
                    let distanzaInChilometri = distanzaInMetri / 1000.0
                    let stringaDistanza = String.init(format: "%.1f", distanzaInChilometri)
                    print("Distanzadall'evento: \(stringaDistanza) Km")
                    
                }
                
                //1Creo un riferimento allo storyboard dove risiede il viewController
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                
                //2istanzio il viewController attraverso il suo identifier
                let ViewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
                
                //3Passo l'evento selezionato al view controller
                if let dettaglioController = ViewController as? DettaglioEventoController {
                    
                    dettaglioController.evento = eventoSelezionato
                    
                    //3B Passo anche la posizione dell'utente
                    dettaglioController.miaPosizione = mapView.userLocation.location
                    
                }
                
                
                //4Apro il view controller di dettaglio
                navigationController?.pushViewController(ViewController, animated: true)
                
            }
            
        }
    }
    
    @IBAction func buttonCentraPosizioneUtente(_ sender: Any) {
        
        //Prendo le coordinate dell'utente
        let coordinate =  MapView.userLocation.coordinate
        //Controllo che siano valide
        if CLLocationCoordinate2DIsValid(coordinate){
            
            //Controllo che non sono nell'oceamo atlantico
            if coordinate.latitude != 0.0, coordinate.longitude != 0.0 {
                
                //Tutto ok, centro la macchina
                MapView.setCenter(coordinate, animated:true)
                
            } else {
                //lancio una richiesta di soccorso
            }
            
        }
        
    }
    
    
    

}
