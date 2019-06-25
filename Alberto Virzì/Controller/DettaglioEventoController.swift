//
//  DettaglioEventoController.swift
//  Alberto Virzì
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

class DettaglioEventoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Questo è l'evento da rappresentare sullo schermo
    var evento: Evento?
    
    //La posizione dell'utente connesso
    var miaPosizione: CLLocation?

    //MARK: - Outlets
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var textDescrizione: UITextView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var labelDistanza: UILabel!
    
    @IBOutlet weak var labelTemperatura: UILabel!
    @IBOutlet weak var labelTemperaturaDescrizione: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapButton: UIButton!
    
    @IBOutlet weak var buttonAcquistaBiglietto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check meteo Roma
        //Network.richiestaMeteoEvento(evento)

        // Do any additional setup after loading the view.
        
        //Metto i contenuti dell'evento sui componenti della schermata
        if let eventoDaRappresentare = evento  {
            setupConEvento(eventoDaRappresentare)
        }
        
        //Questa serve per communicare con la collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //UI
        mapButton.setTitle(" ", for: .normal)
        
        //
        UIutility.arrotondaAngoli(buttonAcquistaBiglietto,raggio: 6.0)
        
    }
    
    func setupConEvento(_ evento: Evento) {
        
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.immagineUrl, perImageView: imageCopertina)
        
        labelNome.text = evento.nome
        
        labelData.text = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy")
        
        textDescrizione.text = evento.descrizione
        
        if let distanza = LocationUtility.distanza(da: evento.coordinate, a: miaPosizione?.coordinate){
            
            //Scrivo la distanza sul label
            let distanzaInChilometri = distanza / 1000.0
            let stringaDistanza = String(format: "%.1f", distanzaInChilometri)
            labelDistanza.text = "Levento è a \(stringaDistanza) km da te"
            
        }
        
        labelTemperatura.text = "Caricamento Meteo "
        labelTemperaturaDescrizione.text = "Caricamento Meteo "
        
        Network.richiestaMeteoEvento(evento) {
            
            //Questa
            (meteo) in
            
            if let temperatura = meteo?.temperatura{
                
                if let descrizione = meteo?.descrizione {
                    
                    self.labelTemperatura.text = "\(temperatura)"
                    self.labelTemperaturaDescrizione.text = "\(descrizione)"
                    
                }
                
            }
            
            
        }
        
        //Metto il pin sulla mappa
        
        //Creo il pin
        let pin = PinMappa.init(conEvento:evento)
        
        //lo aggiungo sulla mappa
        mapView.addAnnotation(pin)
        
        //Centro sul Pin
        if let coordinate = evento.coordinate {
            
            //Centro e zoomo con la camera
            let camera = mapView.camera
            camera.centerCoordinate = coordinate
            camera.altitude = 500
            mapView.setCamera(camera, animated: true)
            //mapView.setCenter(coordinate, animated: true)
        
        }
        
        mapView.showsUserLocation = true
        
    }
    
    //MARK: - CollectionView delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //il numero di celle che deve disegnare la collectionView
        return evento?.oggettiAcquistabili?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cella = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOggettoAcquistabile", for: indexPath) as! CellOggettoAcquistabile
        
        let oggetto = evento?.oggettiAcquistabili?[indexPath.item]
        
        cella.setupConOggettoAcquistabile(oggetto)
        
        return cella
        
    }
    
    //MARK: - CollectionView layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let altezza = collectionView.frame.size.height
        
        let larghezzaTotale = collectionView.frame.size.width
        let larghezza = larghezzaTotale * 0.7
        
        return CGSize(width: larghezza, height: altezza)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Prendo l'oggetto d'array di acquistabili del collection view
        guard let oggetto = evento?.oggettiAcquistabili?[indexPath.item] else {
            return
        }
        chiediConfermaAcquisto(oggetto: oggetto)
    }
    
    //MARK - ACTION
    @IBAction func mapButton(_ sender: Any) {
        
        alertUtility.mostraAlertDiConferma(conTitolo: "Vuoi navigare verso l'evento", messaggio: evento?.indirizzo, viewController: self) { (sceltaUtente) in
            
            if sceltaUtente{
                
                //L'utente ha scelto si
                LocationUtility.navigaVerso(evento: self.evento)
                
            }
            
        }
        //LocationUtility.navigaVerso(evento: evento)
        
    }
    //Acquista il biglietto in evento
    @IBAction func buttonAcquistaBiglietto(_ sender: Any) {
        
        chiediConfermaAcquisto(oggetto: evento!)
        
    }
    
    func chiediConfermaAcquisto(oggetto: OggettoAcquistabile){
        
        //1 Mostriamo l'alert di conferma
        alertUtility.mostraAlertDiConferma(conTitolo: "Vuoi Acquistarlo", messaggio: oggetto.nome, viewController: self) { (sceltaUtente) in
            if sceltaUtente {
                
                //2 Se l'utente accetta lo aggiungiamo al carrello
                CartUtility.aggiungiAlCarrello(oggetto)
            }
        }
    }
    

}
