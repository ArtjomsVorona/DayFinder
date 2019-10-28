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
        navBarAppearence.largeTitleTextAttributes =  [NSAttributedString.Key.foregroundColor : UIColor.systemOrange]
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
        findButton.setTitleColor(.systemOrange, for: .normal)
    }
    
    
    @IBAction func findButtonTouched(_ sender: UIButton) {
    }
    
}

