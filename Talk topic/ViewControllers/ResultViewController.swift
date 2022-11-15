//
//  ResultViewController.swift
//  Talk topic
//
//  Created by Alena Belenets on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var typeOfConversetionLabel: UILabel!
    @IBOutlet weak var talkTopikLabel: UILabel!

    // MARK: - Private Properties
    var answers: [Answer]!

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }

    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    // MARK: - Private Functions
    private func updateResult() {
        var relationshipsChosen: [Relationships: Int] = [:]
        let relationships = answers.map { $0.type }

        for type in relationships {
            if let relationTypeCount = relationshipsChosen[type] {
                relationshipsChosen.updateValue(relationTypeCount + 1, forKey: type)
            } else {
                relationshipsChosen[type] = 1
            }
        }

        let sortedRelationshipsCount = relationshipsChosen.sorted { $0.value > $1.value }
        guard let mostRelationships = sortedRelationshipsCount.first?.key else { return }

        updateUI(with: mostRelationships)
    }

    private func updateUI(with relationType: Relationships) {
        talkTopikLabel.text = relationType.definition
        typeOfConversetionLabel.text = relationType.rawValue
    }

}
