//
//  GameView.swift
//  HeroesLeague
//
//  Created by Liron Ezer on 23/04/2022.
//

import UIKit

class GameView: UIViewController {
    
    @IBOutlet weak var panel_LBL_round: UILabel!
    @IBOutlet weak var panel_LBL_player1: UILabel!
    @IBOutlet weak var panel_LBL_player2: UILabel!
    @IBOutlet weak var panel_LBL_score1: UILabel!
    @IBOutlet weak var panel_LBL_score2: UILabel!
    @IBOutlet weak var panel_IMG_card1: UIImageView!
    @IBOutlet weak var panel_IMG_card2: UIImageView!
    
    var player1: String = "Player1"
    var player2: String = "Player2"
    var round: Int = 0
    var score1: Int = 0
    var score2: Int = 0
    var timer = Timer();
    let images = [#imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "dr-octopus"), #imageLiteral(resourceName: "thor"), #imageLiteral(resourceName: "loki"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "joker"), #imageLiteral(resourceName: "iron-man"), #imageLiteral(resourceName: "mandarin"), #imageLiteral(resourceName: "cap-america"), #imageLiteral(resourceName: "red-skull")]

    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 183/255, green: 183/255, blue: 164/255, alpha: 1)
        super.viewDidLoad()
        setPlayers()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 2,repeats: true , block: {_ in
            self.drawCards();
            self.roundWinner();
            if (self.checkGameOver()) {
                self.timer.invalidate();
                self.gameOver();
            }
        })
        

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
    
    func setPlayers() {
        panel_LBL_player1.text  = player1
        panel_LBL_player2.text = player2
    }
    
    func drawCards() {
        panel_IMG_card1.image = images.randomElement()
        panel_IMG_card2.image = images.randomElement()
        
        round += 1
        panel_LBL_round.text = "Round: \(self.round)"
    }
    
    func roundWinner() {
        var card1: Int = images.firstIndex(of:panel_IMG_card1.image!)!
        var card2: Int = images.firstIndex(of:panel_IMG_card2.image!)!
    
        card1 = heroOrVillain(index: card1)
        card2 = heroOrVillain(index: card2)
        
        if (card1 > card2) {
            score1+=1
        }
        else if (card2 > card1) {
            score2+=1
        }
        else {
        }
        
        panel_LBL_score1.text = "\(score1)"
        panel_LBL_score2.text = "\(score2)"
    }
    
    func heroOrVillain(index: Int) -> Int {
        if (index % 2 == 0) {
            return 1
        }
        else {
            return 0
        }
        
    }
    
    func checkGameOver() -> Bool {
        if (score1 >= 5 || score2 >= 5) {
            return true
        }
        else {
            return false
        }
    }
    
    func gameOver() {
        if (score1 > score2) {
            
        }
        else if (score2 > score1) {
            
        }
        else {
            
        }
        
    }

}
