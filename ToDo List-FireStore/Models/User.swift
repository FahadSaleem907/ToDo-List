import Foundation
import UIKit

struct User : Codable
{
    var name : String?
    var email : String?
    var password : String?
    
    enum CodingKeys: String, CodingKey
    {
        case name       = "name"
        case email      = "email"
        case password   = "password"
    }
    
    init(from decoder: Decoder) throws
    {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
            name        = try values.decodeIfPresent(String.self, forKey: .name)
            email       = try values.decodeIfPresent(String.self, forKey: .email)
            password    = try values.decodeIfPresent(String.self, forKey: .password)
    }
}
