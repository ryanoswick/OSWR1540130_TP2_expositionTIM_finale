//
//  splashScreen.swift
//  oswr1540130_tp2_exposition
//
//  Created by gitt on 17-11-09.
//  Copyright © 2017 Exposition Ryan Oswick. All rights reserved.
//

import UIKit

class splashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0){
            self.tournerLaPage()
        }//DispatchQueue
    }//viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }//didReceiveMemoryWarning
    
    func tournerLaPage(){
        performSegue(withIdentifier: "versAffiche", sender: nil)
    }//tournerLaPage
    
}//class splashScreen: UIViewController
