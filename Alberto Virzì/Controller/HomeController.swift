//
//  HomeController.swift
//  Alberto Virzì
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var listaEventi: [Evento] = []
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lista Eventi"

        tableView.delegate = self
        tableView.dataSource = self
        
        creaEventiDiProva()
    }
    
    func creaEventiDiProva() {
        let uno = Evento()
        uno.nome = "Lezione di App Design"
        uno.descrizione = "Una stupenda lezione di app design con il prof Balestrieri"
        uno.indirizzo = "Via Alcamo 11, Roma, Italy"
        uno.data = DateUtility.stringa(conStringa: "02/03/2019" , formato: "dd/MM/yyyy" )
        uno.prezzo = 55.0
        uno.copertinaUrl = "https://images.unsplash.com/photo-1521391406205-4a6af174a4c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1675&q=80"
        
        //Creo un oggetto acquistabile
        
        let oggettoUno = OggettoAcquistabile()
        
        oggettoUno.immagineUrl = "https://images.unsplash.com/photo-1508921234172-b68ed335b3e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
        oggettoUno.nome = "Biglietto"
        oggettoUno.disponibilita = 1
        oggettoUno.prezzo = 999.99
        
        uno.oggettiAcquistabili = [oggettoUno]
        
        listaEventi.append(uno)
        
        let due = Evento()
        due.nome = "Lezione di Cucina"
        due.descrizione = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec luctus velit. Phasellus nec elit tristique, fermentum velit finibus, mattis nunc. Curabitur vitae eleifend diam. Cras porttitor scelerisque posuere. Vivamus imperdiet risus eget dictum pharetra. Cras semper nisi eu dictum iaculis. Mauris venenatis, leo in tempor pharetra, mi ris"
        due.indirizzo = "Via Casilina 15, Roma, Italy"
        due.data = Date()
        due.prezzo = 75.0
        due.copertinaUrl = "https://images.unsplash.com/photo-1513791053024-3b50799fdd7b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80"
        
        //Creo un oggetto acquistabile
        
        let oggettoDue = OggettoAcquistabile()
        
        oggettoDue.immagineUrl = "https://images.unsplash.com/photo-1517503733723-8ea1cf616798?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
        oggettoDue.nome = "Maglietta"
        oggettoDue.disponibilita = 2
        oggettoDue.prezzo = 1
        
        uno.oggettiAcquistabili = [oggettoUno, oggettoDue]
        
        listaEventi.append(due)
        
        let tre = Evento()
        tre.nome = "Lezione di HTML"
        tre.descrizione = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec luctus velit. Phasellus nec elit tristique, fermentum velit finibus, mattis nunc. Curabitur vitae eleifend diam. Cras porttitor scelerisque posuere. Vivamus imperdiet risus eget dictum pharetra. Cras semper nisi eu dictum iaculis. Mauris venenatis, leo in tempor pharetra, mi ris"
        tre.indirizzo = "Via Casilina 15, Roma, Italy"
        tre.data = Date()
        tre.prezzo = 75.0
        tre.copertinaUrl = "https://images.unsplash.com/photo-1518773553398-650c184e0bb3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
        
        listaEventi.append(tre)
    }
    
    // MARK: - TableView delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //in questa funzione ritorna il numero d celle da disegnare
        return listaEventi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //in questa funzione l'home controller comunica alla table view come deve disegnare ogni riga (con qali Ui, con quali dati ecc.)
        let cella = tableView.dequeueReusableCell(withIdentifier: "CellEvento") as! CellEvento
        
        let evento = listaEventi[indexPath.row]
        
        cella.setupConEvento(evento)
        
        return cella
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //recupera l'evento associato alla cella selezionato dall'utente
        let eventoSelezionato = listaEventi[indexPath.row]
        
        //Creo la prossima schermata di dettaglio dell'evento
        
        //1Creo un riferimento allo storyboard dove risiede il viewController
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        //2istanzio il viewController attraverso il suo identifier
        let ViewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
        
        //3Passo l'evento selezionato al view controller
        if let dettaglioController = ViewController as? DettaglioEventoController {
            
            dettaglioController.evento = eventoSelezionato
            
        }
        
        //4Apro il view controller di dettaglio
        navigationController?.pushViewController(ViewController, animated: true)
        
        
    }

}
