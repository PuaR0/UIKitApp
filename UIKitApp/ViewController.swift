//
//  ViewController.swift
//  UIKitApp
//
//  Created by Алиага С on 15.6.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneButtone: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButtone.setTitle("Done", for: .normal)
        
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.minimumTrackTintColor = .blue
        slider.thumbTintColor = .brown
        
        mainLabel.text = String(slider.value)
        
        datePicker.locale = Locale(identifier: "ru_RU")
        
    }
    @IBAction func segmrntedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Вы находитесь на первом сегменте"
            mainLabel.textColor = .blue
        case 1:
            mainLabel.text = "Вы находитесь на втором сегменте"
            mainLabel.textColor = .green
        default:
            mainLabel.text = "Вы находитесь на третьем сегменте"
            mainLabel.textColor = .orange
        }
    }
    
    @IBAction func sliderAction() {
        
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
        
    }
    
    @IBAction func doneButtonPressed() {
        
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(title: "Text field is empty", massage: "Please enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format", massage: "Please enter your name")
            return
        }
        
        mainLabel.text = textField.text
        textField.text = ""
    }
    
    @IBAction func chooseDate() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.locale = Locale(identifier: "ru_RU")
        mainLabel.text = dateFormater.string(from: datePicker.date)
    }
    
    
}

//MARK: - Alert controller
extension ViewController {
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
