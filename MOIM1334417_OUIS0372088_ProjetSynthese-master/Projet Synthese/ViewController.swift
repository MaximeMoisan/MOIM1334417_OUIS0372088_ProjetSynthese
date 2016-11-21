//
//  ViewController.swift
//  Projet Synthese
//
//  Created by Etudiant on 16-11-14.
//  Copyright © 2016 Etudiant. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    private var compteur = 0
    
    
    
    
    private var dic_resultats = Dictionary<String, Any>()
    private var _listeDesStreams: JSON!
    
    let URLTwitchStream = "https://api.twitch.tv/kraken/streams?client_id=atj2yoy7umhkzqm7d1iu51h0no1v6ai"
    
    
    
    func obtenirLesDonnées(_ url:String) {
        compteur += 1
        let uneURL = URL(string: url)!  //Danger!
        
        /// Exécuter le traitement suivant en parallèle
        DispatchQueue.main.async ( execute: {
            if let _données = NSData(contentsOf: uneURL) as? Data {
                
                let json = JSON(data: _données)
                print("Conversion JSON réussie")
                // Créer un tableau à partir du champ 'resultats'
                let listeDesStreams = json["array"]["streams"].arrayValue
                print(json)
                print(listeDesStreams)
                
            } else
            {
                print("\n\n#Erreur: impossible de lire les données via:\(self.URLTwitchStream)\n\n")
            } // if let _données = NSData
        }) // DispatchQueue.main.async
    } // obtenirLesDonnées(_ url:String)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(URLTwitchStream)
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.doTimer), userInfo: nil, repeats: true)
        obtenirLesDonnées(URLTwitchStream)
    }
    
    func doTimer(){
        obtenirLesDonnées(URLTwitchStream)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
