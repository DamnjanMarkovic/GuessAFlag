//
//  ViewController.swift
//  Project2
//
//  Created by Damnjan Markovic on 23/07/2020.
//  Copyright © 2020 Damnjan Markovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showScoreTapped))
        
        addCountries()
        setButtons()
        askQuestion(action: nil)

    }

    @objc func showScoreTapped() {
        let ac = UIAlertController(title: "Your score is", message: "\(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue playing", style: .default, handler: nil))
        present(ac, animated: true)
        
    }
    func addCountries() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func askQuestion(action: UIAlertAction!) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased()) |||  Score:\(score) |||  Question: \(questionAsked+1)"
    }
    
    func setButtons() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }

    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
            questionAsked += 1
        } else {
            title  = "Wrong!\nThat is the flag of \(countries[sender.tag].capitalized)."
            score -= 1
            questionAsked += 1
        }
        if questionAsked == 10 {
            let ac = UIAlertController(title: title, message: "Finished! Your total score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play again!", style: .default, handler: askQuestion))
            score = 0
            questionAsked = 0
            present(ac, animated: true)
            
            
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    

}

