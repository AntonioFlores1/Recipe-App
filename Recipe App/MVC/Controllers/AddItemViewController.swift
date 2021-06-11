//
//  AddItemViewController.swift
//  Recipe App
//
//  Created by Antonio Flores on 6/9/21.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var addItemTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemTabelView.delegate = self
        addItemTabelView.dataSource = self

    }


}

extension AddItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}
