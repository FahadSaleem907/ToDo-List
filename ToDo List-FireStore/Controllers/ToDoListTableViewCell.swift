import UIKit

class ToDoListTableViewCell: UITableViewCell
{

    @IBOutlet weak var Task: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        statusImg.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    
    }

}
