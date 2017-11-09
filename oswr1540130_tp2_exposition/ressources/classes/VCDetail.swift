//
//  VCDetail.swift
//  oswr1540130_tp2_exposition
//
//  Created by git on 17-11-08.
//  Copyright © 2017 Exposition Ryan Oswick. All rights reserved.
//

import UIKit

class VCDetail: UIViewController {

    @IBOutlet weak var nomAffiche: UILabel!
    @IBOutlet weak var imageAffiche: UIImageView!
    @IBOutlet weak var descriptionAffiche: UITextView!
    @IBOutlet weak var detailBackground: UIImageView!
    
    @IBAction func retourALaListe(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//retourALaListe
    
    // Propriété pour recevoir les informations de la sélection
    var informationsDeLafficheCourant = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("# Nous avons reçu les données suivantes:\(informationsDeLafficheCourant)\n")
        
        nomAffiche.text         = informationsDeLafficheCourant[0]
        imageAffiche.image      = UIImage(named: informationsDeLafficheCourant[1])
        descriptionAffiche.text = informationsDeLafficheCourant[2]
        detailBackground.image  = UIImage(named: informationsDeLafficheCourant[1])
        
    }//viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }//didReceiveMemoryWarning()

}//VCDetail
