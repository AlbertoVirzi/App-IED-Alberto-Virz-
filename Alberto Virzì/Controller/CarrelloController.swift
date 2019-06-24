//
//  CarrelloController.swift
//  Alberto Virzì
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CarrelloController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelNessunArticolo: UILabel!
    
    //MARK - Setup
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        //Aggiungo il pulsante di chiusura
        
        let chiudi = UIBarButtonItem.init(title: "Chiudi", style: .plain, target: self, action: #selector(buttonChiudi))
        
        navigationItem.rightBarButtonItem = chiudi
        
        setupController()
    }
    
    //MARK - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CartUtility.carrello.count
        
    }
    
    func setupController() {
        //Configurazione della schermata
        
        //Titolo
        if CartUtility.carrello.count > 0 {
            //Carrello pieno
            let numeroArticoli = CartUtility.carrello.count
             navigationItem.title = "Carrello \(numeroArticoli)"
        } else {
            //Carrello vuoto
             navigationItem.title = "Carrello"
        }
        
        //Messaggio nessun articolo nel carrello
        if CartUtility.carrello.count > 0 {
            labelNessunArticolo.isHidden = true
        } else {
            labelNessunArticolo.isHidden = false
        }
        //...
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCarrello") as! CellCarrello
        
        let oggetto = CartUtility.carrello[indexPath.row]
        cell.setupConOggettoAcquistabile(oggetto)
        
        return cell
    }
    
    //MARK: - Editing delle celle della TableView
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //Questa funzione viene richiamata quando l'utente cambia la modalita di editing di una cella, tramite lo swipe to delete
        if editingStyle == .delete {
            //Cancello l'oggetto dal carrello
            
            //Prendo l'oggetto da cancellare
            let oggetto = CartUtility.carrello[indexPath.row]
            CartUtility.rimuoviDalCarrello(oggetto)
            
            //Agiorno la schermata
            setupController()
            
            //Ricarico la tableView
            tableView.reloadData()
        }
    }
    
    //MARK: - Action
    
    @objc func buttonChiudi(){
        dismiss(animated: true)
    }

}


