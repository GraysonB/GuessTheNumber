//
//  ViewController.swift
//  Guess The Number
//
//  Created by Grayson Bianco on 9/6/16.
//  Copyright © 2016 Grayson Bianco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GuessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    let lowerBound = 1
    let upperBound = 100
    //Variables
    var numberToGuess : Int!
    var numberOfGuesses = 0
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        if (guess < lowerBound || guess > upperBound) {
            print("your guess is out of bounds")
            showBoundsAlert()
        } else if (guess > numberToGuess) {
            print("your guess is too high")
            GuessLabel.text = "Go Lower!\n😱"
        } else if (guess < numberToGuess) {
            print("your guess is too low")
            GuessLabel.text = "Go Higher!\n😱"
        } else {
            print("You got it!\n😎")
            showWinAlert()
            GuessLabel.text = "Guess the Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it!", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Win", message: "You won!\nYour number of guesses:\n\(numberOfGuesses)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again!", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

