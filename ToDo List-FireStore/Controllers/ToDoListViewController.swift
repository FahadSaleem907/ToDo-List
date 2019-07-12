import UIKit

class ToDoListViewController: UIViewController
{

    @IBOutlet weak var taskListTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        taskListTableView.delegate      = self
        taskListTableView.dataSource    = self
    }

}

extension ToDoListViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = taskListTableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoListTableViewCell
        
        cell.Task.text = "YOOO"
        cell.date.text = "NOoo"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = taskListTableView.cellForRow(at: indexPath) as! ToDoListTableViewCell
        
        cell.statusImg.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let cell = taskListTableView.cellForRow(at: indexPath) as! ToDoListTableViewCell
        
        cell.statusImg.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let completed = completedAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [completed])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let delete  =   deleteAction(at: indexPath)
        let edit    =   editAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    
    
    
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .destructive, title: "Delete")
        {
            (delete, view, completion) in
            
            func userAlert(msg:String, controller:UIViewController)
            {
                let alertValidation = UIAlertController(title: "", message: msg, preferredStyle: .alert)
                let buttonYes = UIAlertAction(title: "Yes", style: .default)
                {   (_) in print("Delete")    }
                
                let buttonNo = UIAlertAction(title: "No", style: .default, handler: nil)
                alertValidation.addAction(buttonYes)
                alertValidation.addAction(buttonNo)
                self.present(alertValidation, animated: true, completion: nil)
            }
            
            userAlert(msg: "Do you want to delete the selected Task?", controller: self)
        }
        
        
        action.backgroundColor = .red
        action.image = UIImage(named: "delete")
        return action
    }
    
    func editAction(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .normal, title: "Edit")
        {
            (delete, view, completion) in
            
            func userAlert(msg:String, controller:UIViewController)
            {
                let alertValidation = UIAlertController(title: "", message: msg, preferredStyle: .alert)
                let buttonYes = UIAlertAction(title: "Yes", style: .default)
                {   (_) in print("Edit")    }
                
                let buttonNo = UIAlertAction(title: "No", style: .default, handler: nil)
                alertValidation.addAction(buttonYes)
                alertValidation.addAction(buttonNo)
                self.present(alertValidation, animated: true, completion: nil)
            }
            
            userAlert(msg: "Do you want to edit the selected Task?", controller: self)
        }
        
        
        action.backgroundColor = .orange
        action.image = UIImage(named: "edit")
        
        return action
    }
    
    func completedAction(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .destructive, title: "Delete")
        {
            (delete, view, completion) in
            
            func userAlert(msg:String, controller:UIViewController)
            {
                let alertValidation = UIAlertController(title: "", message: msg, preferredStyle: .alert)
                let buttonYes = UIAlertAction(title: "Yes", style: .default)
                {   (_) in print("Delete")    }
                
                let buttonNo = UIAlertAction(title: "No", style: .default, handler: nil)
                alertValidation.addAction(buttonYes)
                alertValidation.addAction(buttonNo)
                self.present(alertValidation, animated: true, completion: nil)
            }
            
            userAlert(msg: "Did you complete the Task?", controller: self)
        }
        
        
        action.backgroundColor = .green
        action.image = UIImage(named: "completed")
        
        return action
    }
}
