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
    
    var player1:String = "Player1"
    var player2:String = "Player2"
    var score1 : Int = 0
    var score2 : Int = 0
    let images = [#imageLiteral(resourceName: "spider-man"), #imageLiteral(resourceName: "dr-octopus"), #imageLiteral(resourceName: "thor"), #imageLiteral(resourceName: "loki"), #imageLiteral(resourceName: "batman"), #imageLiteral(resourceName: "joker"), #imageLiteral(resourceName: "iron-man"), #imageLiteral(resourceName: "mandarin"), #imageLiteral(resourceName: "cap-america"), #imageLiteral(resourceName: "red-skull")]

    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 183/255, green: 183/255, blue: 164/255, alpha: 1)
        super.viewDidLoad()
        startGame()
    }
    
    
    func startGame() {
        while (!checkGameOver()) {
            drawCards()
            roundWinner()
        }
        gameOver()
        
    }
    
    func drawCards() {
        panel_IMG_card1.image = images.randomElement()
        panel_IMG_card2.image = images.randomElement()
    }
    
    func roundWinner() {
        var card1: Int = images.firstIndex(of:panel_IMG_card1.image!)!
        var card2: Int = images.firstIndex(of:panel_IMG_card2.image!)!
        card1 = heroOrVillain(index: card1)
        card2 = heroOrVillain(index: card2)
        
        if (card1 > card2) {
            score1+=1
            panel_LBL_score1.text = "\(score1)"
        }
        else if (card2 > card1) {
            score2+=1
            panel_LBL_score2.text = "\(score2)"
        }
    

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
        if (score1 >= 15 || score2 >= 15) {
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
