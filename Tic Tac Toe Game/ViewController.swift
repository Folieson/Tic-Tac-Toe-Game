//
//  ViewController.swift
//  Tic Tac Toe Game
//
//  Created by Андрей Понамарчук on 20.08.2018.
//  Copyright © 2018 Андрей Понамарчук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum player {
        case first
        case second
    }
    enum image: String {
        case cross = "cross.png"
        case nought = "nought.png"
    }
    var playersTurn = player.first
    var imageString = "nought.png"
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch playersTurn {
        case .first:
            playersTurn = .second
            
            print("First player's turn is over")
        case .second:
            playersTurn = .first
            print("Second player's turn is over")
        }
        print(sender.tag)
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

