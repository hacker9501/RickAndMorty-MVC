//
//  ViewController.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import UIKit

class ViewController: UIViewController {

    var mainView: CharacterListView {self.view as! CharacterListView}
    let apiclient = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task{
            let characters = await apiclient.getLisOfCharacters()
            print("datos character : \(characters)")
        }
    }

    override func loadView() {
        view = CharacterListView()
    }

    
}

