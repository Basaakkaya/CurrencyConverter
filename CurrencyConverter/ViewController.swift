//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Başak Kaya on 1.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiManager = ApiManager()
        apiManager.fetchCurrencyData { response in
            self.setData(jsonResponse: response)
        } onError: { error in
            self.presentAlert(error: error)
            
        }

        // Do any additional setup after loading the view.
    }
    private func presentAlert(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    private func setData(jsonResponse: Dictionary<String, Any>) {
        if let rates = jsonResponse["rates"] as? [String : Any] {
            //print(rates)
            
            if let cad = rates["CAD"] as? Double {
                self.cadLabel.text = "CAD: \(cad)"
            }
            if let chf = rates["CHF"] as? Double {
                self.chfLabel.text = "CHF: \(chf)"
            }
            if let gbp = rates["GBP"] as? Double {
                self.gbpLabel.text = "GBP: \(gbp)"
            }
            if let jpy = rates["JPY"] as? Double {
                self.jpyLabel.text = "JPY: \(jpy)"
            }
            if let usd = rates["USD"] as? Double {
                self.usdLabel.text = "USD: \(usd)"
            }
            if let turkish = rates["TRY"] as? Double {
                self.tryLabel.text = "TRY: \(turkish)"
            }
        }
    }
    
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
  
    }
}
