//
//  ViewController.swift
//  Tic Tac Toe Game
//
//  Created by Андрей Понамарчук on 20.08.2018.
//  Copyright © 2018 Андрей Понамарчук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // first - cross, second - nought
    enum player: Int {
        case first = 1
        case second = 2
    }
// 0 - empty
    var buttonsState = [0,0,0,0,0,0,0,0,0]
    var playersTurn = player.first
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var activeGame = true
    
    @IBOutlet weak var congratulationLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        congratulationLabel.isHidden = true
        activeGame = true
        buttonsState = [0,0,0,0,0,0,0,0,0]
        playersTurn = player.first
        for i in 1...9 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let positionInButtonState = sender.tag-1
        if buttonsState[positionInButtonState] == 0 && activeGame == true {
            switch playersTurn {
            case .first:
                buttonsState[positionInButtonState] = playersTurn.rawValue
                playersTurn = .second
                sender.setImage(UIImage(named: "cross.png"), for: [])
                checkWinningCombinations(for: "Crosses")
                checkButtonState()
                print("First player's turn is over")
            case .second:
                buttonsState[positionInButtonState] = playersTurn.rawValue
                playersTurn = .first
                sender.setImage(UIImage(named: "nought.png"), for: [])
                checkWinningCombinations(for: "Noughtes")
                checkButtonState()
                print("Second player's turn is over")
            }
            print(sender.tag)
        }
        
    }
    
    
    func checkWinningCombinations (for winner : String) {
        for combination in winningCombinations {
            if buttonsState[combination[0]] != 0 && buttonsState[combination[0]] == buttonsState[combination[1]] && buttonsState[combination[1]] == buttonsState[combination[2]] {
                endGame(for: winner)
            }
        }
    }
    
    func endGame(for winner : String) {
        activeGame = false
        congratulationLabel.isHidden = false
        playAgainButton.isHidden = false
        congratulationLabel.text = "\(winner) has won!"
        UIView.animate(withDuration: 0.5, animations: {
            self.congratulationLabel.center = CGPoint(x: self.congratulationLabel.center.x + 500, y: self.congratulationLabel.center.y)
            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
        })
    }
    
    func checkButtonState () {
        if !buttonsState.contains(0) {
            endGame(for: "No one")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playAgainButton.isHidden = true
        congratulationLabel.isHidden = true
        congratulationLabel.center = CGPoint(x: congratulationLabel.center.x - 500, y: congratulationLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

