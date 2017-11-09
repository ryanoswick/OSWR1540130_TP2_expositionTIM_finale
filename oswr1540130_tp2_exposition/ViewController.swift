//
//  ViewController.swift
//  oswr1540130_tp2_exposition
//
//  Created by git on 17-11-08.
//  Copyright © 2017 Exposition Ryan Oswick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
 
    //tableau des données pour les affiches
    var tableauDonnees = [Array<String>]()
    
    @IBOutlet weak var CVAffiche: UICollectionView!
    
    @IBOutlet weak var messageNBAffiches: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(passerAuMenuPrincipal), userInfo: nil, repeats: false)
        print("timer marche")
        
        //charger les données du tableau
        let pathFichierPlist = Bundle.main.path(forResource: "lesDonnes", ofType: "plist")!
        tableauDonnees = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
        //le message pour le nombre d'affiches
        messageNBAffiches.text = "Il y a " + String(tableauDonnees.count) + " affiches dans la collection"
    }//viewDidLoad()
    
    //@objc func passerAuMenuPrincipal(){
        //performSegue(withIdentifier: "versAffiche", sender: self)
    //} // passerAuMenuPrincipal
    
    // MARK: - Les méthodes de protocoles de UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableauDonnees.count
    }//numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var celluleCourante:CVCAffiche
        
        celluleCourante = collectionView.dequeueReusableCell(withReuseIdentifier: "modeleCelluleAffiche", for:indexPath) as! CVCAffiche
        celluleCourante.afficheImage.image = UIImage(named: tableauDonnees[(indexPath as NSIndexPath).row][1])
        celluleCourante.afficheTitle.text = tableauDonnees[(indexPath as NSIndexPath).row][0]
        
        return celluleCourante
    
    }//cellForItemAt indexPath

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }//didReceiveMemoryWarning()

    // Méthode exécutée automatiquement avant un segue
    
    //MARK:- Préparer le déplacement (segue)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1 - Déterminer l'index de la sélection à partir de la cellule reçue en paramètre (sender)
        let selection = CVAffiche.indexPath(for: sender as! UICollectionViewCell)!.row
        print("# Exécution de la méthode: prepareForSegue pour la cellule numéro: \(selection)\n")
        // 2 - Créer un objet pointant sur l'instance de classe de la destination
        let destination = segue.destination as! VCDetail
        
        // 3 - Passer les informations au controleur de destination
        destination.informationsDeLafficheCourant = tableauDonnees[selection]
    } // prepare(for segue: ...)
    
}//viewController

