import Foundation
import UIKit

struct User : Codable
{
    var name : String?
    var email : String?
    var password : String?
    var task : Task?
    
    enum CodingKeys: String, CodingKey
    {
        case name       = "name"
        case email      = "email"
        case password   = "password"
        case task       = "task"
    }
    
    init(from decoder: Decoder) throws
    {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
            name        = try values.decodeIfPresent(String.self, forKey: .name)
            email       = try values.decodeIfPresent(String.self, forKey: .email)
            password    = try values.decodeIfPresent(String.self, forKey: .password)
            task        = try values.decodeIfPresent(Task.self,   forKey: .task)
    }
    
    init( name : String , email : String , password : String , task : Task? )
    {
        self.name       = name
        self.email      = email
        self.password   = password
        self.task       = task
    }
}
