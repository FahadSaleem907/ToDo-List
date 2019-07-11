import Foundation
import UIKit

struct Task : Codable
{
    var date : String?
    var priority : String?
    var task : String?
    
    enum CodingKeys: String, CodingKey
    {
        case date       = "date"
        case priority   = "priority"
        case task       = "task"
    }
    
    init(from decoder: Decoder) throws
    {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
            date        = try values.decodeIfPresent(String.self, forKey: .date)
            priority    = try values.decodeIfPresent(String.self, forKey: .priority)
            task        = try values.decodeIfPresent(String.self, forKey: .task)
    }
    
}
