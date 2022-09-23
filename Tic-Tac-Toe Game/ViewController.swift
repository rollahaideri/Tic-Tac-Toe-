//
//  ViewController.swift
//  Tic-Tac-Toe Game
//
//  Created by Rohullah Haideri on 2022-09-15.
//

import UIKit

class ViewController: UIViewController {
    
    // Determining who's turn it is
    enum Turn{
        case XMark
        case OMark
    }
   
    
    @IBOutlet weak var turnLable: UILabel!
    
    @IBOutlet weak var XScore: UILabel!
    
    @IBOutlet weak var OScore: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    
    var lastTurn = Turn.OMark           //Who' turn was in each game
    var currentTurn = Turn.OMark        //Who' turn is in now
    
    // This symbols or charactars will be use to players
    var OSymbol = "O"
    var XSymbol = "X"
    
    var board = [UIButton]()
    
    var XPoints = 0
    var OPoints = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }
    
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addMove(sender)
        if checkGameResult(XSymbol)
                {
                    XPoints += 1
                    resultAlert(title: "X Player Win!")
                    XScore.text = String(XPoints)
                }
                
                if checkGameResult(OSymbol)
                {
                    OPoints += 1
                    resultAlert(title: "O Player Win!")
                    OScore.text = String(OPoints)
                }
        
        if fullBoard() {
            resultAlert(title: "Draw")
        }
    }
    
    // Registering the move & deciding who's turn it is
    func addMove(_ sender: UIButton){
        
        if sender.title(for: .normal) == nil{
            if currentTurn == Turn.XMark {
                sender.setTitle(OSymbol, for: .normal)
                currentTurn = Turn.OMark
                turnLable.text = XSymbol
            }
            else if currentTurn == Turn.OMark {
                sender.setTitle(XSymbol, for: .normal)
                currentTurn = Turn.XMark
                turnLable.text = OSymbol
            }
//              sender.isEnabled = false
            
        }
        
        
    }
    
    // Inform which player has won or if the result is a draw
    func resultAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(_) in self.resetBoard()}))
        self.present(alertController, animated: true)
    }
    
    // Reset the game board
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
//            button.isEnabled = true
        }
        if lastTurn == Turn.XMark {
            lastTurn = Turn.OMark
            turnLable.text = XSymbol
        }
        else if lastTurn == Turn.OMark {
            lastTurn = Turn.XMark
            turnLable.text = OSymbol
        }
        currentTurn = lastTurn
    }
    
    // Checking if the board is full
    func fullBoard() -> Bool {
        
        for button in board{
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    // Keep track of the inserted symbol
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool{
        return button.title(for: .normal) == symbol
        
    }
    
    // Checking the result of the game
    func checkGameResult(_ s: String) -> Bool{
        // Horizontal Win
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
                {
                    return true
                }
                if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
                {
                    return true
                }
                if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
                {
                    return true
                }
                
                // Vertical Win
                if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
                {
                    return true
                }
                if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
                {
                    return true
                }
                if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
                {
                    return true
                }
                
                // Diagonal Win
                if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
                {
                    return true
                }
                if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
                {
                    return true
                }
                
                return false
    }
    
}

