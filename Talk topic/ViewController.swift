//
//  ViewController.swift
//  Talk topic
//
//  Created by Alena Belenets on 09.11.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private Properties
    private let primaryColor = UIColor(
        red: 56/255,
        green: 17623/255,
        blue: 123/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 69/255,
        green: 55/255,
        blue: 255/255,
        alpha: 0.75
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }


}
// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
