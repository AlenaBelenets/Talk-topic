//
//  QuestionViewController.swift
//  Talk topic
//
//  Created by Alena Belenets on 10.11.2022.
//

import UIKit

class QuestionViewController: UIViewController {

// MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!

    @IBOutlet weak var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }

    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitch: [UISwitch]!
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var rangedLabels: [UILabel]!

    private let questions = Question.getQuestion()
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }



// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
// MARK: - IBActions
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
               let answer = currentAnswers[buttonIndex]
               answersChosen.append(answer)
               nextQuestion()
    }

    @IBAction func multipleButtonAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitch, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
        
    }

    @IBAction func rangedButtonAnswerPressed() {
        let index = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    


}

// MARK: - Private Methods
extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }

        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title

        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)

        title = "Question № \(questionIndex + 1) of \(questions.count)"

        showCurrentAnswers(for: currentQuestion.type)
    }

    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangeStackView(with: currentAnswers)
        }
    }

    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false

        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }

    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false

        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }

    private func showRangeStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false

        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }

    private func nextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            updateUI()
            return
        }

        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
