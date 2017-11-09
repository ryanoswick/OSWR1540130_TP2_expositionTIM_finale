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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //charger les données du tableau
        let pathFichierPlist = Bundle.main.path(forResource: "lesDonnes", ofType: "plist")!
        tableauDonnees = NSArray(contentsOfFile: pathFichierPlist) as! Array
        
    }//viewDidLoad()
    
    // MARK: - Les méthodes de protocoles de UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableauDonnees.count
    }//numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var celluleCourante:CVCAffiche
        
        
        celluleCourante = collectionView.dequeueReusableCell(withReuseIdentifier: "modeleCelluleAffiche", for:indexPath) as! CVCAffiche
        
        celluleCourante.afficheImage.image = UIImage(named: tableauDonnees[(indexPath as NSIndexPath).row][1])
        
        return celluleCourante
    }//cellForItemAt indexPath

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//didReceiveMemoryWarning()

    // Méthode exécutée automatiquement avant un segue
    
    //MARK:- Préparer le déplacement (segue)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Note: Il faut avoir renseigné un @IBOutlet sur le UICollectionView
        
        // 1 - Déterminer l'index de la sélection à partir de la cellule reçue en paramètre (sender)
        let selection = CVAffiche.indexPath(for: sender as! UICollectionViewCell)!.row
        print("# Exécution de la méthode: prepareForSegue pour la cellule numéro: \(selection)\n")
        // 2 - Créer un objet pointant sur l'instance de classe de la destination
        let destination = segue.destination as! VCDetail
        
        // 3 - Passer les informations au controleur de destination
        destination.informationsDeLafficheCourant = tableauDonnees[selection]
    } // prepare(for segue: ...)
    
}//viewController
