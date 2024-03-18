//
//  ListCharacterTableViewDelegate.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import Foundation
import UIKit

class ListCharacterTableViewDelegate: NSObject, UITableViewDelegate{
    
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}
