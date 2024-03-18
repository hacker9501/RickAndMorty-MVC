//
//  ViewController.swift
//  RickAndMortyMVC
//
//  Created by Elver Mayta Hernández on 14/03/24.
//

import UIKit

class CharacterViewController: UIViewController {

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
        
        tableviewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            //present new viewcontroller
            guard let datasource = self?.tableViewDatasource else{
                return
            }
            
            let characterModel = datasource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailViewController, animated: true)
            
        }
        
        // Do any additional setup after loading the view.
        Task{
            let characters = await apiclient.getLisOfCharacters()
            print("datos character : \(characters)")
            
            tableViewDatasource?.set(characters: characters.results)
        }
    }
    
}

