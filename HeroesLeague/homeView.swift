//
//  ViewController.swift
//  HeroesLeague
//
//  Created by Liron Ezer on 23/04/2022.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var panel_LBL_player1: UITextField!
    @IBOutlet weak var panel_LBL_player2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 183/255, green: 183/255, blue: 164/255, alpha: 1)
    }
    
    override public var shouldAutorotate: Bool {
       return false
     }
     override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       return .landscapeRight
     }
     override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
       return .landscapeRight
     }

    @IBAction func startClicked(_ sender: Any) {
        if (panel_LBL_player1.text == "") {
            panel_LBL_player1.text = "Player1"
        }
            
        if (panel_LBL_player2.text == "") {
            panel_LBL_player2.text = "Player2"
        }
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameView
        vc.player1 = panel_LBL_player1.text!
        vc.player2 = panel_LBL_player2.text!
        present(vc, animated: true)
        
        
        
        
    }
    
}

