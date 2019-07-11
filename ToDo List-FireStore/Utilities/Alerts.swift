import Foundation
import UIKit

class alerts : UIAlertController
{
    func successAlert(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    func failureAlert(msg:String , controller:UIViewController)
    {
        let alertValidation = UIAlertController(title: "Failed", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
}
