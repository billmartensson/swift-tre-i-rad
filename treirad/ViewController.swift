//
//  ViewController.swift
//  treirad
//
//  Created by Bill Martensson on 2020-09-14.
//

import UIKit

class ViewController: UIViewController {

    var playerOneTurn = true
    var winnerColor : UIColor?

    @IBOutlet weak var playerTurnLabel: UILabel!
    
    @IBOutlet weak var tile1: UIButton!
    @IBOutlet weak var tile2: UIButton!
    @IBOutlet weak var tile3: UIButton!
    @IBOutlet weak var tile4: UIButton!
    @IBOutlet weak var tile5: UIButton!
    @IBOutlet weak var tile6: UIButton!
    @IBOutlet weak var tile7: UIButton!
    @IBOutlet weak var tile8: UIButton!
    @IBOutlet weak var tile9: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resetGame()
        
        
    }

    @IBAction func clickTile(_ sender: UIButton) {
        
        if(sender.backgroundColor != UIColor.blue)
        {
            return
        }
        

        if(playerOneTurn == true)
        {
            playerOneTurn = false
            sender.backgroundColor = UIColor.red
        } else {
            playerOneTurn = true
            sender.backgroundColor = UIColor.green
        }
        
        if(playerOneTurn)
        {
            playerTurnLabel.text = "PLAYER 1"
        } else {
            playerTurnLabel.text = "PLAYER 2"
        }
        
        checkWon()
    }
    
    func checkWon()
    {
        
        checkRow(t1: tile1, t2: tile2, t3: tile3)
        checkRow(t1: tile4, t2: tile5, t3: tile6)
        checkRow(t1: tile7, t2: tile8, t3: tile9)

        checkRow(t1: tile1, t2: tile5, t3: tile9)
        checkRow(t1: tile3, t2: tile5, t3: tile7)

        checkRow(t1: tile1, t2: tile4, t3: tile7)
        checkRow(t1: tile2, t2: tile5, t3: tile8)
        checkRow(t1: tile3, t2: tile6, t3: tile9)


        if(winnerColor == UIColor.red)
        {
            print("WINNER 1")
            resetGame()
        }
        if(winnerColor == UIColor.green)
        {
            print("WINNER 2")
            resetGame()
        }
    }
    
    func checkRow(t1 : UIButton, t2 : UIButton, t3 : UIButton)
    {
        if(t1.backgroundColor == t2.backgroundColor && t1.backgroundColor == t3.backgroundColor && t1.backgroundColor != UIColor.blue)
        {
            winnerColor = t1.backgroundColor!
        }
    }
    
    func resetGame()
    {
        winnerColor = nil
        
        tile1.backgroundColor = UIColor.blue
        tile2.backgroundColor = UIColor.blue
        tile3.backgroundColor = UIColor.blue
        tile4.backgroundColor = UIColor.blue
        tile5.backgroundColor = UIColor.blue
        tile6.backgroundColor = UIColor.blue
        tile7.backgroundColor = UIColor.blue
        tile8.backgroundColor = UIColor.blue
        tile9.backgroundColor = UIColor.blue
    }

}

