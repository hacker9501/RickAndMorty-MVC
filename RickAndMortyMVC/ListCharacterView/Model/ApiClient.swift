//
//  ApiClient.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import Foundation

final class ApiClient{
    func getLisOfCharacters() async -> CharacterModelResponse {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let(data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
