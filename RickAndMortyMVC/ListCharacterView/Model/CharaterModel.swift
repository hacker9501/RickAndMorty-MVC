//
//  CharaterModel.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import Foundation

struct CharacterModel: Decodable{
    let name : String
    let status: String
    let species: String
    let image :String
}
