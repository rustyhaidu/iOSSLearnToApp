//
//  ViewController.swift
//  LearnToApp
//
//  Created by Alin Zdurlan on 22/09/2018.
//  Copyright © 2018 Alin Zdurlan. All rights reserved.
//
import UIKit

enum TimeOfDay: String {
    case Dimineata = "Dimineata"
    case Pranz = "Pranz"
    case Seara = "Seara"
}

class ViewController: UIViewController {
    @IBOutlet weak var timeOfDayLabel: UILabel!
    @IBOutlet weak var sunImage: UIImageView!    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var passedDay: UILabel!
    
    
    var n = 0
    var dayNumber = 0;
    
    var timeOfDay = TimeOfDay.Dimineata
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        
        self.passedDay.text = "Day: " + String(dayNumber)
        
        switch timeOfDay {
        case .Dimineata:
            timeOfDay = .Pranz
            sunImage.image = #imageLiteral(resourceName: "sun_summer")
            
            self.background.alpha = 1
            
            UIView.animate(withDuration: 1) {
                self.sunImage.frame = CGRect(x: self.view.center.x-50, y: 120, width: 100, height: 100)
            }
        case .Pranz:
            timeOfDay = .Seara
            sunImage.image = #imageLiteral(resourceName: "sum_winter")
            self.background.alpha = 0.5
            
            UIView.animate(withDuration: 1) {
                self.sunImage.frame = CGRect(x: self.view.frame.width-50, y: 166, width: 100, height: 100)
            }
            
            
        default:
            timeOfDay = .Dimineata
            sunImage.image = #imageLiteral(resourceName: "sun_autumn")
            
            self.background.alpha = 0.5
            
            UIView.animate(withDuration: 1) {
                self.sunImage.frame = CGRect(x: self.view.frame.origin.x-50, y: 166, width: 100, height: 100)
            }
        }
        timeOfDayLabel.text = timeOfDay.rawValue.uppercased()
        
        n+=1
        
        if( n == 3){
            // a mai trecut o zi
            self.passedDay.text = "Another Day has passed!"
            dayNumber += 1
            n = 0
            
            let alert = UIAlertController(title: "Success", message: "Salut a trecut o zi", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel){
             (action) in
            }
            
            alert.addAction(okAction)
            present(alert, animated: true){
                
            }
            
        }
        
    }
    
    
}
