//
//  ViewController.swift
//  DayFinder
//
//  Created by Artjoms Vorona on 28/10/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet var dateTextFields: [UITextField]!
    
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitialViewSettings()
    }

    func setInitialViewSettings() {
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.backgroundColor = .systemGray
        navBarAppearence.largeTitleTextAttributes =  [NSAttributedString.Key.foregroundColor : UIColor.systemTeal]
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        
        self.view.backgroundColor = .systemGray2
        
        for textField in dateTextFields {
            textField.backgroundColor = .systemGray5
            textField.clearButtonMode = .always
        }
        
        findButton.backgroundColor = .systemGray5
        findButton.layer.cornerRadius = 4
        findButton.layer.borderColor = UIColor.white.cgColor
        findButton.layer.borderWidth = 2
        findButton.setTitleColor(.systemTeal, for: .normal)
    }
    
    
    @IBAction func findButtonTouched(_ sender: UIButton) {
        guard let day = Int(dayTextField.text!) else {
            basicWrongDateAlertIn(fieldName: "day")
            return
        }
        guard let month = Int(monthTextField.text!) else {
            basicWrongDateAlertIn(fieldName: "month")
            return
        }
        guard let year = Int(yearTextField.text!) else {
            basicWrongDateAlertIn(fieldName: "year")
            return
        }
        
        if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
            dayOfWeekLabel.text = findWeekdayFor(day: day, month: month, year: year)
        } else {
            continueWithWrongDateAlert(day: day, month: month, year: year)
        }
    }
    
    func findWeekdayFor(day: Int, month: Int, year: Int) -> String {
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        let calendar = Calendar.current
        if let dateToFind = calendar.date(from: dateComponents) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.locale = Locale(identifier: "lv_LV")
        
        return dateFormatter.string(from: dateToFind).localizedCapitalized
        } else {
            return "Unable ot find date"
        }
    }
    
    func basicWrongDateAlertIn(fieldName: String) {
        let alert = UIAlertController(title: "Wrong \(fieldName)!", message: "Please enter correct \(fieldName)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func continueWithWrongDateAlert(day: Int, month: Int, year: Int) {
        let alert = UIAlertController(title: "Wrong date!", message: "Would you like to continue?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Change date", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (alert) in
            self.dayOfWeekLabel.text = self.findWeekdayFor(day: day, month: month, year: year)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

