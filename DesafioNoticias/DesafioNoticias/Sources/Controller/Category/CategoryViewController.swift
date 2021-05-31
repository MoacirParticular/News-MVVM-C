//
//  CategoryViewController.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class CategoryViewController: UIViewController {
    // MARK: Actions
    var onCategoryButton: ((_ category: CategoryType) -> Void)?
    
    //MARK: - Propertys
    var categoryView = CategoryView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Categorias de Notícias"
        
        setActions()
    }
    
    override func loadView() {
        self.view = categoryView
    }
    
    private func setActions() {
        categoryView.onCategoryButton = { category in
            self.onCategoryButton?(category)
        }
    }
}
