//
//  DescriptionViewController.swift
//  Recipe App
//
//  Created by Antonio Flores on 6/8/21.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeRatingLabel: UILabel!
    @IBOutlet weak var recipeDecTextView: UITextView!
    
    var recipeModel: Recipe?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionSetup()
    }
    
    func descriptionSetup(){
        if let recipeModel = recipeModel {
            recipeDecTextView.isEditable = false
            recipeImage.image = recipeModel.image
            recipeNameLabel.text = recipeModel.name
            recipeRatingLabel.text = "Rating: \(recipeModel.rating)"
            recipeDecTextView.text = recipeModel.description
        } else {return}
    }

    

}
