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

    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getResultAnimal(from answers: [Answer]) -> Animal {
        let countedAnswers = NSCountedSet(array: answers)
        let mostFrequentAnimal = countedAnswers.max { countedAnswers.count(for: $0) < countedAnswers.count(for: $1)}
        
        return mostFrequentAnimal as! Animal
        }
    private func setupResultLabels() {
        
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
