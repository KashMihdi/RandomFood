//
//  MainViewController.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 26.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet var mealTimeLabels: [UILabel]!
    @IBOutlet weak var findRecipeButton: UIButton!
    
    @IBOutlet var mealTimeViews: [UIView]!
    
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    private var mealSelector: MealTime = .breakfast
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        findRecipeButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 22)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        breakfastButton.isSelected = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        switch sender {
        case breakfastButton:
            breakfastButton.isSelected = true
            lunchButton.isSelected = false
            dinnerButton.isSelected = false
            mealSelector = .breakfast
        case lunchButton:
            breakfastButton.isSelected = false
            lunchButton.isSelected = true
            dinnerButton.isSelected = false
            mealSelector = .lunch
        default:
            breakfastButton.isSelected = false
            lunchButton.isSelected = false
            dinnerButton.isSelected = true
            mealSelector = .dinner
        }
    }
    
    @IBAction func generateButtonPressed() {
        
        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        
        let receipt = Receipt.getReceipt(with: mealSelector, calories: Int(caloriesTextField.text ?? ""))
        
        if let receipt {
            secondVC.str = receipt.nameOfReceipt
            self.navigationController?.pushViewController(secondVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Нет подходящего рецепта", message: "Зарандомим?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) {  _ in

                let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
                guard let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
                secondVC.str = Receipt.getReceipt(with: self.mealSelector, calories: nil)?.nameOfReceipt
                self.navigationController?.pushViewController(secondVC, animated: true)
            }

            let cancelButton = UIAlertAction(title: "Выход", style: .default)

            let actions = [okButton, cancelButton]
            alert.setValue(actions, forKey: "actions")

            present(alert, animated: true)
        }
    }
    
    
    
    private func setupUI() {
        mealTimeLabels.forEach{ label in
            label.font = UIFont(name: "Gilroy-Medium", size: 22)
        }
        
        caloriesTextField.font = UIFont(name: "Gilroy-Medium", size: 22)
        
        if let placeholder = caloriesTextField.placeholder {
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: "Gilroy-Medium", size: 22)
            ]
            caloriesTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes as [NSAttributedString.Key : Any])
        }
        for button in [breakfastButton, lunchButton, dinnerButton] {
            button?.setImage(
                UIImage(systemName: "circle.inset.filled"),
                for: .selected
            )
            button?.setImage(
                UIImage(systemName: "circle"),
                for: .normal
            )
            button?.isSelected = false
            button?.layer.cornerRadius = 14
        }
        
        for view in mealTimeViews {
            view.clipsToBounds = true
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
