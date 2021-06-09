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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension RecipeListViewController: UISearchBarDelegate {
    
}


