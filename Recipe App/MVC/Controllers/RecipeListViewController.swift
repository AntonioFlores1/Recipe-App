//
//  ViewController.swift
//  Recipe App
//
//  Created by Antonio Flores on 6/8/21.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var recipeListTableView: UITableView!
    @IBOutlet weak var recipeListSearchBar: UISearchBar!
    
    let recipeModel = Recipe.getRecipes()
    
    var filteredRecipeList = [Recipe](){
        didSet {
            recipeListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateDatasourceSetup()
        filteredRecipeList = recipeModel
        self.recipeListTableView.keyboardDismissMode = .onDrag
    }
    
    func delegateDatasourceSetup(){
        recipeListTableView.dataSource = self
        recipeListTableView.delegate = self
        recipeListSearchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "descriptionVC" {
            guard let recipeData = sender as? Recipe else {return}
            if let descriptionVC = segue.destination as? DescriptionViewController {
                descriptionVC.recipeModel = recipeData
            }
        }
    }
}


extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let recipeListCell = recipeListTableView.dequeueReusableCell(withIdentifier: "recipeListCell", for: indexPath) as? RecipeListTableViewCell else {return UITableViewCell() }
        
        recipeListCell.recipeImage.image = filteredRecipeList[indexPath.row].image
        recipeListCell.recipeName.text = filteredRecipeList[indexPath.row].name
        recipeListCell.recipeRating.text = "Rating: \(filteredRecipeList[indexPath.row].rating)"
        
        return recipeListCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "descriptionVC", sender: self.filteredRecipeList[indexPath.row])
    }
    
    
}

extension RecipeListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            filteredRecipeList = recipeModel
        }  else {
            filteredRecipeList = recipeModel.filter({$0.name.contains(searchText)})
            recipeListTableView.restore()
        }
        if  filteredRecipeList.isEmpty {
            recipeListTableView.setEmptyMessage("No Results Found")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        recipeListSearchBar.resignFirstResponder()
    }
}

