//
//  LocationScreenViewController.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 14.05.2023.
//

import UIKit

protocol SearchScreenInterface : AnyObject{
    func configureVC()
    func configureTextField()
    func textFieldDidChange(_ textField: UITextField)
    func configureCollectionView()
    func performSearch()
    func reloadCollectionView()
    func navigateToCharacterDetailPage(character: Character)
}

class SearchScreen: UIViewController {
    private let viewModel = SearchViewModel()
    
    private var searchTextField: UITextField!
    private var collectionView: UICollectionView!
    var searchTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension SearchScreen: SearchScreenInterface {
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configureTextField() {
        searchTextField = UITextField(frame: .zero)
        searchTextField.placeholder = "Search"
        searchTextField.layer.borderWidth = 2.0
        searchTextField.layer.cornerRadius = 16
        searchTextField.layer.borderColor = UIColor.systemGray4.cgColor
        searchTextField.borderStyle = .roundedRect
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createSearchFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchItemCell.self, forCellWithReuseIdentifier: SearchItemCell.reuseId)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        viewModel.searchText = textField.text ?? "" 
        searchTimer?.invalidate()
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: viewModel.searchTimeout, repeats: false) { [weak self] _ in
            self?.performSearch()
        }
    }
    
    func performSearch() {
        guard let searchText = searchTextField.text else { return }
        viewModel.performSearch(searchText: searchText)
    }
    
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    func navigateToCharacterDetailPage(character: Character){
        DispatchQueue.main.async {
            let detailPage = CharacterDetailScreen(character: character)
            self.navigationController?.pushViewController(detailPage, animated: true)
        }
    }
    
}

extension SearchScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchItemCell.reuseId, for: indexPath) as! SearchItemCell
        cell.setCell(character: viewModel.filteredCharacters[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.openCharacterDetailPage(character: viewModel.filteredCharacters[indexPath.item])
    }
}
