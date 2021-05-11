//
//  ViewController.swift
//  Adatia_Shayn_Dice
//
//  Created by Period Two on 2019-03-18.
//  Copyright © 2019 Period Two. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //creates the outlet for the first dice image
    @IBOutlet weak var dice1: UIImageView!
    //creates the outlet for the second dice image
    @IBOutlet weak var dice2: UIImageView!
    //creates the outlet for the roll number text label
    @IBOutlet weak var rollNumber: UILabel!
    //creates the outlet for the current roll value text label
    @IBOutlet weak var rollVal: UILabel!
    //creates the outlet for the total roll value text label
    @IBOutlet weak var totalRollVal: UILabel!
    //creates the outlet for the roll button
    @IBOutlet weak var rollButton: UIButton!
    //creates the outlet for the new game button
    @IBOutlet weak var newGame: UIButton!
    //creates a variable that stores the value of the roll number
    var rollNum = 0
    //creates a variable that stores the value of the first roll
    var roll1 = 0
    //creates a variable that stores the value of the second roll
    var roll2 = 0
    //creates a variable that stores the value of the total roll
    var totalRoll = 0
    //creates a function to be executed when the "roll" button is pressed
    @IBAction func rollDice(_ sender: UIButton) {
        //transitions from the first dice image to a random dice face
        UIView.transition(with: self.dice1, duration: 0.7, options: .transitionFlipFromTop, animations: {self.dice1.image = UIImage(named: "dice-six-faces-\(Int.random(in: 1...6))")}, completion: nil)
          //transitions from the second dice image to a random dice face
          UIView.transition(with: self.dice2, duration: 0.7, options: .transitionFlipFromTop, animations: {self.dice2.image = UIImage(named: "dice-six-faces-\(Int.random(in: 1...6))")}, completion: nil)
        //increments the rollNum variable by 1 to account for a new roll
        rollNum += 1
        //assigns the rollNum variable to the text property of the roll number text label
        rollNumber.text = String(rollNum)
        //creates an if statement that assigns the appropriate value to the roll1 value depending on the die face image that is shown
        if dice1.image == UIImage(named: "dice-six-faces-1") {
            roll1 = 1
        } else if dice1.image == UIImage(named: "dice-six-faces-2") {
            roll1 = 2
        } else if dice1.image == UIImage(named: "dice-six-faces-3") {
            roll1 = 3
        } else if dice1.image == UIImage(named: "dice-six-faces-4") {
            roll1 = 4
        } else if dice1.image == UIImage(named: "dice-six-faces-5") {
            roll1 = 5
        } else if dice1.image == UIImage(named: "dice-six-faces-6") {
            roll1 = 6
        }
        //creates a switch statement that assigns the appropriate value to the roll2 value depending on the die face image that is shown
        switch dice2.image {
        case UIImage(named: "dice-six-faces-1"):
            roll2 = 1
        case UIImage(named: "dice-six-faces-2"):
            roll2 = 2
        case UIImage(named: "dice-six-faces-3"):
            roll2 = 3
        case UIImage(named: "dice-six-faces-4"):
            roll2 = 4
        case UIImage(named: "dice-six-faces-5"):
            roll2 = 5
        case UIImage(named: "dice-six-faces-6"):
            roll2 = 6
        default:
            roll2 = 0
        }
        //creates a constant that stores the value of roll1 plus roll2
        let currentRoll = roll1 + roll2
     //assigns a string that shows the value of the first and second die, as well as the total value of the current roll
     rollVal.text = "\(roll1) + \(roll2) = \(currentRoll)"
    //adds the value of the current roll to the totalRoll variable
    totalRoll += currentRoll
     //converts the value of the totalRoll variable to type string and assigns it to the text property of the total roll value text label
     totalRollVal.text = String(totalRoll)
        //creates an if statement that hides the roll button, reveals a hidden new game button and shows a game over alert box after the player rolls 25 times
        if rollNum == 25 {
            rollButton.isHidden = true
            newGame.isHidden = false
            let alertController = UIAlertController(title: "Game Over", message:
                "You lost, your score was \(totalRoll). Better luck next time :)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue wasting my life", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
 }
    //creates a function to be executed when the new game button is pressed; reveals the roll button, hides the new game button and resets the roll number, current roll value and total roll value variables to 0
    @IBAction func newGameFunc(_ sender: UIButton) {
        rollButton.isHidden = false
        newGame.isHidden = true
        totalRoll = 0
        rollNum = 0
        rollVal.text = String(0)
        totalRollVal.text = String(totalRoll)
        rollNumber.text = String(rollNum)
        }
    }

