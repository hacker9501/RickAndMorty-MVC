//
//  CharacterListViewCell.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import Foundation
import UIKit
import Kingfisher

class CharacterListViewCell: UITableViewCell{
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterspecie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews(){
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(characterspecie)
        
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalToConstant: 80),
            
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            characterName.topAnchor.constraint(equalTo: characterImageView.topAnchor),
           
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor,constant: 8),
            
            characterspecie.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            characterspecie.topAnchor.constraint(equalTo: characterStatus.bottomAnchor,constant: 8),
        ])
        
    }
    
    func configure(_ model: CharacterModel){
        self.characterName.text = model.name
        self.characterspecie.text = model.species
        self.characterStatus.text = model.status
        self.characterImageView.kf.setImage(with:URL(string: model.image))
    }
}
