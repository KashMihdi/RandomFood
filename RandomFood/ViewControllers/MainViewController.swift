//
//  MainViewController.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 26.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet var mealTimeLabels: [UILabel]!
    @IBOutlet weak var findRecipeButton: UIButton!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    @IBOutlet var mealTimeViews: [UIView]!
    
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    // MARK: - Private properties
    private var mealSelector: MealTime = .breakfast
    private var alertView: AlertView!
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        findRecipeButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 22)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        caloriesTextField.text = ""
    }
    
    // MARK: - Keyboard setting
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultTableViewController else { return }
        resultVC.receipts = sender as? Receipt
    }
    
    // MARK: - IBActions
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

        let receipt = Receipt.getReceipt(with: mealSelector, calories: Int(caloriesTextField.text ?? ""))

        if let receipt {
            performSegue(withIdentifier: "Result", sender: receipt)
        } else {
            setAlert()
        }
        
    }
    
    @objc func cancelButtonTapped() {
        alertView.removeFromSuperview()
        blurEffect.alpha = 0
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func randomButtonTapped() {
        let receipt = Receipt.getReceipt(with: self.mealSelector, calories: nil)
        
        alertView.removeFromSuperview()
        blurEffect.alpha = 0
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
        
        performSegue(withIdentifier: "Result", sender: receipt)
    }
    
    
    // MARK: - Setup UI
    private func setupUI() {
        blurEffect.alpha = 0
        
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
        
        breakfastButton.isSelected = true
    }
    
    // MARK: - AlertController
    private func setAlert() {
        alertView = Bundle.main.loadNibNamed("AlertView", owner: self)?.first as? AlertView
        view.addSubview(alertView)
        alertView.center = view.center
        
        alertView.alertView.layer.cornerRadius = 30
        alertView.titleLabel.font = UIFont(name: "Gilroy-Bold", size: 21)
        alertView.messageLabel.font = UIFont(name: "Gilroy-Medium", size: 18)
        alertView.cancelButton.layer.cornerRadius = 16
        
        var configCancel = alertView.cancelButton.configuration
        configCancel?.title = "Выход"
        configCancel?.attributedTitle?.font = UIFont(name: "Gilroy-Bold", size: 20)
        alertView.cancelButton.configuration = configCancel
        alertView.randomButton.layer.cornerRadius = 16
        
        var configRandom = alertView.randomButton.configuration
        configRandom?.title = "Найти"
        configRandom?.attributedTitle?.font = UIFont(name: "Gilroy-Bold", size: 20)
        alertView.randomButton.configuration = configRandom
        
        blurEffect.alpha = 1
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        alertView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        alertView.randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    

}

// MARK: - UITextFieldDelegate
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
