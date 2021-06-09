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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateDatasourceSetup()
    }

    
    func delegateDatasourceSetup(){
        recipeListTableView.dataSource = self
        recipeListTableView.delegate = self
        recipeListSearchBar.delegate = self
    }
    

}

extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let recipeListCell = recipeListTableView.dequeueReusableCell(withIdentifier: "recipeListCell", for: indexPath) as? RecipeListTableViewCell else {return UITableViewCell() }
        
        recipeListCell.recipeImage.image = recipeModel[indexPath.row].image
        recipeListCell.recipeName.text = recipeModel[indexPath.row].name
        recipeListCell.recipeRating.text = "Rating: \(recipeModel[indexPath.row].rating)"
        return recipeListCell
    }
}

extension RecipeListViewController: UISearchBarDelegate {
    
}


