//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var animalImage: UILabel!
    
    @IBOutlet weak var animalDescription: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleAnswers()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func handleAnswers() {
        var catCounter = 0
        var dogCounter = 0
        var rabbitCounter = 0
        var turtleCounter = 0

        var answersQuantity: [AnimalType : Int]
        for answer in answers {
            switch answer.type {
            case .cat:
                catCounter += 1
            case .dog:
                dogCounter += 1
            case .rabbit:
                rabbitCounter += 1
            case .turtle:
                turtleCounter += 1
            }
        }
        answersQuantity = [.dog : dogCounter,
                           .cat : catCounter,
                           .rabbit : rabbitCounter,
                           .turtle : turtleCounter]
        let maxQuantityElement = answersQuantity.max {
            $0.value > $1.value
        }
        
        guard let resultType = maxQuantityElement?.key else {
            return
        }
        if resultType == .dog {
            animalImage.text = String("Вы - \(AnimalType.dog.rawValue)")
            animalDescription.text = AnimalType.self.dog.definition
        } else if resultType == .cat {
            animalImage.text = String("Вы - \(AnimalType.cat.rawValue)")
            animalDescription.text = AnimalType.self.cat.definition
        } else if resultType == .rabbit {
            animalImage.text = String("Вы - \(AnimalType.rabbit.rawValue)")
            animalDescription.text = AnimalType.self.rabbit.definition
        }else if resultType == .turtle {
            animalImage.text = String("Вы - \(AnimalType.turtle.rawValue)")
            animalDescription.text = AnimalType.self.turtle.definition
        }
    }
}
