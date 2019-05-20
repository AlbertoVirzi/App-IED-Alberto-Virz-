//
//  DettaglioEventoController.swift
//  Alberto Virzì
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class DettaglioEventoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Questo è l'evento da rappresentare sullo schermo
    var evento: Evento?

    //MARK: - Outlets
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var textDescrizione: UITextView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Metto i contenuti dell'evento sui componenti della schermata
        if let eventoDaRappresentare = evento  {
            setupConEvento(eventoDaRappresentare)
        }
        
        //Questa serve per communicare con la collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setupConEvento(_ evento: Evento) {
        
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.copertinaUrl, perImageView: imageCopertina)
        
        labelNome.text = evento.nome
        
        labelData.text = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy")
        
       textDescrizione.text = evento.descrizione
        
        
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


}
