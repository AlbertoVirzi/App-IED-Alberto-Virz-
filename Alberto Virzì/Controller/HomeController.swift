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
        
        listaEventi = Database.eventi
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Aggiugo il pulsante del carello
        aggiornaPulsanteCarrello()
    }
    
    //MARK - Funzioni
    
    func aggiornaPulsanteCarrello() {
        
        let buttonCarrello = UIBarButtonItem.init(image: CartUtility.iconaCarrello(), style: .plain, target: self, action: #selector(apriCarrello))
        navigationItem.rightBarButtonItem = buttonCarrello
    }
    
    @objc func apriCarrello() {
        
        //Istanzio lo storyboard che contiene il view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Istanzio il viw controller del carrello
        let viewController = storyboard.instantiateViewController(withIdentifier: "CarrelloController")
        
        //Creo un navigation Controller (per avere la barra superiore)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        //Presento il view controller come model
        present(navigationController, animated: true)
    }

}
