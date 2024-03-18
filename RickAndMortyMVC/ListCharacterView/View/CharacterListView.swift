//
//  CharacterListView.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import Foundation
import UIKit

class CharacterListView: UIView{
    
    let charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListViewCell.self, forCellReuseIdentifier: "CharacterListViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(charactersTableView)
        
        NSLayoutConstraint.activate([
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
