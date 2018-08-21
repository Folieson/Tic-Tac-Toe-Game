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

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let positionInButtonState = sender.tag-1
        if buttonsState[positionInButtonState] == 0 {
            switch playersTurn {
            case .first:
                buttonsState[positionInButtonState] = playersTurn.rawValue
                playersTurn = .second
                sender.setImage(UIImage(named: "cross.png"), for: [])
                print("First player's turn is over")
            case .second:
                buttonsState[positionInButtonState] = playersTurn.rawValue
                playersTurn = .first
                sender.setImage(UIImage(named: "nought.png"), for: [])
                print("Second player's turn is over")
            }
            print(sender.tag)
        }
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

