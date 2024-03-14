//
//  CharacterListViewController.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import Foundation
import UIKit

class CharacterDetaViewController: UIViewController {

    var mainView: CharacterListView {self.view as! CharacterListView}
    let apiclient = ApiClient()
    private var tableViewDatasource: ListOfCharacterTableViewDatasourse?
    private var tableviewDelegate: ListCharacterTableViewDelegate?
    
    override func loadView() {
        view = CharacterListView()
        tableviewDelegate = ListCharacterTableViewDelegate()
        
        tableViewDatasource = ListOfCharacterTableViewDatasourse(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDatasource
        mainView.charactersTableView.delegate = tableviewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task{
            let characters = await apiclient.getLisOfCharacters()
            print("datos character : \(characters)")
            
            tableViewDatasource?.set(characters: characters.results)
        }
    }
    
}
