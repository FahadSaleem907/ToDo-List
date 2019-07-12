import UIKit

class addDataViewController: UIViewController
{
    let pickerView = UIPickerView()
    let datePicker = UIDatePicker()
    let priorities = ["Low" , "Medium" , "High" ]
    
    @IBOutlet weak var taskDetails: fancyTextField!
    @IBOutlet weak var taskPriority: fancyTextField!
    @IBOutlet weak var dateTxt: fancyTextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        taskPriority.inputView = pickerView
        taskPriority.delegate = self
        pickerView.delegate = self
        
        showDatePicker()
        createPriorityToolbar()
        createDateToolbar()
    }
}

extension addDataViewController
{
    private func showDatePicker()
    {
        datePicker.datePickerMode = .date
        dateTxt.inputView = datePicker
    }
    
    @objc private func dateSelected()
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd / MM / yyyy"
        //dateFormat.dateFormat = "E, dd MM yyyy HH:MM:SS Z"
        dateFormat.timeZone = TimeZone(secondsFromGMT: 0)!
        dateTxt.text = dateFormat.string(from: datePicker.date)
        print(dateTxt.text!)
        self.view.endEditing(true)
    }
    
    func createDateToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dateSelected))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        dateTxt.inputAccessoryView = toolBar
    }
    
    @objc func donePressed()
    {
        view.endEditing(true)
    }
}


extension addDataViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return priorities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return priorities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        taskPriority.text = priorities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label:UILabel
        
        if let view = view as? UILabel
        {
            label = view
        }
        else
        {
            label = UILabel()
        }
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 20)
        
        label.text = priorities[row]
        
        return label
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == taskPriority
        {
            return false
        }
        else if textField == dateTxt
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    func createPriorityToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(prioritySelected))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        
        taskPriority.inputAccessoryView = toolBar
    }
    
    @objc private func prioritySelected()
    {
        self.view.endEditing(true)
    }
}
