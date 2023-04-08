//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupResultLabels()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        
    }
    
    private func getResultAnimal(from answers: [Answer]) -> Animal {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        for answer in answers {
            switch answer.animal {
                
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        let mostFrequentAnimal = max(
            dogCount,
            catCount,
            rabbitCount,
            turtleCount
        )
        var resultAnimal: Animal = .dog
        
        if mostFrequentAnimal == dogCount {
            resultAnimal = .dog
        } else if mostFrequentAnimal == catCount {
            resultAnimal = .cat
        } else if mostFrequentAnimal == rabbitCount {
            resultAnimal = .rabbit
        } else if mostFrequentAnimal == turtleCount {
            resultAnimal = .turtle
        }
        return resultAnimal
    }
    private func setupResultLabels() {
        let resultAnimal = getResultAnimal(from: answers)
        resultLabel.text = "Вы - \(resultAnimal.rawValue)"
        resultDescriptionLabel.text = resultAnimal.definition
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
