//
//  TigerWreckChickenEatingInsectsViewController.swift
//  DemoGame
//
//  Created by Chao Shin on 2018/4/1.
//  Copyright © 2018 Chao Shin. All rights reserved.
//

import UIKit
import GameplayKit

class TigerWreckChickenEatingInsectsViewController: UIViewController {
    
    @IBOutlet weak var bossScoreLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var stickButton: UIButton!
    @IBOutlet weak var tigerButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    @IBOutlet weak var wormButton: UIButton!
    
    @IBOutlet weak var stickSelsctImageView: UIImageView!
    @IBOutlet weak var tigerSelsctImageView: UIImageView!
    @IBOutlet weak var chickenSelsctImageView: UIImageView!
    @IBOutlet weak var wormSelsctImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var bossCardImageView: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    
    enum Cards: String {
        case stick, tiger, chicken, worm, clear
    }
    
    enum Images: String {
        case background2, background3, background4 , background5
    }
    
    enum GameResult: String {
        case playerWin, bossWin, draw
    }
    
    let bossCards:[Cards] = [.stick, .tiger, .chicken, .worm]
    let background:[Images] = [.background2, .background3, .background4, .background5]

    
    var playerScore:Int = 0
    var bossScore:Int = 0
    
    func hidenSelect(selectCard:Cards){
        
        stickSelsctImageView.isHidden = true
        tigerSelsctImageView.isHidden = true
        chickenSelsctImageView.isHidden = true
        wormSelsctImageView.isHidden = true
        
        switch selectCard{
        case .stick:
            stickSelsctImageView.isHidden = false
        case .tiger:
            tigerSelsctImageView.isHidden = false
        case .chicken:
            chickenSelsctImageView.isHidden = false
        case .worm:
            wormSelsctImageView.isHidden = false
        default:
            break
        }
        
    }
    
    @IBAction func playerChoose(_ sender: UIButton) {
        let randomNumber = GKRandomDistribution( lowestValue: 0, highestValue: bossCards.count - 1 )
        let bossChoose = bossCards[randomNumber.nextInt()]
        var whoWin:GameResult = .bossWin
        
        print("Boss choose \(bossChoose).")
        bossCardImageView.image = UIImage(named: "\(bossChoose)CardImage")
        
        switch sender {
        case stickButton:
            print("Player choose stick.")
            hidenSelect(selectCard: .stick)
            if bossChoose == .tiger {
                whoWin = .playerWin
            }else if bossChoose == .worm {
                whoWin = .bossWin
                
            }else {
                whoWin = .draw
                print("Draw")
            }
        case tigerButton:
            print("Player choose tiger.")
            hidenSelect(selectCard: .tiger)
            if bossChoose == .chicken {
                whoWin = .playerWin
            }else if bossChoose == .stick {
                whoWin = .bossWin
            }else {
                whoWin = .draw
                print("Draw")
            }
        case chickenButton:
            print("Player choose chicken.")
            hidenSelect(selectCard: .chicken)
            if bossChoose == .worm {
                whoWin = .playerWin
            }else if bossChoose == .tiger {
                whoWin = .bossWin
            }else{
                whoWin = .draw
                print("Draw")
            }
        case wormButton:
            print("Player choose worm.")
            hidenSelect(selectCard: .worm)
            if bossChoose == .stick {
                whoWin = .playerWin
            }else if bossChoose == .chicken{
                 whoWin = .bossWin
            }else {
                whoWin = .draw
                print("Draw")
            }
        default:
            break
        }
      
        if whoWin == .bossWin {
            bossScore += 1
            resultImageView.image = UIImage(named: "loseImage")
            resultLabel.text = "你輸了！"
            print("Player lose.")
        }else if whoWin == .playerWin {
            playerScore += 1
            resultImageView.image = UIImage(named: "winImage")
            resultLabel.text = "你贏了！"
            print("Player win.")
        }else {
            resultImageView.image = UIImage(named: "drawImage")
            resultLabel.text = "平手！"
            print("Draw")
        }
        resultImageView.isHidden = false
        resultLabel.isHidden = false
        bossScoreLabel.text = "\(bossScore)"
        playerScoreLabel.text = "\(playerScore)"
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        resultImageView.isHidden = true
        resultLabel.isHidden = true
        bossScore = 0
        playerScore = 0
        bossScoreLabel.text = "\(bossScore)"
        playerScoreLabel.text = "\(playerScore)"
        hidenSelect(selectCard: .clear)
        bossCardImageView.image = UIImage(named: "bossCardImage")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomNumber = GKRandomDistribution( lowestValue: 0, highestValue: background.count - 1 )
        let randomBackground = background[randomNumber.nextInt()]
        print("Background choose \(randomBackground).")
        backgroundImageView.image = UIImage(named: "\(randomBackground)")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
